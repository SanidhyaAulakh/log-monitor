pipeline {

    agent any

    parameters {

        choice(
            name: 'LOG_LEVEL',
            choices: ['ERROR','INFO'],
            description: 'Select Log Level'
        )

        booleanParam(
            name: 'DEPLOY',
            defaultValue: false,
            description: 'Deploy Application'
        )
    }

    environment {

        PROJECT_NAME = "Log-Monitor"

    }

    stages {

        stage('Build') {

            steps {

                echo "Project: ${PROJECT_NAME}"
		echo "Build Number: ${BUILD_NUMBER}"
		echo "Job Name: ${JOB_NAME}"

                sh 'pwd'
                sh 'ls -la'
            }
        }

        stage('Log Check') {

            steps {

                sh "grep ${LOG_LEVEL} logs/app.log"
            }
        }

        stage('Approval') {

            when {

                expression {
                    params.DEPLOY == true
                }

            }

            steps {

                input 'Approve Deployment?'
            }
        }

        stage('Deploy') {

            when {

                expression {
                    params.DEPLOY == true
                }

            }

            steps {

                echo "Deployment Started"

            }
        }
    }
}
