resource "aws_lb" "elb" {
  name               = "${var.environment}-elb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_groups
  subnets            = var.public_subnets
  enable_deletion_protection = false

  tags = {
    Name        = "${var.environment}-elb"
    Environment = var.environment
  }
}


resource "aws_lb_target_group" "tg" {
  name        = "${var.environment}-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "instance"
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.elb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}
