module "nlb_app" {
  source = "git@github.com:jjbos/modularization3-nlb.git?ref=v1.0.0"

  env_short           = local.env_short
  app_name            = local.app_name
  lb_subnet_ids       = data.aws_subnets.aws_private_subnets.ids
  protocol            = local.protocol_map
  vpc_id              = data.aws_vpc.vpc.id
  asg_name            = module.asg_app.autoscaling_group_name

}