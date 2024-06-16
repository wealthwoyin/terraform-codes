
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.61.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}

resource "aws_lightsail_instance" "centos7_server" {
  name              = "my-server"
  availability_zone = "us-east-1a"
  blueprint_id      = "centos_7_2009_01"
  bundle_id         = "nano_3_0"
  key_pair_name     = "centos-key"
  tags = {
    Team       = "Devops"
    env        = "dev"
    created-by = "terraform"
  }
}

output "my-username" {
  value = aws_lightsail_instance.centos7_server.username
}

output "my_public_ip" {
  value = aws_lightsail_instance.centos7_server.public_ip_address

}