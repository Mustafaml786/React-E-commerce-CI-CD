pipeline {
    agent any

    environment {
        // Define environment variables for Docker and repository information
        DOCKER_IMAGE = '7777950665/ecommerce-react-app'
        DOCKER_CREDENTIALS_ID = 'docker-hub-credentials-id' // Replace with your Jenkins credentials ID
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from GitHub
                git url: 'https://github.com/Mustafaml786/React-E-commerce-CI-CD.git', branch: 'master'
            }
        }

        stage('Install Dependencies') {
            steps {
                // Install dependencies using npm
                script {
                    if (isUnix()) {
                        sh 'npm install'
                    } else {
                        bat 'npm install'
                    }
                }
            }
        }

        stage('Build') {
            steps {
                // Build the React application
                script {
                    if (isUnix()) {
                        sh 'npm run build'
                    } else {
                        bat 'npm run build'
                    }
                }
            }
        }

        stage('Test') {
            steps {
                // Run tests (if you have any)
                script {
                    if (isUnix()) {
                        sh 'npm test'
                    } else {
                        bat 'npm test'
                    }
                }
            }
        }

        stage('Docker Build') {
            steps {
                // Build the Docker image
                script {
                    if (isUnix()) {
                        sh "docker build -t ${DOCKER_IMAGE}:${env.BUILD_NUMBER} ."
                    } else {
                        bat "docker build -t ${DOCKER_IMAGE}:${env.BUILD_NUMBER} ."
                    }
                }
            }
        }

        stage('Docker Push') {
            steps {
                // Push the Docker image to Docker Hub
                script {
                    withCredentials([usernamePassword(credentialsId: DOCKER_CREDENTIALS_ID, usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        if (isUnix()) {
                            sh "echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin"
                            sh "docker push ${DOCKER_IMAGE}:${env.BUILD_NUMBER}"
                        } else {
                            bat "echo %DOCKER_PASSWORD% | docker login -u %DOCKER_USERNAME% --password-stdin"
                            bat "docker push ${DOCKER_IMAGE}:${env.BUILD_NUMBER}"
                        }
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                // Deploy the application (example placeholder)
                echo 'Deploying the application...'
                // Add actual deployment logic, for example, Kubernetes or Docker Compose
                // e.g., bat 'kubectl apply -f deployment.yml' or docker-compose up
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed. Please check the logs for details.'
        }
    }
}
