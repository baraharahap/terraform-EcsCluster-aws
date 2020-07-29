# # main creds for AWS connection
# variable "aws_access_key_id" {
#   description = "AWS access key"
#   default   = ""
# }

# variable "aws_secret_access_key" {
#   description = "AWS secret access key"
#   default   = ""
# }

# variable "ecs_key_pair_name" {
#   description = "EC2 instance key pair name"
#   default   = ""
# }

# variable "region" {
#   description = "AWS region"
#   default   = ""
# }

# ########################### Test VPC Config ################################

# variable "test_vpc" {
#   description = "VPC name for Test environment"
#   default   = ""
# }

# variable "test_network_cidr" {
#   description = "IP addressing for Test Network"
#   default   = "subnet-88e8c6ec"
# }

variable "test_public_01_cidr" {
  description = "Public 0.0 CIDR for externally accessible subnet"
  default   = "subnet-1c97c46a"
}

variable "test_public_02_cidr" {
  description = "Public 0.0 CIDR for externally accessible subnet"
  default   = "subnet-88e8c6ec"
}

########################### Autoscale Config ################################

# variable "max_instance_size" {
#   description = "Maximum number of instances in the cluster"
#   default   = ""
# }

# variable "min_instance_size" {
#   description = "Minimum number of instances in the cluster"
#   default   = ""
# }

# variable "desired_capacity" {
#   description = "Desired number of instances in the cluster"
#   default   = ""
# }