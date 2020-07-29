####################################################################
# AWS ECS-ALB
#####################################################################

resource "aws_lb" "loadbalancer" {
  internal            = false # internal = true else false
  name                = "staging-kong-gateway"
  subnets             = ["${var.test_public_02_cidr}", "${var.test_public_01_cidr}"] # enter the private subnet 
  security_groups     = ["sg-0945ee6306088a97f"] #CHANGE THIS
}


resource "aws_lb_target_group" "lb_target_group" {
  name        = "staging-frontend-bara"
  port        = "80"
  protocol    = "HTTP"
  vpc_id      = "vpc-13f19277" # CHNAGE THIS
  target_type = "ip"


#STEP 1 - ECS task Running
  health_check {
    healthy_threshold   = "3"
    interval            = "10"
    port                = "80"
    path                = "/bara*"
    protocol            = "HTTP"
    unhealthy_threshold = "3"
  }
}

resource "aws_lb_listener" "lb_listener" {
  "default_action" {
    target_group_arn = "${aws_lb_target_group.lb_target_group.id}"
    type             = "forward"
  }

  #certificate_arn   = "arn:aws:acm:us-east-1:689019322137:certificate/9fcdad0a-7350-476c-b7bd-3a530cf03090"
  load_balancer_arn = "${aws_lb.loadbalancer.arn}"
  port              = "443"
  protocol          = "HTTPS"
}