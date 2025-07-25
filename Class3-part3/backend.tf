terraform {
  backend "s3" {
    bucket = "kaizen-abigail"
    key    = "kaizen/terraform.tfstate"
    region = "us-east-1"
  }
}