locals{
  ec2-gi=[for f in fileset("${path.module}/aws", "[^_]*.yaml") : yamldecode(file("${path.module}/was/${f}"))]
 ec2_list = flatten([
    for app in local.ec2gi: [
      for azurewaf in try(app.listofec2, []) :{
        name=awsec2.ec2name
      }
    ]
])
}
resource "aws_instance""myec2m"{
    ami=data.aws_ami.amz_linux2.id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.vpc-ssh.id,aws_security_group.vpc-web.id]
    count = 2
    tags = {
     
    }
}
