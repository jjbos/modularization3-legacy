# account-id
locals {
  account_id = data.aws_caller_identity.current.account_id
}

# environment/application specific local variables
locals {
  environment = "production"
  project     = "JJB Project Modularization - Legacy"
  app_name    = "crm"
}

locals {
  mandatory_tags = {
    "environment" = local.environment
    "project"     = local.project
    "application" = local.app_name
  }
}

locals {
  env_identifier      = substr(local.environment, 0, 1)
  alias_kms_key_app   = format("kms-%s-%s-euw1-key", local.app_name, local.env_identifier)
  count_app_instances = 2
}


locals {
  # Defines short environment name
  env_map = {
    "development" = "dev"
    "test"        = "test"
    "acceptance"  = "acc"
    "production"  = "prod"
  }
  env_short = lookup(local.env_map, local.environment, null)
}

locals {
  ports-ingress-app = [443]
  protocol_map  = {for idx, val in local.ports-ingress-app: idx => val}
}
