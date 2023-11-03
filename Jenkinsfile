pipeline{
  agent any {
  }
  }
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
  }
    
