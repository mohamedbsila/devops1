pipeline {
    agent any

    environment {
        SONAR_TOKEN = credentials('sonar-token')  // Assurez-vous que 'sonar-token' est ajouté dans Jenkins Credentials
    }

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

        /*stage('MVN SONARQUBE') {
            steps {
                withSonarQubeEnv('SonarQube') {  // Nom de votre serveur SonarQube dans Jenkins
                    sh 'mvn sonar:sonar -Dsonar.login=$SONAR_TOKEN'
                }
            }
        }*/

        stage('Run Tests') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Build Package') {
            steps {
                sh 'mvn clean package -DskipTests'  // Génération du fichier JAR sans exécuter les tests
            }
        }

        stage('Deploy to Nexus') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'nexus-credentials', usernameVariable: 'NEXUS_USER', passwordVariable: 'NEXUS_PASS')]) {
                    sh 'mvn deploy -DskipTests -DaltDeploymentRepository=deploymentRepo::default::http://localhost:8081/repository/maven-releases/'
                }
            }
        }
    }
}
