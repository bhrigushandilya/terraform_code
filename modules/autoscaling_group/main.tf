resource "aws_launch_template" "launch_template" {
    name = "${var.env}-launch_template"
    description = "Launch template for Auto Scaling"
    image_id = var.image_id
    instance_type = var.instance_type
    key_name = var.key_name
    vpc_security_group_ids = [var.security_group_id]
    user_data = filebase64("${path.module}/webserver_script.sh")
}

resource "aws_autoscaling_group" "asg" {
    name = "${var.env}-asg"
    desired_capacity = 2
    max_size = 5
    min_size = 2
    vpc_zone_identifier = var.vpc_zone_identifier
    default_cooldown = 30
    target_group_arns = [var.target_group_arn]
    launch_template {
        id = aws_launch_template.launch_template.id
    }
}