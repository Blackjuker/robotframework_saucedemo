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
                sh 'pip install --user -r requirements.txt --no-cache-dir'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'python3 -m robot login.robot'
            }
        }
    }
}