podTemplate(label: 'pod-maven', 
    containers: [
        containerTemplate(
            name: 'maven',
            image: 'maven:3.5.0',
            ttyEnabled: true,
            command: 'cat'
        )
    ], volumes: [
        persistentVolumeClaim(mountPath: '/root/.m2/repository-read-only', claimName: 'maven-repo', readOnly: true)
    ]
) {
    node ('pod-maven') {
      stage('Switch to Utility Container'){
        git 'https://github.com/Liatrio-LOK/spring-petclinic.git', branch: 'LOK-14-minimal-pipeline'
        configFileProvider(
        [configFile(fileId: 'nexus', variable: 'MAVEN_SETTINGS')]){
          container('maven') {
              sh("mvn -s $MAVEN_SETTINGS clean deploy")
          }
        }
      }
    }
}
