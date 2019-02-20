node('master') {

    currentBuild.result = "SUCCESS"

    try {

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
		echo maybe cleanup here?
	}



    }
    catch (err) {

        currentBuild.result = "FAILURE"

            mail body: "project build error is here: ${env.BUILD_URL}" ,
            from: 'xxxx@yyyy.com',
            replyTo: 'yyyy@yyyy.com',
            subject: 'project build failed',
            to: 'zzzz@yyyyy.com'

        throw err
    }
}
