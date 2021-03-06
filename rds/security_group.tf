resource "aws_security_group" "rds_security_group" {
  name   = "rds_security_group"
  vpc_id = var.vpc_id

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "tcp"
    security_groups = [var.ecs_ecurity_group_id, ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
