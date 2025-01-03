pipeline {
    agent {
node  { label 'master-slave'}
}
environment {
registry = 'jenad/deepalidockerimage'
registryCredential = 'dockerhub'
}
    stages {
        stage('cloning git') {
            steps {
                checkout scm
            }
        }
        stage('Building Images') {
            steps {
                script { 
            dockerImage = docker.build registry + ":$BUILD_NUMBER" 
           }
            }
        }
       stage('Deploying Image') {
            steps {
                script { 
            docker.withRegistry('', registryCredential){
            dockerImage.push()
        } 
       }
            }
        }
  stage('Run docker container on Jenkins Agent') {
        steps {
          sh "docker run -d --name newcontainer $registry:$BUILD_NUMBER"
            }
        }
    }
}
