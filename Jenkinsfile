#!groovy


pipeline {

    agent { 
        label "master"
    }

    stages {
        stage("Checkout") {
            steps {
                deleteDir()
                def scmVars = checkout scm
                commitId = scmVars.GIT_COMMIT
                print("Commit Id = " + commitId)
            }
        }

        stage("Test") {
            steps {
                print("Test stage !!!")
            }
        }
    }

}
