#!groovy

node('master') {

    stage('checkout') {
        deleteDir()
        def scmVars = checkout scm
        commitId = scmVars.GIT_COMMIT
    }

    stage('build') {
        sh "runpacker.sh"
    }

    stage('deploy') {
    	sh "aws cloudformation create-stack --stack-name teststack --template-body file://cf_template.json"
    }

}
