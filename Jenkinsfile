pipeline {
    agent any
    tools {
        maven 'Maven'
    }   
    stages {

        stage('sonar analysis') {
            environment {
                scannerHome = tool 'SonarQube Scanner 5.0.1.3006'
            }
            steps {
                withsonarQubeScannerEnv('SonarQube Scanner 5.0.1.3006')
<<<<<<< HEAD
            sh '${scannerHome}/bin/Sonarscannar'
=======
>>>>>>> f91dc579d1b7b5e9ef850f4bb664f23e9a7da8a0
            }
        }
    }
}
        stage('Build with Maven') {
            steps {
                sh 'mvn clean package'
                
            }
        }
        stage('Build Docker image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                 
                  sh 'docker login -u $USERNAME -p $PASSWORD'
    // Your Docker commands using the environment variables
                    
                  // Access JAR file path dynamically (if environment variable not set)
                   //jarFilePath = 'target/*.jar'   
                   // def pomFile = readMavenPom project: '.'
                    //def appName = pomFile.getName()
                  
                  sh "docker build -t wordsmith-api:latest -f Dockerfile --build-arg JAR_FILE=target/wordapi.jar ."
                
                 //sh 'docker build -t wordsmith-api:${BUILD_NUMBER} .'
                  sh 'docker tag wordsmith-api:latest mncy580/wordsmith-api:${BUILD_NUMBER}'
                  sh 'docker push mncy580/wordsmith-api:${BUILD_NUMBER}'
                     
                     
                }
            }     
        }
    
