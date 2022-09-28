pipeline {
  agent {
    label 'course-project'
  }
  stages {
    stage('Git Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Build Docker Image') {
      parallel {
        stage('Build Docker Image') {
          steps {
            sh 'sudo su'
            sh 'sudo docker build -t c3-courseproject .'
            sh 'sudo docker tag c3-courseproject:latest 263635808743.dkr.ecr.us-east-1.amazonaws.com/assignment-3:${BUILD_NUMBER}'
            sh 'sudo docker push 263635808743.dkr.ecr.us-east-1.amazonaws.com/assignment-3:${BUILD_NUMBER}'
          }
        }
      }
    }
    stage('Deploying App host') {
      steps {
        sh 'sudo docker ps'
        sh 'sudo docker stop apphost'
        sh 'sudo docker rm apphost'
        sh 'sudo docker run -itd --name apphost -p 8080:8081 263635808743.dkr.ecr.us-east-1.amazonaws.com/assignment-3:${BUILD_NUMBER}'
      }
    }
  }
}
