provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region = "us-east-1"
}

resource "aws_instance" "my_ubuntu" {
  ami           = "ami-06878d265978313ca"
  instance_type = "t2.micro"
  depends_on = [aws_s3_bucket.my_bucket]

  tags = {
    Name    = "My Ubuntu server"
    Owner   = "David Hakobyan"
    Project = "Terraform Homework"
  }
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "david-terraform-bucket-hakobyan"
  versioning {
    enabled = true
    acl     = "private"
  }
  tags = {
    Name        = "My s3 bucket"
    Environment = "Dev"
  }
}

terraform {
  backend "s3" {
    bucket = "david-terraform-bucket-hakobyan"
    key    = "dev/network/terraform.tfstate"
    region = "us-east-1"
  }
}

output "s3_bucket_name" {
  value = aws_s3_bucket.my_bucket.id
}

