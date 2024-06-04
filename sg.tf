resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allow http"
  }

ingress {
    protocol = "tcp"
    cidr_blocks=["0.0.0.0/0"]
    self      = true
    from_port = 80
    to_port   = 80
  }

ingress {
  cidr_ipv6         = ["0.0.0.0/0"]
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

egress{
        description = "Allow all outbound"
        from_port=0
        to_port=0
        protocol="-1"
        cidr_blocks=["0.0.0.0/0"]
    }
    tags = {
      Name="vpc-web"
    }
}
