#!groovy

node('master') {

    stage('checkout') {
        deleteDir()
        def scmVars = checkout scm
        commitId = scmVars.GIT_COMMIT
    }

    stage('build') {
        sh "./runpacker.sh"
	def packerOut = readFile("packer_output.json")
	def packerOutJson = new groovy.json.JsonSlurperClassic().parseText(packerOut)
	print "${packerOut}"
	print "${packerOutJson.builds[0].artifact_id.split(":")[1]}"
	AMI = packerOutJson.builds[0].artifact_id.split(":")[1]
	print "${AMI}"
    }

    stage('deploy') {
    	sh "aws cloudformation create-stack --stack-name teststack --template-body file://cf_template.json"
    }

}
