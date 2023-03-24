pipeline {
    agent any
    environment {
        
        DOCKERHUB_CREDENTIALS = credentials('docker_key')
    }

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
                sh 'docker build -t rajeeb007/docker-helloworld1 .'
               
               
            
            }
        }
        stage('Login') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        
        
        
    }

    
}