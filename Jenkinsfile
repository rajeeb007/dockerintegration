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
        stage('docker login and push image') {
            steps {
                script {
                    withCredentials([usernameColonPassword(credentialsId: 'docker_key', variable: 'rajeeb007')]) {
                        sh 'docker login -u rajeeb007 -p $(docker_key)'
                        sh 'docker push rajeeb007/new:1.0'
                   }
                }
                
            }
               
               
            
            
        }
        
    }

    
}