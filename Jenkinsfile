#!groovy

node('master') {

    stage('checkout') {
        deleteDir()
        def scmVars = checkout scm
        commitId = scmVars.GIT_COMMIT
    }

    stage('build') {
        bat "mvn clean package"
    }

    stage('deploy') {
    	bat "aws cloudformation create-stack --stack-name MyTestStack --template-body cf_template.json"
    }

}