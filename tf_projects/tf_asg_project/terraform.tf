terraform {
  required_version = ">= 1.6.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.51.1"
    }

    random = {
      source  = "hashicorp/random"
      version = ">= 3.6.2"
    }

    local = {
      source  = "hashicorp/local"
      version = ">= 2.5.1"
    }
  }
}