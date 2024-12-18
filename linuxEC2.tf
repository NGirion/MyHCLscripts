provider "aws"{
profile="terraform_user"
access_key="AKIATG6MGP3XLRZYI7DZ"
secret_key="V4FBePcbNiU2FFDPCyL7Pn1k/mvzw9cOA4pEOtX6"
region="ap-south-1"
}

resource "aws_instance" "example"{
ami="ami-0fd05997b4dff7aac"
tags={
Name="Linux-instance"
}
instance_type="t2.micro"
key_name="terraform-linux"
security_groups=["${aws_security_group.allow_ssh.name}"]
}

resource "aws_security_group" "allow_ssh"{
name="allow_ssh"
description="allow ssh traffic"

ingress{
from_port=22
to_port=22
protocol="tcp"

cidr_blocks=["0.0.0.0/0"]
}
}
