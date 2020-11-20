pipeline {
    agent any
    stages {
        stage('connect to test vm') {
            steps {
                sh 'chmod +x deploy.sh'
                sh './deploy.sh'
            }
        } 
    }
}
