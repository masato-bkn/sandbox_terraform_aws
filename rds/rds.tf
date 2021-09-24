resource "aws_db_instance" "sample_db" {
  name                   = "sample"
  allocated_storage      = 10
  engine                 = "postgres"
  engine_version         = "11.5"
  instance_class         = "db.t2.micro"
  username               = "hoge"
  password               = "hogehoge"
  vpc_security_group_ids = [aws_security_group.rds_security_group.id, ]
  db_subnet_group_name   = aws_db_subnet_group.praivate_subnet_group.name
  skip_final_snapshot    = true
}

resource "aws_db_subnet_group" "praivate_subnet_group" {
  name       = "praivate_subnet_group"
  subnet_ids = var.subnet_private_ids
}
