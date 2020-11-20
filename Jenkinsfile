pipeline {
    agent any
    stages {
        stage('Connect to Test VM') {
            steps {
                sh 'ssh -tt -i /home/jenkins/.ssh/id_rsa ubuntu@52.211.44.119'
                
            }
        } 
    }
}
