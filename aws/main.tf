
data "aws_ami" "amzn-linux-2023-ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

resource "aws_instance" "george" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  cpu_options {
    core_count       = 2
    threads_per_core = 2
  }

  tags = {
    Name = var.tags
  }
}
resource "aws_vpc" "george" {
  cidr_block_vpc = var.cidr_block_vpc

  tags = {
    Name = var.tags
  }
}

resource "aws_subnet" "george" {
  vpc_id            = var.vpc_id
  cidr_block_sb     = var.cidr_block_sb
  availability_zone = var.availability_zone

  tags = {
    Name = var.tags
  }
}
