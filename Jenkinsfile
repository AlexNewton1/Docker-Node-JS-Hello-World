node('master') {

    currentBuild.result = "SUCCESS"

       stage('Checkout'){
          checkout scm
       }

       stage('Test'){

		/* Requires the Docker Pipeline plugin to be installed */
    	    docker.image('node:7-alpine').inside {
        	stage('Test') {
            		sh 'node --version'
        	}
    	    }
       }

       stage('Build Docker'){
            sh 'docker build -t node-app .'
       }

       stage('Run App'){
         echo 'Running Application'
         sh 'docker run --name nodejs -p 8080:8000 node-app'
       }

       stage('Cleanup'){
		echo cleanup
	}
}
