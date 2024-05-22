#providers.tf

#Terraform Providers, Terraform will download the required providers and use them to create the Jenkins server.

provider "aws" {
  region = "us-east-1"
}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}