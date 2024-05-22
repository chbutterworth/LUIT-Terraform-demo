#variable.tf

#The code in variable.tf defines four variables that will be used to create the Jenkins server:

#vpc: The ID of the VPC that the Jenkins server will be created in.
variable "vpc" {
  description = "The Default VPC of EC2"
  type        = string
  default     = "vpc-000ca17cd73ff6e10"
}

#ami: The AMI ID that will be used to create the Jenkins server.
variable "ami" {
  description = "The AMI ID of the Instance"
  type        = string
  default     = "ami-0715c1897453cabd1"
}

#instance: The instance type that will be used to create the Jenkins server.
variable "instance" {
  description = "The Instance Type of EC2"
  type        = string
  default     = "t2.micro"
}

#ec2_user_data: The user data that will be passed to the Jenkins server when it is created.
variable "ec2_user_data" {
  description = "User Data for Jenkins EC2"
  type        = string
  default     = <<-EOF
  #!/bin/bash
  sudo yum update -y
  sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
  sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
  sudo yum upgrade
  sudo amazon-linux-extras install java-openjdk11 -y
  sudo yum install -y jenkins
  sudo systemctl enable jenkins
  sudo systemctl start jenkins
  EOF
}