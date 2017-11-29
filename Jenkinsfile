podTemplate(label: 'mypod', cloud: 'openshift', containers: [
    containerTemplate(name: 'maven', image: 'maven:3.3.9-jdk-8-alpine', ttyEnabled: true, command: 'cat'),
  ]) {

    node('mypod') {
        stage('Get a Maven project') {
            git url: 'https://github.com/liatrio-lok/spring-petclinic.git', branch: env.GIT_BRANCH
            container('maven') {
                stage('Build a Maven project') {
					steps {
						configFileProvider([configFile(fileId: 'nexus', variable: 'MAVEN_SETTINGS')]) {
						  sh 'mvn -s $MAVEN_SETTINGS clean deploy'
						}
					}
                }
            }
        }

    }
}
