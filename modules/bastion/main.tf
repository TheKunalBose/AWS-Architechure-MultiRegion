resource "aws_instance" "bastion" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.public_subnets[0] 
  associate_public_ip_address = true

  tags = {
    Name        = "${var.environment}-bastion"
    Environment = var.environment
  }
}
