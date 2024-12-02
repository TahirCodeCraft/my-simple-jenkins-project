pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'my-simple-jenkins-project'
        DOCKER_TAG = 'latest'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm  // Checkout code from the Git repository
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    sh 'docker build -t $DOCKER_IMAGE:$DOCKER_TAG .'
                }
            }
        }

        stage('Run Tests (Inside Docker)') {
            steps {
                script {
                    // Run tests or application commands inside Docker container
                    sh 'docker run --rm $DOCKER_IMAGE:$DOCKER_TAG node index.js'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Login to Docker Hub using Jenkins credentials
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        // Login to Docker Hub
                        sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin'
                        
                        // Tag the Docker image
                        sh 'docker tag $DOCKER_IMAGE:$DOCKER_TAG $DOCKER_USERNAME/$DOCKER_IMAGE:$DOCKER_TAG'
                        
                        // Push Docker image to Docker Hub
                        sh 'docker push $DOCKER_USERNAME/$DOCKER_IMAGE:$DOCKER_TAG'
                    }
                }
            }
        }

        stage('Deploy Docker Container') {
            steps {
                script {
                    // Run the Docker container on the deployment server (example: local machine)
                    sh 'docker run -d -p 8080:8080 $DOCKER_USERNAME/$DOCKER_IMAGE:$DOCKER_TAG'
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline completed.'
        }
        success {
            echo 'Build and deployment successful!'
        }
        failure {
            echo 'Build failed.'
        }
    }
}
