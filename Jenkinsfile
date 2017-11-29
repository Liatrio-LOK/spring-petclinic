podTemplate(label: 'mvn-build', cloud: 'openshift', containers: [
    containerTemplate(name: 'maven', image: 'maven:3.3.9-jdk-8-alpine', ttyEnabled: true, command: 'cat'),
  ]) {

    node('mvn-build') {
        stage('Get a Maven project') {
			checkout scm
            container('maven') {
                stage('Build a Maven project') {
					configFileProvider([configFile(fileId: 'nexus', variable: 'MAVEN_SETTINGS')]) {
					  sh 'mvn -s $MAVEN_SETTINGS clean deploy -DskipTests=true'
					}
                }
            }
        }

    }
}
