pipeline {
    agent any
    stages {
        stage('ssh into pytest ec2') {
            steps {
                sh 'ssh -i /home/ubuntu/.ssh/id_rsa.pub ubuntu@ec2-3-250-22-243.eu-west-1.compute.amazonaws.com'
            }
        } 
    }
}
