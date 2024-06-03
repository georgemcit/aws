resource "aws_s3_bucket" "george" {
  bucket = "my-tf-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket" "george" {
  bucket = "example-bucket"
}

resource "aws_s3_bucket_acl" "george" {
  bucket = aws_s3_bucket.george.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "versioning_george" {
  bucket = aws_s3_bucket.george.id
  versioning_configuration {
    status = "Disabled"
  }
}
