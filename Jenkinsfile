pipeline {
    agent any
    stages {
        stage('ssh into pytest ec2') {
            steps {
                sh 'ssh-keygen -t rsa'
                sh 'ssh ubuntu@3.250.22.243'
            }
        } 
    }
}
