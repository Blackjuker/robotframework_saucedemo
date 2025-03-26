pipeline {
    agent {
        docker {
            image 'python:3.11'
        }
    }

    stages {
        stage('Compile project') {
            steps {
                sh '''
                    python3 -m venv venv
                    . venv/bin/activate
                    pip install --upgrade pip --no-cache-dir
                    pip install robotframework --no-cache-dir
                    pip list
                    python -m robot --version
                    pip freeze > requirements.txt
                '''
            }
        }
    }
}
