locals{
  awsec2 = [for f in fileset("${path.module}/aws", "[^_]*.yaml") : yamldecode(file("${path.module}/aws/${f}"))]
  awsec2_list = [
    for value in local.awsec2.listofec2: {
        name=value.tagname
        instance_type=value.instancetype
      }
    ]
}
resource "aws_instance""awsec2_george"{
    for_each = {for instance in local.awsec2_list: "${instance.name}"=>instance}
     ami=data.aws_ami.amz_linux2.id
     instance_type       = each.value.instance_type
     vpc_security_group_ids = [aws_security_group.vpc-ssh.id,aws_security_group.vpc-web.id]
      tags = {
         name=each.value.name
     }
}

