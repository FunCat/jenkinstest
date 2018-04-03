#!groovy

import groovy.json.JsonSlurper

node('master') {

    stage('checkout') {
        deleteDir()
        def scmVars = checkout scm
        commitId = scmVars.GIT_COMMIT
    }

    stage('build') {
	def inputFile = new File("./packer_output.json")
	def InputJSON = new JsonSlurper().parseText(inputFile.text)
	InputJSON.each{ println it }
        sh "./runpacker.sh"
    }

    stage('deploy') {
    	sh "aws cloudformation create-stack --stack-name teststack --template-body file://cf_template.json"
    }

}
