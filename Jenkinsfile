pipeline {
    agent any
    stages {
        stage('ssh into pytest ec2') {
            steps {
                sh 'ssh -i /home/ubuntu/.ssh/id_rsa ubuntu@3.250.22.243'
            }
        } 
    }
}
