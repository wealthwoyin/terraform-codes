
output "my_public_ip" {
  value = aws_lightsail_instance.new_server.public_ip_address

}

output "my-username" {
  value = aws_lightsail_instance.new_server.username
}

output "my-key" {
  value = aws_lightsail_instance.new_server.key_pair_name

}