##############################################################
# AWS ECS-SERVICE
##############################################################

resource "aws_ecs_service" "service" {
  cluster                = "${aws_ecs_cluster.cluster.id}"                                 # ecs cluster id
  desired_count          = 1                                                      # no of task running
  launch_type            = "EC2"                                                     # Cluster type ECS OR FARGATE
  name                   = "staging-frontend-bara"   
  #service_type           = "daemon"                                      # Name of service
  task_definition        = "${aws_ecs_task_definition.task_definition.arn}"        # Attaching Task to service
  load_balancer {
    container_name       = "staging-frontend-bara"                                  #"container_${var.component}_${var.environment}"
    container_port       = "80"
    target_group_arn     = "${aws_lb_target_group.lb_target_group.arn}"         # attaching load_balancer target group to ecs
 }
  network_configuration {
    security_groups       = ["sg-0ace2ea2818959479"] #CHANGE THIS
    subnets               = ["{subnet-88e8c6ec}", "{subnet-1c97c46a}"]  ## Enter the private subnet id
    assign_public_ip      = "true"
  }
  depends_on              = ["aws_lb_listener.lb_listener"]
}