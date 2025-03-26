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
                sh ". venv/bin/activate"
                sh "pip install --upgrade pip"
                sh "pip install robotframework"
                sh " pip list"
                sh " python -m robot --version"
                sh "pip freeze > requirements.txt"
                sh "pip3 install -r requirements.txt"
                sh "pip list"
            }
        }

        

    }
    
} 