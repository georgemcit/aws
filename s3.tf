resource "aws_s3_bucket" "george" {
    count=5
    tags = {
        name="george-bucket-${count.index}"
        }
}

resource "aws_s3_bucket_versioning" "versioning_george" {
   for_each = aws_s3_bucket.george.id
  versioning_configuration {
    status = "Disabled"
  }
}

