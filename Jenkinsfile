pipeline {
    agent any

pipeline{
  agent any
  tools{
    maven "maven3.8.6"
  }
  stages{
       stage('GitClone'){
      steps{
        git 
      }
    }
    stage('Test&Build'){
      steps{
        sh "mvn clean package"
      }
    }
    stage('CodeQuality'){
      steps{
        sh "mvn sonar:sonar"
      }
    }
    stage('UploadArtifact'){
      steps{
        sh "mvn deploy"
      }
    }
    stage('message'){
      steps{
        sh "echo CI job successful"
      }
    }
}
    environment {
        DOCKER_IMAGE_NAME = 'your-dockerhub-username/your-image-name'
        DOCKER_IMAGE_TAG = 'latest'
    }
            }
        }
        
        stage('Build and Push Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh "docker build -t ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG} ."
                    
                    // Log in to Docker Hub
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials-id', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
                        sh "docker login -u ${DOCKERHUB_USERNAME} -p ${DOCKERHUB_PASSWORD}"
                    }
                    
                    // Push the Docker image to Docker Hub
                    sh "docker push ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}"
                }
            }
        }
    }
    
    post {
        success {
            echo 'Docker image build and push successful!'
        }
        failure {
            echo 'Docker image build and push failed!'
        }
    }
}
