# security group to define access from load balancer to app servers
resource "aws_security_group" "sgp_app" {
  name        = "sgp-${local.env_short}-app-${local.app_name}"
  description = "Security group for APP"
  vpc_id      = data.aws_vpc.vpc.id

  tags = {
    Name = "sgp-${local.env_short}-app-${local.app_name}"
  }
}

resource "aws_security_group_rule" "sgr_app_ext_ingress" {
  type                     = "ingress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  security_group_id        = aws_security_group.sgp_app.id
  cidr_blocks              = values(data.aws_subnet.aws_private_subnet).*.cidr_block
  description              = "connections from end users"
}
