pipeline {
    agent any
    stages {
        stage('Connect to Test VM') {
            steps {
                sh 'chmod +x deploy.sh'
                sh './deploy.sh'                
            }
        } 
    }
}
