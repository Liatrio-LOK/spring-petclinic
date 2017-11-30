def artifactUrl

podTemplate(label: 'mvn-build', cloud: 'openshift', containers: [
    containerTemplate(name: 'maven', image: 'maven:3.3.9-jdk-8-alpine', ttyEnabled: true, command: 'cat'),
  ]) {

    node('mvn-build') {
        stage('Get a Maven project') {
            checkout scm
            container('maven') {
                stage('Build Jar') {
                    configFileProvider([configFile(fileId: 'nexus', variable: 'MAVEN_SETTINGS')]) {
                      sh "mvn -s ${MAVEN_SETTINGS} deploy -DskipTests=true | tee build-output.log"
                      artifactUrl = sh (
                        returnStdout: true,
                        script: "grep Uploading.*spring-petclinic-.*jar build-output.log | cut -d' ' -f 2"
                      )
                    }
                }
            }
        }
                    
        stage('Build Image') {
            openshiftBuild (
                namespace: 'petclinic-build', 
                bldCfg: 'petclinic-build', 
                checkForTriggeredDeployments: 'true', 
                env: [[name: 'ARTIFACT_URL', value: artifactUrl]], 
                showBuildLogs: 'true', 
                verbose: 'false'
            )
        }

        stage('Tag Image') {
            openshiftTag (
                sourceStream: 'petclinic',
                sourceTag: 'latest',
                destinationStream: 'petclinic',
                destinationTag: env.BRANCH_NAME,
                destinationNamespace: 'petclinic-build'
            )
        }

    }
}
