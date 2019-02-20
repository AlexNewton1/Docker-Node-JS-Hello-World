node('master') {


    currentBuild.result = "SUCCESS"

    try {

       stage('Checkout'){
          checkout scm
       }

       stage('Test'){

         env.NODE_ENV = "test"

         print "Environment will be : ${env.NODE_ENV}"

         sh 'node -v'
         sh 'npm prune'
         sh 'npm install'
         sh 'npm test'
       }

       stage('Build Docker'){
            sh 'docker build -t node-app .'
       }

       stage('Run App'){
         echo 'Running Application'
         sh 'docker run --name nodejs -p 8080:8000 node-app'
       }

       stage('Cleanup'){

         echo 'prune and cleanup'
         sh 'npm prune'
         sh 'rm node_modules -rf'
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
