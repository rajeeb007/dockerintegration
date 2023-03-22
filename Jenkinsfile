pipeline {
    agent any

    stages {
        stage('git checkout') {
            steps('git checkout') {
                git branch: 'main', credentialsId: 'raji_git', url: 'https://github.com/rajeeb007/dockerintegration.git'

            }

        }
        
    }

    
}