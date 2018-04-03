#!groovy
import groovy.json.JsonSlurperClassic 

@NonCPS
def jsonParse(def json) {
    new groovy.json.JsonSlurperClassic().parseText(json)
}

def getAmiId(){
	def packerOut = readFile("packer_output.json")
	print "${packerOut}"
	def packerOutJson = jsonParse(packerOut)
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
	AMI = getAmiId()
	print "${AMI}"
        sh "./runpacker.sh"
    }

    stage('deploy') {
    	sh "aws cloudformation create-stack --stack-name teststack --template-body file://cf_template.json"
    }

}
