

pipeline {
    agent any
    
    stages {
        stage('Terraform Init') {
            steps {
                sh '''
                cd IaC
                terraform init -backend-config="bucket=my-terraform-state-bucket" -backend-config="key=state.tfstate"
                '''
            }
        }
        stage('Terraform Apply') {
            when {
                expression { params.ACTION == 'Apply' }
            }
            steps {
                sh '''
                cd IaC
                terraform apply -auto-approve
                '''
            }
        }
        stage('Terraform Destroy') {
            when {
                expression { params.ACTION == 'Destroy' }
            }
            steps {
                sh '''
                cd IaC
                terraform destroy -auto-approve
                '''
            }
        }
    }
}