
pipeline {
    agent any
    stages {
        stage('Clone') {
            steps {
                git branch: 'main', url: 'https://github.com/anhly23/job4.git'
            }
        }

        stage('Build') {
            steps {
                script {
                    sh 'docker build -t ${DOCKER_IMAGE_NAME}:${DOCKER_TAG} .'
                }
            }
        }
        stage('Push'){
            steps{
                    // This step should not normally be used in your script. Consult the inline help for details.
                withDockerRegistry(credentialsId: 'creds-dockerhub1' ,url: '') {
                    // some block
                    sh label:'' ,script: 'docker build -t anhly230722/web:latest . '
                    sh label:'' ,script: 'docker push anhly230722/web:latest'
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    sh 'docker-compose up -d'
                }
            }
        }
    }
    post {
    always {
        mail bcc: '', 
            body: "🎉 Xin chúc mừng! Build dự án đã hoàn tất.\n\n" +
                  "📂 Dự án: *${env.JOB_NAME}*\n" +
                  "🔢 Số Build: *${env.BUILD_NUMBER}*\n" +
                  "🟢 Trạng thái: *${currentBuild.currentResult}*\n\n" +
                  "👉 [Xem chi tiết tại đây](${env.BUILD_URL})\n\n" +
                  "Cảm ơn bạn đã theo dõi! Chúc bạn một ngày làm việc hiệu quả. 🚀",
            cc: '', 
            from: 'jenkins@yourcompany.com', 
            replyTo: 'devops@yourcompany.com', 
            subject: "🚀 Kết quả Build: ${env.JOB_NAME} #${env.BUILD_NUMBER}", 
            to: 'anhly2307@gmail.com'
        }
    }

}
