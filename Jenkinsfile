
pipeline {
    agent none
    stages {
        /*stage('Scale Deployment') {
            agent any 
            steps {
            }
        }*/
        stage('Trigger Build') {
            agent any 
            steps {
              openshiftBuild(bldCfg: 'spring-petclinic', showBuildLogs: 'true')
            }
        }
        stage('Trigger Deployment') {
            agent any 
            steps {
              openshiftDeploy(depCfg: 'spring-petclinic')
            }
        }
        /*stage('Verify Service') {
            agent any 
            steps {
            }
        }
        stage('Tag Image') {
            agent any 
            steps {
            }
        }
        stage('Verify Deployment') {
            agent any 
            steps {
            }*/
        }
    }
