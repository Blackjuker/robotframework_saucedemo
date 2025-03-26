pipeline {
    agent {
        docker {
            image 'ppodgorsek/robot-framework'
            args '--network=host -u root'  // Run as root to avoid permission issues
        }
    }

    environment {
        SELENIUM_GRID_URL = "http://192.168.1.119:4444/wd/hub"
        PYTHONPATH = "/usr/local/lib/python3.12/site-packages"  // Ensure Python can find installed packages
    }

    stages {
        stage('Install Dependencies') {
            steps {
                sh 'pip install -r requirements.txt --no-cache-dir'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'python3 -m robot --outputdir results login.robot'
            }
        }
        
        stage('Archive Results') {
            steps {
                archiveArtifacts artifacts: 'results/**/*'
            }
        }
    }
}