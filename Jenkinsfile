pipeline {
    agent any
    stages {
        stage('Clone') {
            steps {
                git credentialsId: 'job1', url: 'https://github.com/anhly23/job2.git'
            }
        }
        stage('Build and Push Docker Image') {
            steps {
                withDockerRegistry(credentialsId: 'crdes-dockerhub', url: 'https://index.docker.io/v1/') {
                    sh label:'',script: 'docker build -t anhly230722/web:jenkins .'
                    sh label:'',script: 'docker push anhly230722/web:jenkins'
                }
            }
        }
    }
}
