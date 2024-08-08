pipeline {
    agent any
    tools {
        maven 'Apache Maven 3.9.8'
        git 'Default'
    }   
    stages {
        
        stage('Build with Maven') {
            steps {
                sh 'mvn clean install'
                
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
                  
                  sh "docker build -t wordsmith-api:latest -f Dockerfile ."
                
                 //sh 'docker build -t wordsmith-gapi:${BUILD_NUMBER} .'
                  sh 'docker tag wordsmith-api:latest mncy580/wordsmith-api:${BUILD_NUMBER}'
                  sh 'docker push mncy580/wordsmith-api:${BUILD_NUMBER}'
                     
                     
                }
            }     
        }
    }
}