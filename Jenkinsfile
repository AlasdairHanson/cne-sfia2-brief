pipeline {
    agent any
    stages {
        stage('ssh into pytest ec2') {
            steps {
                sh 'chmod +x deploy.sh'
                sh './deploy.sh'
            }
        } 
    }
}
