pipeline {
    agent { docker { image 'node' } }
    environment {
        HOME = '.'
    }
    stages {
        stage('build') {
            steps {
                git 'https://github.com/Sanster/vue-todoist'
                sh 'npm cache clean --force --unsafe-perm'
                sh 'npm install'
                sh 'npm build'\
            }
        }
        stage('show') {
            steps {
                sh 'ls'    
            }
        }
    }
}