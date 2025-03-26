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
                    # Créer et activer un environnement virtuel Python
                    python3 -m venv venv
                    . venv/bin/activate

                    # Installer les dépendances dans le venv (avec droits)
                    pip install --upgrade pip --no-cache-dir
                    pip install robotframework --no-cache-dir

                    # Vérification
                    pip list
                    python -m robot --version

                    # Lancer les tests robot
                    robot --nostatusrc --outputdir results ./tests/hello.robot
                '''
            }
        }        

    }
    post {
        always {
            robot outputPath: 'results', passThreshold: 80.0, unstableThreshold: 70.0
        }
    }
    
} 