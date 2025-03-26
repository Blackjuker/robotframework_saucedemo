pipeline {
    agent {
        docker {
            image 'ppodgorsek/robot-framework'
            args '--network=host -u root'  // Run as root to avoid permission issues
        }
    }

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
                sh 'python3 -m robot --outputdir results ./tests/login.robot'
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
            robot outputPath: '.', passThreshold: 80.0, unstableThreshold: 70.0
        }
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

        // stage('Run Tests') {
        //     steps {
        //         sh 'python3 -m robot --outputdir results ./tests/login.robot'
        //     }
        // }
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
            robot outputPath: '.', passThreshold: 80.0, unstableThreshold: 70.0
        }
    }
}