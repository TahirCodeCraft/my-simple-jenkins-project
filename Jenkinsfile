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
                    // Push Docker image to Docker Hub (or other registry)
                    // If you're using Docker Hub, replace with your username
                    sh 'docker login -u tahirahmedkhan -p Tahir086@'
                    sh 'docker tag $DOCKER_IMAGE:$DOCKER_TAG tahirahmedkhan/$DOCKER_IMAGE:$DOCKER_TAG'
                    sh 'docker push tahirahmedkhan/$DOCKER_IMAGE:$DOCKER_TAG'
                }
            }
        }

        stage('Deploy Docker Container') {
            steps {
                script {
                    // Run the Docker container on the deployment server (example: local machine)
                    sh 'docker run -d -p 8080:8080 tahirahmedkhan/$DOCKER_IMAGE:$DOCKER_TAG'
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
