pipeline {
    agent any
    stages {
        stage('deploy on test vm') {
            steps {
                sh 'chmod +x deploy.sh'
                sh './deploy.sh'
            }
        } 
    }
}
