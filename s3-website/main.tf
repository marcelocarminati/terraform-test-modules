provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket = "sample-terraform-marcelocarminati" #seu bucket
    key    = "module-s3-website/terraform.tfstate"
    region = "us-east-1"
  }
}

module "s3" {
  source = "github.com/marcelocarminati/terraform-module-s3-website?ref=v0.2"

  bucket_name            = var.bucket_name
  cors_allowed_headers   = var.cors_allowed_headers
  cors_allowed_methods   = var.cors_allowed_methods
  cors_allowed_origins   = var.cors_allowed_origins
  cors_max_age_seconds   = var.cors_max_age_seconds
  region                 = var.region
  versioning             = var.versioning
  website_index_document = var.website_index_document
  website_error_document = var.website_error_document
}