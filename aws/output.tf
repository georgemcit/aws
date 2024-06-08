variable "ami"{
  type=string
}
variable "instance_type"{
  type=string
}
variable "subnet_id"{
  type=string
}
variable "cidr_block_vpc"{
  type=list(string)
}
variable "cidr_block_sb"{
  type=list(string)
}
variable "vpc_id"{
  type=string
} 
variable "atags"{
  type=string
}
variable "availability_zone"{
  type=string
}
