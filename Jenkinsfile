pipeline {
    agent any
    stages {
        stage('ssh into pytest ec2') {
            steps {
                sh './deploy.sh'
            }
        } 
    }
}
