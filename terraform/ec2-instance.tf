resource "aws_instance" "pkdev_tata" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  vpc_security_group_ids = [
    aws_security_group.pkdev_tata_sg.id
  ]
  key_name = aws_key_pair.deployer.key_name
  tags = {
    Name  = "pkdev-tata"
    Env   = "Prod"
    Owner = "Prashant"
  }
}