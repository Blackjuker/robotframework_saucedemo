pipeline {
    agent {
        docker {
            image 'ppodgorsek/robot-framework'
            args '--network=host'
        }
    }

    environment {
        SELENIUM_GRID_URL = "http://192.168.1.119:4444/wd/hub"
    }

    stages {
        stage('Install Dependencies') {
            steps {
                sh 'python3 -m venv venv'
                sh '. venv/bin/activate && pip install -r requirements.txt --no-cache-dir'
            }
        }

        stage('Run Tests') {
            steps {
                sh '. venv/bin/activate && python3 -m robot login.robot'
            }
        }
    }
}