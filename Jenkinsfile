#!groovy


pipeline {

    node('master') {
        stage('Сheckout') {
            deleteDir()
            def scmVars = checkout scm
            commitId = scmVars.GIT_COMMIT
            print("Commit Id = " + commitId)
        }

        stage('Test') {
            print("Test stage !!!")
        }
    }
}
