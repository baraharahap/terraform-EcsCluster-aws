##############################################################
# AWS ECS-SERVICE
##############################################################

resource "aws_ecs_service" "service" {
  cluster                = "${aws_ecs_cluster.cluster.id}"                                 # ecs cluster id
  desired_count          = 1                                                      # no of task running
  launch_type            = "EC2"                                                     # Cluster type ECS OR FARGATE
  name                   = "staging-******" #CHANGE WITH YOUR SERVICE NAME  
  #service_type           = "daemon"                                      # Name of service
  task_definition        = "${aws_ecs_task_definition.task_definition.arn}"        # Attaching Task to service
  load_balancer {
    container_name       = "staging-*********"                                  #"container_${var.component}_${var.environment}" CHANGE WITH CONTAINER NAME IN TASK DEFENITION
    container_port       = "80"          #CONTAINER PORT WHEN YOU CREATE TASK DEFINITION
    target_group_arn     = "${aws_lb_target_group.lb_target_group.arn}"         # attaching load_balancer target group to ecs
 }
  network_configuration {
    security_groups       = ["sg-0ac*********"] #CHANGE THIS WITH YOUR CLUSTER SECURITY GROUP
    subnets               = ["${var.test_public*********}", "${var.test_public******}"] ## Enter the private subnet id, TAKE FROM VARIABLES.TF
    assign_public_ip      = "true"
  }
  depends_on              = ["aws_lb_listener.lb_listener"]
}