pipeline {
    agent {
        docker {
            image 'ppodgorsek/robot-framework'
            args '--network=host -u root'
        }
    }

    parameters {
        string(
            name: 'TAGS',
            defaultValue: '',
            description: 'Tags à exécuter (séparés par des virgules, ex: smoke,regression)'
        )
        string(
            name: 'EXCLUDE_TAGS',
            defaultValue: '',
            description: 'Tags à exclure (séparés par des virgules)'
        )
        string(
            name: 'TEST_SUITE',
            defaultValue: './tests',
            description: 'Chemin vers le fichier/dossier de test'
        )
    }

    environment {
        SELENIUM_GRID_URL = "http://192.168.1.119:4444/wd/hub"
        PYTHONPATH = "/usr/local/lib/python3.12/site-packages"
    }

    stages {
        stage('Install Dependencies') {
            steps {
                sh 'pip install -r requirements.txt --no-cache-dir'
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    def tagArgs = ''
                    def excludeArgs = ''

                    if (params.TAGS?.trim()) {
                        tagArgs = "--include ${params.TAGS}"
                    }

                    if (params.EXCLUDE_TAGS?.trim()) {
                        excludeArgs = "--exclude ${params.EXCLUDE_TAGS}"
                    }

                    sh "python3 -m robot ${tagArgs} ${excludeArgs} --outputdir results ${params.TEST_SUITE}"
                }
            }
        }
        
        stage('Archive Results') {
            steps {
                archiveArtifacts artifacts: 'results/**/*'
            }
        }
    }
    
    post {
        always {
            robot outputPath: 'results', passThreshold: 80.0, unstableThreshold: 70.0
        }
    }
}