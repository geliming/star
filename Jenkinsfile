pipeline {
  agent any
  stages {
    stage('Checkout') {
      steps {
        git(changelog: true, url: 'https://github.com/geliming/star', branch: 'main')
      }
    }

    stage('Build') {
      steps {
        sh '2'
      }
    }

    stage('Test') {
      steps {
        sh '3'
      }
    }

    stage('Deploy') {
      steps {
        sh '4'
      }
    }

    stage('Notice') {
      steps {
        sh '5'
      }
    }

  }
}