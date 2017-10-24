podTemplate(label: 'pod-maven', 
    containers: [
        containerTemplate(
            name: 'maven',
            image: 'maven:3.5.0',
            ttyEnabled: true,
            command: 'cat'
        )
    ]) {
    node ('pod-maven') {
      stage('Switch to Utility Container'){
        git url: 'https://github.com/Liatrio-LOK/spring-petclinic.git', branch: 'LOK-14-minimal-pipeline'
        configFileProvider(
        [configFile(fileId: 'nexus', variable: 'MAVEN_SETTINGS')]){
          container('maven') {
              sh("mvn -s $MAVEN_SETTINGS clean deploy")
          }
        }
      }
    }
}
