pipeline {
    agent any
        environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub-ahmadsk')
	}
    stages {
        stage('Cloning our Git') {
            steps {
                git 'https://github.com/AHMADSK1997/Kaltura-Devops-Task.git'
            }
        }
        stage('Building our image') {
            steps{
                sh 'sudo docker build -t webserver .'
            }
        }
        stage('Login') {
	    steps {
		sh 'echo $DOCKERHUB_CREDENTIALS_PSW | sudo docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
	    }
	}  
	stage('Tag') {
	    steps {
	         sh 'sudo docker tag webserver ahmadsk/webserver'
	     }
	}
        stage('Push') {
            steps {
		sh 'sudo docker push ahmadsk/webserver'
	   }  
        }
    }
}
