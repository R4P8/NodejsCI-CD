pipeline {
    agent any

    stages {
        stage ('Checkout') {
            steps {
                checkout scm
            }
        }

        stage ('Test') {
            steps {
                sh 'apt update && sudo apt install -y npm'
                sh 'npm test'
            }
        }

        stage ('Build') {
            steps {
                sh 'npm run build'
            }
        }

        stage ('Build Images') {
            steps {
                sh 'docker build -t node-myapps:1.0 .'
            }
        }
    }
}
