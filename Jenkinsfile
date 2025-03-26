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
                    pip install --upgrade pip
                    pip install robotframework
                    # Affiche les versions installées
                    pip list
                    python -m robot --version
                    #pip can install a package ignoring the cache
                    pip --no-cache-dir install scipy
                    # Sauvegarde les dépendances
                    pip freeze > requirements.txt
                '''
            }
        }
    }
}
