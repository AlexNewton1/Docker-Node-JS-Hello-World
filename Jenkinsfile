node('master') {
    currentBuild.result = "SUCCESS"
    stage('Checkout'){
		checkout scm
    }
    
    docker.image('node:7-alpine').inside {
        stage('Test') {
            sh 'node --version'
            sh 'npm install'
            sh 'npm test'
        }
    }   
    
    stage('Build Docker Image'){
        sh 'docker-compose build --no-cache nodeapp'
    }
    
    stage('Deploy Docker Image') {
        sh 'docker-compose up -d'   
    }
}
