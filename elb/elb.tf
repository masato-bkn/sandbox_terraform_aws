resource "aws_lb" "elb_webserver" {
  name = "elb-webserver"

  security_groups = [aws_security_group.elb_ecurity_group.id]
  subnets         = var.subnet_public_ids

  internal = false
}

resource "aws_lb_target_group" "elb_webserver_target_group" {
  name     = "elb-webserver-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  target_type = "ip"
}

# resource "aws_lb_target_group_attachment" "elb_webserver_target_group_attachment" {
#   target_group_arn = aws_lb_target_group.elb_webserver_target_group.arn
#   target_id        = var.web_server_id
#   port             = 80
# }

resource "aws_lb_listener" "webserver_listener" {
  load_balancer_arn = aws_lb.elb_webserver.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.elb_webserver_target_group.arn
  }
}