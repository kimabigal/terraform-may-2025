resource "aws_key_pair" "deployer" {
 depends_on = [time_sleep.wait_10_seconds]
  key_name   = "bastion-key"
  public_key = file("~/.ssh/id_rsa.pub")
  }


  resource "aws_s3_bucket" "example" {
  bucket = "kaizen-abigail" #unique name for the bucket 
  force_destroy = true
}


resource "aws_s3_object" "object" {
  depends_on = [aws_s3_bucket.example]
  bucket = "kaizen-abigail"
  key    = "main.tf" #what
  source = "main.tf" #where
}


resource "time_sleep" "wait_10_seconds" {
  create_duration = "10s"
}
