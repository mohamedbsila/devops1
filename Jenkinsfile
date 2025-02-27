pipeline {
    agent any

    stages {
        stage('Cleanup') {
            steps {
                sh 'rm -rf *'  // Clean workspace before cloning
            }
        }

        stage('GIT Clone') {
            steps {
                git branch: 'main', url: 'https://github.com/mohamedbsila/devops1.git'  // Correct repository URL
                sh 'ls -la'  // Check if pom.xml is in the workspace
            }
        }

        stage('Compile') {
            steps {
                sh 'mvn clean compile'
            }
        }

        stage('MVN SONARQUBE') {
            steps {
                withSonarQubeEnv('SonarQube') {
                    sh 'mvn sonar:sonar'
                }
            }
        }
    }
}
