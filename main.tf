provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "example" {
    ami = "ami-0aa2b7722dc1b5612"
    instance_type = "t2.micro"
    tags = {
        Name = "Terraform-instance"
    }
}

resource "aws_s3_bucket" "mys3" {
    bucket = "terraform-bucket-shmuel-public"
}

resource "aws_s3_bucket_public_access_block" "mys3" {
    bucket = aws_s3_bucket.mys3.id
    block_public_acls = false
    block_public_policy = false
}