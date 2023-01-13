provider "aws" {
  region  = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "david-terraform-bucket-hakobyan"
    key    = "dev/network/terraform.tfstate"
    region = "us-east-1"
  }
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "david-terraform-bucket-hakobyan"
  force_destroy = true
  versioning {
    enabled = true
  }
}

resource "aws_instance" "my_ubuntu" {
  ami           = "ami-06878d265978313ca"
  instance_type = "t2.micro"
  tags = {
    Name    = "My Ubuntu server"
    Owner   = "David Hakobyan"
    Project = "Terraform Homework"
  }
}
