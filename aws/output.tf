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
  type=list
}
variable "cidr_block_sb"{
  type=list
}
variable "vpc_id"{
  type=string
} 
variable "tags"{
  type=string
}
variable "availability_zone"{
  type=string
}
