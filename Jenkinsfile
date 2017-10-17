podTemplate(label: 'pod-golang', 
    containers: [
        containerTemplate(
            name: 'maven',
            image: 'maven:3.5.0',
            ttyEnabled: true,
            command: 'cat'
        )
    ]
) {
    node ('pod-golang') {

        stage 'Switch to Utility Container'
        container('maven') {
            sh("mvn clean package")
        }
    }
}
