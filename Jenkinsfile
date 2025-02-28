pipeline {
    agent any

    stages {
        stage('Cleanup') {
            steps {
                sh 'rm -rf *'
            }
        }

        stage('GIT Clone') {
            steps {
                git branch: 'main', url: 'https://github.com/mohamedbsila/devops1.git'
                sh 'ls -la'
            }
        }

        stage('Compile') {
            steps {
                sh 'mvn clean compile'
            }
        }

        stage('MVN SONARQUBE') {
            steps {
                withSonarQubeEnv('SonarQube') {  // Ensure this matches your configured name in Jenkins
                    sh 'mvn sonar:sonar -Dsonar.login=$SONAR_TOKEN'
                }
            }
        }
    }
}
