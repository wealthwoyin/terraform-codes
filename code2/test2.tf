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


resource "aws_lightsail_instance" "new_server" {
  name              = "my-server"
  availability_zone = "us-east-1a"
  blueprint_id      = "amazon_linux_2"
  bundle_id         = "nano_3_0"
  user_data         = "sudo yum install -y httpd && sudo systemctl start httpd && sudo systemctl enable httpd && echo '<h1>Deployed via Terraform</h1>' | sudo tee /var/www/html/index.html"
  key_pair_name     = "ubuntu-key"
  tags = {
    Team       = "Devops"
    env        = "dev"
    created-by = "terraform"
  }
}

output "my_public_ip" {
  value = aws_lightsail_instance.new_server.public_ip_address

}

output "my-username" {
  value = aws_lightsail_instance.new_server.username
}

output "my-key" {
  value = aws_lightsail_instance.new_server.key_pair_name

}