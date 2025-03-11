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
                sh 'apt update && apt install -y npm'
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

        stage('Docker Push') {
    steps {
        withCredentials([usernamePassword(credentialsId: 'docker_cred', 
                                          passwordVariable: 'DOCKERHUB_PASSWORD', 
                                          usernameVariable: 'DOCKERHUB_USERNAME')]) {
            sh 'docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD'
            sh 'docker tag node-myapps:1.0 $DOCKERHUB_USERNAME/node-myapps:1.0'
            sh 'docker push $DOCKERHUB_USERNAME/node-myapps:1.0'
            sh 'docker logout'
        }
    }
}

    }
}
