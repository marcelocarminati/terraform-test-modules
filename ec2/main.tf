provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket = "" #seu bucket
    key    = "module-ec2/terraform.tfstate"
    region = "us-east-1"
  }
}

module "ec2" {
  source = "github.com/marcelocarminati/terraform-module-ec2?ref=v.0.1"

  ami                     = var.ami
  disable_api_termination = var.disable_api_termination
  ebs_optimized           = var.ebs_optimized
  instance_type           = var.instance_type
  key_name                = var.key_name
  monitoring              = var.monitoring
  region                  = var.region
  security_groups         = var.security_groups
  server_name             = var.server_name
  subnet_id               = var.subnet_id
  volume_size             = var.volume_size
  volume_type             = var.volume_type
}