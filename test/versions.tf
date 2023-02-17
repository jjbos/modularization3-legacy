# Feel free to bump provider versions, when needed. It is suggested to test in 'development' or 'test' first.
# Check the references changelogs for bugfixes and features.
terraform {
  required_providers {
    aws = {
      # changelog at https://github.com/hashicorp/terraform-provider-aws/blob/main/CHANGELOG.md
      source  = "hashicorp/aws"
      version = "4.53.0"
    }
  }
}
