pipeline{
    agent any
    stages{
        stage("TF Init"){
            steps{
                echo "Executing Terraform Init"
                sh 'terraform init --auto-approve'
            }
        }
        stage("TF Validate"){
            steps{
                echo "Validating Terraform Code"
            }
        }
        stage("TF Plan"){
            steps{
                echo "Executing Terraform Plan"
                sh 'terraform plan --auto-approve'
            }
        }
        stage("TF Apply"){
            steps{
                echo "Executing Terraform Apply"
               // sh "terraform apply --auto-approve"
            }
        }
        stage("Invoke Lambda"){
            steps{
                echo "Invoking your AWS Lambda"
               // "aws lambda invoke --function-name my-lambda-function --cli-binary-format raw-in-base64-out --payload '{}' out.txt"
            }
        }
    }
}