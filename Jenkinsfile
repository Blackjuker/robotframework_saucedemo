pipeline {
    agent {
        docker {
            image 'python:3.11'
        }
    }
   

    stages {

        stage('Compile project') {
            steps {
                sh "python3 -m venv venv"
                sh "pip freeze > requirements.txt"
                sh "pip3 install -r requirements.txt"
                sh "pip list"
                sh "python3 -m robot tests\login_avec_template.robot"
            }
        }
        

    }
    
} 