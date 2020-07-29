############################################################
# AWS ECS-TASK
############################################################

resource "aws_ecs_task_definition" "task_definition" {
  container_definitions    = "${data.template_file.task_definition_json.rendered}"                                         # task defination json file location
  #execution_role_arn       = "none" #CHANGE THIS                                                                      # role for executing task
  family                   = "staging-************"                                                                      # task name FOR TASK DEFINITION
  network_mode             = "awsvpc"                                                                                      # network mode awsvpc, brigde
  memory                   = "300"
  cpu                      = "300"
  requires_compatibilities = ["EC2"]                                                                                       # Fargate or EC2
  #task_role_arn            = "none"  #CHANGE THIS                                                                     # TASK running role
} 

data "template_file" "task_definition_json" {
  template = "${file("${path.module}/task_definition.json")}"
}