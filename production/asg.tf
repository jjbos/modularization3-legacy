module "asg_app" {
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-autoscaling.git?ref=v6.5.3"

  # Autoscaling group
  name                      = format("asg-%s-app-%s", local.env_short, local.app_name)
  min_size                  = 1
  max_size                  = 4
  desired_capacity          = 2
  wait_for_capacity_timeout = 0
  health_check_type         = "EC2"
  health_check_grace_period = 60
  vpc_zone_identifier       = data.aws_subnets.aws_private_subnets.ids

  # Launch template
  update_default_version = true
  image_id               = data.aws_ami.al2_ami.image_id
  instance_type          = "t3.micro"
  ebs_optimized          = true
  enable_monitoring      = true

  block_device_mappings = [
    {
      device_name = "/dev/xvda"
      ebs = {
        delete_on_termination = true
        encrypted             = true
        volume_size           = 25
        volume_type           = "gp3"
        kms_key_id            = aws_kms_key.kms_app.arn
      }
    }
  ]

  network_interfaces = [
    {
      security_groups = [aws_security_group.sgp_app.id]
    }
  ]
}
