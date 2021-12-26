pipeline {
  agent any
  stages {
    stage('Checkout Code') {
      steps {
        git(url: 'git@github.com:segevb/hello-world-war.git', branch: 'dev')
      }
    }

    stage('Build Maven war') {
      steps {
        sh '''mvn compile

'''
      }
    }

  }
}