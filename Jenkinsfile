#!groovy

node('master') {

    stage('checkout') {
        deleteDir()
        def scmVars = checkout scm
        commitId = scmVars.GIT_COMMIT
        print("Commit Id = " + commitId)
    }

    stage('test') {
        print("Test stage !!!")
    }
}
