output "lb" {
  description = "Exporting the whole Load Balancer"
  value = aws_lb.lb
}

output "lb_target_group" {
  description = "Exporting the whole target group"
  value = aws_alb_target_group.lb_target_group
}