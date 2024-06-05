locals{
  linux_app=[for f in fileset("${path.module}/$aws", "[^_]*.yaml") : yamldecode(file("${path.module}/$aws/${f}"))]
  linux_app_list = flatten([
    for app in local.linux_app : [
      for linuxapps in try(app.listoflinuxapp, []) :{
        ami=data.aws_ami.amz_linux2.id
        instance_type = var.instance_type
        sku_name=linuxapps.sku_name  
        vpc_security_group_ids = [aws_security_group.vpc-ssh.id,aws_security_group.vpc-web.id]
      }
    ]
])
}
resource "aws_instance""myec2m"{ {
  for_each            ={for sp in local.linux_app_list: "${sp.name}"=>sp }
  name                = each.value.name
  resource_group_name = azurerm_resource_group.georgeibrahim.name
  location            = azurerm_resource_group.georgeibrahim.location
  os_type             = each.value.os_type
  sku_name            = each.value.sku_name
}

resource "aws_instance""myec2m"{ {
  for_each            = azurerm_service_plan.george
  name                = each.value.name
  resource_group_name = azurerm_resource_group.georgeibrahim.name
  location            = azurerm_resource_group.georgeibrahim.location
  service_plan_id     = each.value.id
 site_config {}
}


