##########################################################
# AWS ECS-CLUSTER
#########################################################

resource "aws_ecs_cluster" "cluster" {
  name = "staging-*******" #CHANGE WITH YOUR CLUSTER NAME
  tags = {
   name = "staging-*******" #CHANGE WITH YOUR CLUSTER NAME
   }
   
  }