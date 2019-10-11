provider "aws" {
  profile = "default"
  region = "eu-central-1"
}

resource "aws_cloud9_environment_ec2" "alex-mythical-mysfits-cloud9-ide" {
  instance_type = "t2.micro"
  name = "MythicalMysfitsIDE"
  automatic_stop_time_minutes = 30
}

resource "aws_s3_bucket" "alex-mythical-mysfits-s3-bucket" {
  bucket = "alex-mythical-mysfits"
  acl = "public-read"
  policy = file("../aws-cli/website-bucket-policy.json")
}

resource "aws_s3_bucket_object" "alex-mythical-mysfits-s3-file-index" {
  depends_on = [aws_s3_bucket.alex-mythical-mysfits-s3-bucket]
  bucket = "alex-mythical-mysfits"
  key = "index.html"
  source = "../web/index.html"
}