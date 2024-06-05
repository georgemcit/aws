\*
resource "aws_s3_bucket" "george" {
    count=5
    tags = {
        name="george-bucket-${count.index}"
        }
}

*/

