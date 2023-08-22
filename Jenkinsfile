pipeline{
    agent any
    stages{
        stage("TF Init"){
            steps{
                echo "Executing Terraform Init"
                sh 'terraform init -force-copy'
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
                sh 'terraform plan'
            }
        }
        stage("TF Apply"){
            steps{
                echo "Executing Terraform Apply"
                sh "terraform apply --auto-approve"
            }
        }
        stage("Invoke Lambda"){
            steps{
                echo "Invoking your AWS Lambda"
               sh "aws lambda invoke --function-name my-lambda-function --cli-binary-format raw-in-base64-out payload = {"subnet_id": "subnet-0531d09d8f4122ce7","name": "vinay patange","email": "vinaydp78@gmail.com"} out.txt"
            }
        }
    }
}