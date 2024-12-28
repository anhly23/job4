
pipeline {
    agent any
    stages {
        stage('Clone') {
            steps {
                git branch: 'main', url: 'https://github.com/anhly23/job4.git'
            }
        }
        stage('Push'){
            steps{
                    // This step should not normally be used in your script. Consult the inline help for details.
                withDockerRegistry(credentialsId: 'creds-dockerhub1' ,url: '') {
                    // some block
                    // sh label:'' ,script: 'docker build -t anhly230722/project . '
                    // sh label:'' ,script: 'docker push anhly230722/project'
                    sh label:'' ,script: 'docker pull anhly230722/web'
                }
            }
        }
    }
}
