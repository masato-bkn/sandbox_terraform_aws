resource "aws_lb" "elb_webserver" {
  name = "elb-webserver"

  security_groups = [aws_security_group.elb_ecurity_group.id]
  subnets         = var.subnet_public_ids

  internal = false
}
