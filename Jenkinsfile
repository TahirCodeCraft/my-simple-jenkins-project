pipeline {
    agent any  // This tells Jenkins to run the pipeline on any available agent
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the Git repository
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                // Install dependencies using npm
                script {
                    sh 'npm install'
                }
            }
        }

        stage('Run Tests') {
            steps {
                // Run tests (you can add any test command here)
                script {
                    sh 'echo "No tests yet, but running the app..."'
                    sh 'node index.js'
                }
            }
        }

        stage('Deploy') {
            steps {
                // Add any deployment commands (e.g., push to Docker, etc.)
                script {
                    echo 'Deploying the app (placeholder for actual deploy step)'
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline completed.'
        }
    }
}

