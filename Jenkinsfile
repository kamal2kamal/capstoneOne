pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = 'b461a2a7-cf9f-42e1-b24b-03e13a10c5b6' // ID of credentials stored in Jenkins
        APP_NAME = 'my-node-app'
        DOCKER_USER = 'kamalkolisetty'
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build & Test') {
            steps {
                echo 'Running tests...'
                // For a real app, you'd run: npm install && npm test
            }
        }
        stage('Docker Build & Push') {
            steps {
                script {
                    // Build the image
                    sh "docker build -t ${DOCKER_USER}/${APP_NAME}:${env.BUILD_NUMBER} ."
                    sh "docker build -t ${DOCKER_USER}/${APP_NAME}:latest ."
                    
                    // Login and Push
                    withCredentials([usernamePassword(credentialsId: "${DOCKERHUB_CREDENTIALS}", passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                        sh "echo $PASS | docker login -u $USER --password-stdin"
                        sh "docker push ${DOCKER_USER}/${APP_NAME}:${env.BUILD_NUMBER}"
                        sh "docker push ${DOCKER_USER}/${APP_NAME}:latest"
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                // For local Docker Desktop testing, we just restart the container
                sh "docker stop ${APP_NAME} || true && docker rm ${APP_NAME} || true"
                sh "docker run -d --name ${APP_NAME} -p 8080:3000 ${DOCKER_USER}/${APP_NAME}:latest"
            }
        }
    }
}
