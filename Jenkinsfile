pipeline {
    agent {
        docker {
            image 'python:3.11'
        }
    }
   

    stages {

        stage('Compile project') {
            steps {
                sh"python3 -m venv venv"
                //sh "pip freeze > requierements.txt"
                sh "pip3 install -r requirements.txt"
                sh "pip list"
            }
        }

    }
    
}