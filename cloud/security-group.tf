resource "aws_security_group" "security_group" {
  name_prefix = "worker_group"
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port = 50
    to_port = 50
    protocol = "tcp"
  }
}