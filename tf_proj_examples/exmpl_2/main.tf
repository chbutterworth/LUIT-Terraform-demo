/*
Name: Week20 Project -How to create Jenkins server on an EC2 using Terraform 
Description: AWS Infrastructure Buildout with Terraform
Contributor: Jason Li
*/

/* This Terraform code is the main set of the configuration, itwill create an EC2 instance with 
the specified properties.The instance will be accessible using the SSH key specified in the 
key_name property.
*/

/*The aws_instance resource defines an EC2 instance that will be used to host the Jenkins server. The instance will be created in the 
us-east-1 region and will use the t2.micro instance type. The instance will be assigned the Project4EC2 SSH key and will be tagged 
with the Name tag JenkinsTerraformInstance2023.
*/
resource "aws_instance" "instance" {
  ami                    = var.ami
  instance_type          = var.instance
  user_data              = var.ec2_user_data
  vpc_security_group_ids = [aws_security_group.security_group.id]
  key_name               = "Project4EC2"
  tags = {
    Name = "JenkinsTerraformInstance2023"
  }
}
/*
The aws_security_group resource defines a security group that will be used to control access to the EC2 instance. The security group will 
allow SSH traffic from your public IP address, as well as HTTP and HTTPS traffic from anywhere.
*/
resource "aws_security_group" "security_group" {
  vpc_id = var.vpc
  ingress {
    description = "Allow SSH from my Public IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allows Access to the Jenkins Server"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allows Access to the Jenkins Server"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Jenkins Security Group"
  }
}

# Create a new S3 bucket for Jenkins artifacts
/*The aws_s3_bucket resource defines an S3 bucket that will be used to store Jenkins artifacts. The bucket will be named jenkins-
artifacts-s3bucket-jason2023 and will have a private ACL.
*/

resource "aws_s3_bucket" "jenkins_artifacts_bucket" {
  bucket = "jenkins-artifacts-s3bucket-jason2023" # Set a unique bucket name
# Deny public access to the S3 bucket
  acl = "private"
}