locals{
  ec2_instance=[for f in fileset("${path.module}/aws", "[^_]*.yaml") : yamldecode(file("${path.module}/aws/${f}"))]
  ec2instance_list = flatten([
    for app in local.ec2_instance: [
      for ec2 in try(app.listofec2, []) :{
        name=ec2.name
      }
    ]
])
}


resource "aws_instance" "george" {
  for_each            ={for sp in ec2instance_list: "${sp.name}"=>sp }
  name                = each.value.name
  ami           = data.aws_ami.amzn-linux-2023-ami.id
  instance_type = "c6a.2xlarge"
  
  cpu_options {
    core_count       = 2
    threads_per_core = 2
  }

  tags = {
    Name = "tf-george"
  }
}
