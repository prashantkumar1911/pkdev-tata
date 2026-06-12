resource "aws_security_group" "pkdev_tata_sg" {
  name        = "pkdev-tata-sg"
  description = "Allow 22 from MyIP and 8080 for all"
}

resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.pkdev_tata_sg.id

  cidr_ipv4   = local.my_ip
  from_port   = 22
  to_port     = 22
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "allow_8080" {
  security_group_id = aws_security_group.pkdev_tata_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 8080
  to_port     = 8080
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "all_outbound" {
  ip_protocol       = "-1"
  security_group_id = aws_security_group.pkdev_tata_sg.id
  cidr_ipv4         = "0.0.0.0/0"
}

locals {
  my_ip = format("%s/32", chomp(data.http.get_my_ip.response_body))
}