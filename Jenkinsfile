pipeline {
    agent any

    triggers {
        pollSCM('H/5 * * * *')
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/dmvbnoob/COMMP367Lab2Q2.git'
            }
        }

        stage('Build') {
            steps {
                sh 'export PATH=$PATH:/opt/homebrew/Cellar/maven/3.9.9/bin && mvn clean package'
            }
        }

        stage('Deploy') {
            steps {
                echo "Deploying to Tomcat"
            }
        }
    }
}
