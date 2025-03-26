pipeline {
    agent {
        docker {
            image 'ppodgorsek/robot-framework'
            args '--network=host'  // Permet d'accéder à Selenium Grid


        }
    }

    environment {
        SELENIUM_GRID_URL = "http://192.168.1.55:4444/wd/hub"
    }


    stages {
               stage('Install Dependencies') {
            steps {
                   // sh '.venv/Scripts/activate.ps1'
                   sh '''
            python3 -m venv venv
            . venv/bin/activate
            pip install --upgrade pip
            pip install -r requirements.txt --no-cache-dir
        '''

             }
        }

        stage('Run Tests') {
            steps {
                script {
                    // sh 'echo "SELENIUM_GRID_URL: $SELENIUM_GRID_URL"'
                   // sh '.venv/Scripts/activate.ps1'
                    // sh 'pip install robotframework'
                    // sh ' .venv/Scripts/Activate.ps1 '
                    // sh 'robot --version'
                     sh '''
            . venv/bin/activate
            python3 -m robot --variable SELENIUM_GRID_URL:$SELENIUM_GRID_URL login.robot
        '''
                }
            }
        }
    }
}