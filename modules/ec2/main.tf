resource "aws_instance" "web" {
  count             = length(var.subnets)
  ami               = var.ami_id
  instance_type     = var.instance_type
  security_groups   = var.security_groups
  subnet_id         = var.subnets[count.index]
  vpc_security_group_ids = var.security_groups
  associate_public_ip_address = true

  tags = {
    Name = "${var.environment}-web-instance-${count.index + 1}"
  }
}

resource "aws_instance" "app" {
  count             = length(var.subnets)
  ami               = var.ami_id
  instance_type     = var.instance_type
  security_groups   = var.security_groups
  subnet_id         = var.subnets[count.index]
  vpc_security_group_ids = var.security_groups
  associate_public_ip_address = true

  tags = {
    Name = "${var.environment}-app-instance-${count.index + 1}"
  }
}

resource "aws_instance" "ec2_instance" {
  count             = length(var.subnets)
  ami               = var.ami_id
  instance_type     = var.instance_type
  subnet_id         = var.subnets[count.index]
  security_groups   = var.security_groups
  vpc_security_group_ids = var.security_groups
  tags = {
    Name        = "${var.environment}-ec2-${count.index + 1}"
    Environment = var.environment
  }
}


