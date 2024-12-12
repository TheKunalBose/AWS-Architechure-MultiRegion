pipeline {
    agent any

    environment {
        TF_WORKSPACE = 'default'
    }

    stages {
        stage('Checkout Code') {
            steps {
                echo 'Checking out code...'
                checkout scm
            }
        }

        stage('Setup Terraform') {
            steps {
                echo 'Setting up Terraform...'
                sh '''
                if ! command -v terraform &> /dev/null; then
                    echo "Terraform not found. Installing..."
                    wget https://releases.hashicorp.com/terraform/1.5.6/terraform_1.5.6_linux_amd64.zip
                    unzip terraform_1.5.6_linux_amd64.zip
                    sudo mv terraform /usr/local/bin/
                    rm terraform_1.5.6_linux_amd64.zip
                fi
                terraform -version
                '''
            }
        }

        stage('Initialize Terraform') {
            steps {
                echo 'Initializing Terraform...'
                sh '''
                terraform init
                '''
            }
        }

        stage('Validate Configuration') {
            steps {
                echo 'Validating Terraform configuration...'
                sh '''
                terraform validate
                '''
            }
        }

        stage('Terraform Plan') {
            steps {
                echo 'Creating Terraform plan...'
                sh '''
                terraform plan -out=tfplan
                '''
            }
        }

        stage('Terraform Apply') {
            when {
                branch 'main' 
            }
            steps {
                echo 'Applying Terraform changes...'
                sh '''
                terraform apply -auto-approve tfplan
                '''
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
        always {
            cleanWs() 
        }
    }
}
