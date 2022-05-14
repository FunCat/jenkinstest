#!groovy


pipeline {

    agent { 
        label "master"
    }

    stages {
        stage("Checkout") {
            steps {
                script {
                    deleteDir()
                    def scmVars = checkout scm
                    commitId = scmVars.GIT_COMMIT
                    print("Commit Id = " + commitId)
                }
            }
        }

        stage("Test") {
            steps {
                script {
                    print("Test stage !!!")
                }
            }
        }
    }

}
