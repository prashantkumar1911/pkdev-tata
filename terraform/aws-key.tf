resource "aws_key_pair" "deployer" {
  key_name   = "pkdev-tat-key"
  public_key = file("~/.ssh/pkdev-tata-key.pub")
}