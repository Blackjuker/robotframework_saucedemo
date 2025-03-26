pipeline {
    agent {
        docker {
            image 'python:3.11'
        }
    }

    stages {
        stage('Compile & Run Robot Test') {
            steps {
                sh '''
                    python3 -m venv venv
                    . venv/bin/activate
                    pip install --upgrade pip --no-cache-dir
                    pip install robotframework --no-cache-dir

                    pip list

                    # Exécution du test Robot Framework
                    ./venv/bin/robot --nostatusrc --outputdir results ./tests/login/login_avec_template_data.robot
                '''
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: 'results/*.*', allowEmptyArchive: true
        }
    }
}
