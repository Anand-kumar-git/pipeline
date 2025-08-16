pipeline {
    agent any
    environment {
        AWS_REGION = "ap-southh-1"
        AWS-ACCOUNT-ID = "787755074992"
        ECR_REPO_NAME = "jenkins-pipeline"
        ECR_REGISTRY = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com"
        FULL_IMAGE_NAME = "${ECR_REGISTRY}/${ECR_REPO_NAME}:${IMAGE_TAG}"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage ('Build Docker Images') {
            steps {
                script {
                    sh 'docker build -t $ECR_REPO_NAME:$IMAGE_TAG .'

                }

            }

        }
        stage('Tag Image') {
            steps {
                script {
                    sh 'doker tag $ECR_REPO_NAME:$IMAGE_TAG $FULL_IMAGE_NAME'
                }
            } 
        }

        stage('login to ECR') {
            steps {
                script {
                    sh '''
                        aws ecr get-login-password --region $AWS_REGION | \
                        docker login --username AWS --password-stdin $ECR_REGISTRY
                    '''
                }
            }
        }

        stage('Push to ECR') {
            steps {
                script {
                    sh 'docker push $FULL_IMAGE_NAME'
                }
            }
        }


    }

    
    
}