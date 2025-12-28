# Provider
provider "aws" {
  region = "us-east-1"
}

# Data Source (Get latest Amazon Linux AMI)
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

# S3 Bucket (Secure)
resource "aws_s3_bucket" "secure_bucket" {
  bucket = "my-secure-terraform-bucket-arugnata"

 }
# Block public access
resource "aws_s3_bucket_public_access_block" "block_public" {
  bucket = aws_s3_bucket.secure_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# EC2 Instance
resource "aws_instance" "ec2_server" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform-EC2"
  }
}
