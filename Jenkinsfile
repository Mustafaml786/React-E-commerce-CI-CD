pipeline {
    agent any

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
                    sh 'npm install'
                }
            }
        }

        stage('Build') {
            steps {
                // Build the React application
                script {
                    sh 'npm run build'
                }
            }
        }

        stage('Test') {
            steps {
                // Run tests (if you have any)
                script {
                    sh 'npm test'
                }
            }
        }

        stage('Deploy') {
            steps {
                // Deploy the application (example placeholder)
                echo 'Deploying the application...'
                // You can add your deployment steps here
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
