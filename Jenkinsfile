// pipeline {
//     agent any
//     stages {
//         stage('Clone') {
//             steps {
//                 git credentialsId: 'job1', url: 'https://github.com/anhly23/job2.git'
//             }
//         }
//         stage('Build and Push Docker Image') {
//             steps {
//                 withDockerRegistry(credentialsId: 'crdes-dockerhub', url: 'https://index.docker.io/v1/') {
//                     sh label:'',script: 'docker build -t anhly230722/web:jenkins .'
//                     sh label:'',script: 'docker push anhly230722/web:jenkins'
//                 }
//             }
//         }
//     }
// }
pipeline {
    agent any
    stages {
        stage('Clone') {
            steps {
                git branch: 'main', url: 'https://github.com/anhly23/job4.git'
            }
        }
        // stage('Build') {
        //     steps {
        //         script {
        //             sh 'docker build -t ${DOCKER_IMAGE_NAME}:${DOCKER_TAG} .'
        //         }
        //     }
        // }
        stage('Build and Push Docker Image'){
            steps{
               // This step should not normally be used in your script. Consult the inline help for details.
                withDockerRegistry(credentialsId: 'creds-dockerhub1', url:'') {
                // some block .
                    
                    sh label: '', script: 'docker build -t anhly230722/web:latest .'
                    sh label: '', script: 'docker push anhly230722/web:latest'
                    }
            }
        }
    }
}
