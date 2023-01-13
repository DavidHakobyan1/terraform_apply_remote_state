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

  versioning {
    enabled = true
  }
}
