
pipeline {
    agent none
    stages {
        stage('Scale Deployment') {
            agent any 
            steps {
              openshiftScale(depCfg: 'spring-petclinic', replicaCount: '2')
            }
        }
        stage('Trigger Build') {
            agent any 
            steps {
              openshiftBuild(bldCfg: 'spring-petclinic', showBuildLogs: 'true')
            }
        }
        stage('Verify Build') {
            agent any 
            steps {
              openshiftVerifyBuild(bldCfg: 'spring-petclinic')
            }
        }
        stage('Tag Image') {
            agent any 
            steps {
              openshiftTag(srcStream: 'spring-petclinic', srcTag: 'latest', destStream: 'spring-petclinic', destTag: 'prod')
            }
        }
        stage('Trigger Deployment') {
            agent any 
            steps {
              openshiftDeploy(depCfg: 'spring-petclinic')
            }
        }
        stage('Verify Deployment') {
            agent any 
            steps {
              openshiftVerifyDeployment(depCfg: 'spring-petclinic', replicaCount: '2')
            }
        }
        stage('Verify Service') {
            agent any 
            steps {
              openshiftVerifyService(svcName: 'spring-petclinic')
            }
        }
    }
}
