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
                sh "pip install robotframework --no-cache-dir"
                sh "pip freeze > requirements.txt"
                sh "pip3 install -r requirements.txt"
                sh "pip list"
                sh script: "robot --nostatusrc ./tests/login_avec_template_data.robot", returnStatus: true
            }
        }        

    }
    post {
        always {
            robot outputPath: '.', passThreshold: 80.0, unstableThreshold: 70.0
        }
    }
    
} 