
pipeline {
    agent {
        docker {
            image 'ppodgorsek/robot-framework'
        }
    }

   

    stages {

        stage('Compile project') {
            steps {
                sh "pip freeze > requierements.txt"
                sh "pip3 install -r requirements.txt"
                sh "pip list"
            }
        }

    }
    
}
