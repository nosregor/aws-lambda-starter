terraform {
  # This module is now only being tested with Terraform 0.13.x. However, to make upgrading easier, we are setting
  # 0.12.26 as the minimum version, as that version added support for required_providers with source URLs, making it
  # forwards compatible with 0.13.x code.
  required_version = ">= 0.12.26"
}

terraform {
  backend "s3" {
    encrypt        = true
    bucket         = "terrafrom-central-state"
    key            = "shortify/terraform.tfstate"
    region         = "eu-central-1"
    role_arn       = ""
    dynamodb_table = "terraform-up-and-running-locks"
  }
}

provider "aws" {
  region     = "eu-central-1"
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.SECRET_AWS_ACCESS_KEY
}
