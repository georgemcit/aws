resource "aws_s3_bucket" "george" {
    count=5
    tags = {
        name="george-bucket-${count.index}"
        }
}

resource "aws_s3_bucket_versioning" "versioning_george" {
  bucket = aws_s3_george-bucket-$[count.index].id
  versioning_configuration {
    status = "Disabled"
  }
}

