#!groovy

node{
    deleteDir()
    
    stage("Checkout") {
        def scmVars = checkout scm
        commitId = scmVars.GIT_COMMIT
        print("Commit Id = " + commitId)
    }

    stage("Test") {
        print("Test stage !!!")
        sh 'gradle -version'
    }
}
