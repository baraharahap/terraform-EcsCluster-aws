####################################################################
# AWS ECS-ALB
#####################################################################

resource "aws_lb" "loadbalancer" {
  internal            = false # internal = true else false
  name                = "staging-*****" #CHANGE WITH YOUR LOAD BALANCER
  subnets             = ["${var.test_public*********}", "${var.test_public******}"] # enter the private subnet, TAKE FROM VARIABLES.TF
  security_groups     = ["sg-09********"] #CHANGE THIS WITH YOUR SECURITY GROUP ELB
}


resource "aws_lb_target_group" "lb_target_group" {
  name        = "staging-*******" # CHANGE THIS WITH YOUR TARGET GROUP
  port        = "80"
  protocol    = "HTTP"
  vpc_id      = "vpc-*******" # CHANGE THIS WITH YOUR VPC
  target_type = "ip"


#STEP 1 - ECS task Running
  health_check {
    healthy_threshold   = "3"
    interval            = "10"
    port                = "80"
    path                = "/health-check"
    protocol            = "HTTP"
    unhealthy_threshold = "3"
  }
}

resource "aws_lb_listener" "lb_listener" {
  "default_action" {
    target_group_arn = "${aws_lb_target_group.lb_target_group.id}"
    type             = "forward"
  }

  #certificate_arn   = "arn:aws:acm:us-east-1:689019322137:certificate/**********************" CHANGE WITH YOUR CERTIFIATE OR NO IS OK # OPTIONAL
  load_balancer_arn = "${aws_lb.loadbalancer.arn}"
  port              = "443"
  protocol          = "HTTPS"
}