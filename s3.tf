resource "aws_s3_bucket" "george" {
    count=5
    tags = {
        name="george-bucket-${count.index}"
        }
}

resource "aws_s3_bucket_versioning" "versioning_george" {
   bucket ="george-bucket-${count.index}"
  versioning_configuration {
    status = "Disabled"
  }
}

