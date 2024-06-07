
locals{
aws_ec2=yamldecode(file("${path.module}/$aws/ec2.yaml"))
    awsec2_list= [
      for value in loacl.aws_ec2.listofec2{
        name=value.tagename
        instance_type=value.instance_type
    ]
])
}
resource "aws_instance""awsec2"{ 
  for_each            ={for sp in local.awsec2_list: "${sp.name}"=>sp }
  ami=data.aws_ami.amz_linux2.id
  instance_type       = each.value.instance_type
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id,aws_security_group.vpc-web.id]
   tags = {
        name=each.value.name
}

