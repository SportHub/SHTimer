pipeline {
    agent any
    stages {
        stage ('Bundle') {
            steps {
                ansiColor(colorMapName: 'xterm') {
                    sh 'bundle'
                }
            }
        }
    }
}