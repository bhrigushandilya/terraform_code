resource "aws_alb_target_group" "lb_target_group" {
  name = "${var.env}-target-group"
  port = 80
  protocol = "HTTP"
  target_type = "instance"
  vpc_id = var.vpc_id
}

resource "aws_lb_target_group_attachment" "lb_tg_attachment_1" {
  target_group_arn = aws_alb_target_group.lb_target_group.arn
  target_id = var.instance_id[0]
  port = 80
}

resource "aws_lb_target_group_attachment" "lb_tg_attachment_2" {
  target_group_arn = aws_alb_target_group.lb_target_group.arn
  target_id = var.instance_id[1]
  port = 80
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.lb.arn
  port = 80
  protocol = "HTTP"
  default_action {
      type = "forward"
      target_group_arn = aws_alb_target_group.lb_target_group.arn
  }
}

resource "aws_lb" "lb" {
  name = "${var.env}-lb"
  load_balancer_type = var.lb_type
  enable_cross_zone_load_balancing = true
  security_groups = [var.security_group_id]
  subnets = var.subnet_id
  tags = {
    Environment = var.env
  }
}