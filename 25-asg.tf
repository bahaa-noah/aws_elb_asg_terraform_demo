resource "aws_launch_configuration" "this" {
  name_prefix   = "terraform-lc-example-"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = "t2.small"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "this" {
  name                 = "demo-asg"
  availability_zones   = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
  launch_configuration = aws_launch_configuration.this.name
  min_size             = 1
  max_size             = 4
  desired_capacity     = 2
  health_check_type    = "ELB"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_attachment" "this" {
  autoscaling_group_name = aws_autoscaling_group.this.id
  lb_target_group_arn    = aws_lb_target_group.this.arn
}
