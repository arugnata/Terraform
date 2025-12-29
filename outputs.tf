output "ec2_instance_id" {
  description = "EC2 Instance ID"
  value       = aws_instance.ec2_server.id
}

output "ec2_public_ip" {
  description = "EC2 Public IP"
  value       = aws_instance.ec2_server.public_ip
}

output "s3_bucket_name" {
  description = "S3 Bucket Name"
  value       = aws_s3_bucket.secure_bucket.bucket
}
