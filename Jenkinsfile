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
              // sh "aws lambda invoke --function-name my-lambda-function out --log-type Tail"
              // sh "aws lambda invoke --function-name my-lambda-function --invocation-type Event --cli-binary-format raw-in-base64-out response.js"
              //sh "aws lambda invoke --function-name my-lambda-function out --log-type Tail "
              sh "aws lambda invoke --cli-binary-format raw-in-base64-out --function-name my-lambda-function  response.json | base64 --decode"
            }
        }
    }
}