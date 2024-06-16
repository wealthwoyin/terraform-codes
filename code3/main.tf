
resource "aws_lightsail_instance" "new_server" {
  name              = "my-server"
  availability_zone = "us-east-1a"
  blueprint_id      = "amazon_linux_2"
  bundle_id         = "nano_3_0"
  user_data         = file("script.sh")
  key_pair_name     = "ubuntu-key"
  tags = {
    Team       = "Devops"
    env        = "dev"
    created-by = "terraform"
  }
}
