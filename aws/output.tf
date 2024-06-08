variable "ami"{
  type=string
}
variable "instance_type"{
  type  =string
}
variable "subnet_id"{
  type  =string
}
variable "vpc_cidr_block"{
  type  =list(string)
}
variable "sb_cidr_block"{
  type  =list(string)
}
variable "vpc_id"{
  type  =string
} 
variable "tags"{
  type  =string
}
variable "availability_zone"{
  type  =string
}
