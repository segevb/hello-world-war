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

    stage('Sonarcloud - code analysis') {
      steps {
        sh 'mvn verify org.sonarsource.scanner.maven:sonar-maven-plugin:sonar -Dsonar.projectKey=segevb_hello-world-war'
      }
    }

    stage('Docker build & Tag') {
      steps {
        sh 'docker build -t hello-world:$BUILD_ID .'
      }
    }

    stage('Docker tag & Push to Nexus') {
      steps {
        sh '''docker tag hello-world:$BUILD_ID 127.0.0.1:8123/repository/docker-hosted/hello-world:$BUILD_ID
docker push 127.0.0.1:8123/repository/docker-hosted/hello-world:$BUILD_ID
'''
      }
    }

  }
}