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
            sh 'docker build -t assignment-3 .'
//sh 'sudo aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 263635808743.dkr.ecr.us-east-1.amazonaws.com'
          sh 'docker tag assignment-3:latest 263635808743.dkr.ecr.us-east-1.amazonaws.com/assignment-3:${BUILD_NUMBER}'
          sh 'docker push 263635808743.dkr.ecr.us-east-1.amazonaws.com/assignment-3:${BUILD_NUMBER}'      
          }
        }
      }
    }
    
    stage('Deploying App host') {
      steps {
        sh 'docker ps'
        sh 'docker stop apphost'
        sh 'docker rm apphost'
        sh 'docker run -itd --name apphost -p 8080:8081 263635808743.dkr.ecr.us-east-1.amazonaws.com/assignment-3:${BUILD_NUMBER}'
      }
    }
  }
}
