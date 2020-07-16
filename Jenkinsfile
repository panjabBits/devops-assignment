pipeline {
  environment {
    registry = "panjab/docker-test"
    registryCredential = 'dockerhub1'
    dockerImage = ''
  }
  agent any
  stages {
    // stage('Cloning Git') {
    //   steps {
    //     git branch: 'development', url: 'https://github.com/panjabBits/devops-assignment.git'
    //   }
    // }
    stage('Building image') {
      steps{
        script {
          //docker.build registry + ":$BUILD_NUMBER"
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    }
  }
}