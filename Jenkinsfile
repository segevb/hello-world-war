pipeline {
  agent any
  stages {
    stage('Checkout Code') {
      steps {
        git(url: 'https://github.com/segevb/hello-world-war.git', branch: 'dev', changelog: true)
      }
    }

    stage('Build Maven war') {
      steps {
        sh '''mvn compile
mvn clean package'''
      }
    }

    stage('Sonarqube - code analysis') {
      steps {
        sh 'mvn verify org.sonarsource.scanner.maven:sonar-maven-plugin:sonar -Dsonar.projectKey=segevb_hello-world-war'
      }
    }

  }
}