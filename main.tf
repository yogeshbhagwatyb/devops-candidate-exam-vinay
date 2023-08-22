provider "aws" {
  region = "us-west-1"  # replace with the region you want to use
}



# Create private subnet
resource "aws_subnet" "private_subnet" {
  vpc_id            = vpc-00bf0d10a6a41600c
  cidr_block        = "10.0.1.0/24"
  #availability_zone = "eu-west-1" # replace with the AZ you want to use
}

# Create routing table
resource "aws_route_table" "private_route_table" {
  vpc_id = "vpc-00bf0d10a6a41600c"

  route {
    #vpc_id = "vpc-00bf0d10a6a41600c"
    cidr_block = "0.0.0.0/0"
    # Replace with the ID of the NAT Gateway that you want to use
    # to allow traffic to reach the internet
    nat_gateway_id = "nat-0d688bbff8a47b274"
  }

  tags = {
    Name = "Private Route Table"
  }
}

# Create Lambda function
resource "aws_lambda_function" "my_lambda_function" {
  function_name = "my-lambda-function"
  handler = "index.handler"
  runtime = "python3.8"
  role = "DevOps-Candidate-Lambda-Role"
  # replace with your lambda function code
  filename = "api.zip"

}

# Create security group
resource "aws_security_group" "my_security_group" {
  name_prefix = "my-security-group"
  description = "Security group for my Lambda function"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "my-security-group"
  }
}


