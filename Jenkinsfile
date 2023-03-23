pipeline {
    agent any

    stages {
        stage('git checkout') {
            steps('git checkout') {
                git branch: 'main', credentialsId: 'raji_git', url: 'https://github.com/rajeeb007/dockerintegration.git'

            }
        }
        stage('test') {
            steps {
                sh 'mvn test' 
            
            }
        }
        stage('build') {
            steps {
                sh 'mvn install' 
            
            }
        }
        stage('code scanner') {
            steps {
                withSonarQubeEnv(credentialsId: 'sonar_key',installationName:'sonarqube') {
                    sh 'mvn sonar:sonar'
    
               }
            
            }
        }
        stage('docker image building') {
            steps {
                sh 'docker build -t new:1.0 .'
               
               }
            
            }
        }
        
    }

    
}