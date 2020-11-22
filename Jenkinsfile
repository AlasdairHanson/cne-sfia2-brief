pipeline {
    agent any
    stages {
        stage('Deploy to Test VM') {
            steps {
                sh "chmod +x deploy.sh"
                sh "./deploy.sh"                
            }
        } 
        stage('Set environment variables') {
            steps {
                sh "export DATABASE_URI='mysql+pymysql://dbProject:dB4a15!4@terraform-20201120185648962100000002.clh36ghk8zgg.eu-west-1.rds.amazonaws.com:3306/users'"
                sh "export TEST_DATABASE_URI='mysql+pymysql://dbProject:dB4a15!4@terraform-20201120185648962100000002.clh36ghk8zgg.eu-west-1.rds.amazonaws.com:3306/testdb'"               
            }
        } 
        stage('Run kubectl pods') {
            steps {
                sh "kubectl create -f ~/frontend.yaml"
                sh "kubectl create -f ~/backend.yaml"               
            }
        }
    }
}
