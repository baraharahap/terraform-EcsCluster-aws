##########################################################
# AWS ECS-CLUSTER
#########################################################

resource "aws_ecs_cluster" "cluster" {
  name = "staging-frontend-bara"
  tags = {
   name = "staging-frontend-bara"
   }
   
  }