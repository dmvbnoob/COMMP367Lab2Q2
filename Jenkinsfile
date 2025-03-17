pipeline {
    agent any

    triggers {
        pollSCM('H/5 * * * *') // Polls SCM every 5 minutes for changes
    }

    environment {
        DOCKERHUB_CREDENTIALS = credentials('docker-hub-creds') // Docker Hub credentials stored in Jenkins
        IMAGE_NAME = 'deedee25/maven-java-webapp'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/dmvbnoob/COMMP367Lab2Q2.git'
            }
        }

        stage('Build Maven Project') {
            steps {
                sh 'export PATH=$PATH:/opt/homebrew/Cellar/maven/3.9.9/bin && mvn clean package'
            }
        }

        stage('Docker Login') {
            steps {
                sh "echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin"
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t $IMAGE_NAME ."
            }
        }

        stage('Push Docker Image to Docker Hub') {
            steps {
                sh "docker push $IMAGE_NAME"
            }
        }

        stage('Deploy') {
            steps {
                echo "Deploying to Tomcat (Placeholder for actual deployment)"
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed! Check logs for errors.'
        }
    }
}
