module "module_vnet" {
  source            = "./aws/"
  ami               = "data.aws_ami.amzn-linux-2023-ami.id"
  instance_type     = "c6a.2xlarge"
  subnet_id         = "aws_subnet.george.id"
  cidr_block_vpc    = ["172.16.0.0/16"]
  vpc_id            = "aws_vpc.george.id"
  cidr_block_sb     =["172.16.10.0/24"]
  tags              = "tf-george"
  availability_zone = "us-east-2a"
}
