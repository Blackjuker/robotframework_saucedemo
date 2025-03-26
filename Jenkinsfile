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
                    # Crée un environnement virtuel
                    python3 -m venv venv
                    # Active le venv dans le même shell
                    . venv/bin/activate
                    # Met à jour pip et installe les dépendances
                    pip install --upgrade pip --no-cache-dir
                    pip install robotframework --no-cache-dir
                    # Affiche les versions installées
                    pip list --no-cache-dir
                    python -m robot --version
                    # pip peut installer d'autres packages si besoin
                    # pip --no-cache-dir install scipy
                    # Sauvegarde des dépendances si besoin
                    # pip freeze > requirements.txt
                '''
            }
        }
    }
}
