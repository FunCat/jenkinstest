#!groovy
import groovy.json.JsonSlurperClassic 

def getAmiId(){
	def packerOut = readFile("packer_output.json")
	print "${packerOut}"
	def packerOutJson = parseJsonToMap(packerOut)
	print "${packerOutJson.builds[0].artifact_id.split(":")[1]}"
	AMI = packerOutJson.builds[0].artifact_id.split(":")[1]

	return AMI
}

node('master') {

    stage('checkout') {
        deleteDir()
        def scmVars = checkout scm
        commitId = scmVars.GIT_COMMIT
    }

    stage('build') {
        sh "./runpacker.sh"
	AMI = getAmiId()
    }

    stage('deploy') {
    	sh "aws cloudformation create-stack --stack-name teststack --template-body file://cf_template.json --parameters ParameterKey=ImageId,ParameterValue=${AMI}"
    }

}
