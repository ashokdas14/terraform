pipeline{
    agent any
        tools {
            terraform 'terraform'
        }
    stages{
        stage('Git Checkout'){
            steps{
            git branch: 'main', url: 'https://github.com/ashokdas14/terraform'
            }
        }
        stage('Terraform Init'){
            steps{
            sh 'terraform init'
            }
        }
        stage('Terraform Plan'){
            steps{
            sh 'terraform plan'
            }
        }
        stage('Terraform Validate'){
            steps{
            sh 'terraform validate'
            }
        }
		
        stage('Terraform Approval'){
            steps{
            input "Deploy Infra?"
            }
        }
        stage('Terraform Apply'){
            steps{
            sh 'terraform apply --auto-approve';
            }
        }
    }
}