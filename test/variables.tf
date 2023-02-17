variable "private_subnets" {
  type = map
  default = {
    private-a = {
      az = "eu-west-1a"
      cidr_block = "10.1.3.0/24"
    },
    private-b = {
      az = "eu-west-1b"
      cidr_block = "10.1.4.0/24"
    }
  }
}
