pipeline {
    agent {
        docker {
            image 'ppodgorsek/robot-framework'
        }
    }
    
     
    stages {
        stage('Install Dependencies') {
            steps {
                echo "Génération du fichier requirements.txt et installation des dépendances"
                // Cette commande capture l'état actuel des packages installés dans le container
                sh 'pip freeze > requirements.txt'
                // Installation des packages à partir du fichier généré
                sh 'pip install -r requirements.txt'
                // Affichage de la liste des packages pour vérification
                sh 'pip list'
            }
        }
        
        stage('Run Tests') {
            steps {
                echo "Exécution des tests avec Robot Framework"
               // sh "robot --outputdir ${OUTPUT_DIR} ${TEST_DIR}/"
            }
        }
    }
    
    post {
        always {
            echo "Archivage des résultats de tests..."
            // Archive les rapports et résultats générés par Robot Framework
            archiveArtifacts artifacts: "${OUTPUT_DIR}/**", allowEmptyArchive: true
            // Si Robot Framework génère un fichier XML compatible JUnit, il peut être traité ainsi
            junit "${OUTPUT_DIR}/*.xml"
        }
        failure {
            echo "La pipeline a échoué. Veuillez vérifier les logs pour plus d'informations."
        }
    }
}
