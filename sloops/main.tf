resource "aws_instance" "web" {
  count = length(var.instance)
  ami                    = data.aws_ami.example.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.sg.id]

  tags = {
    Name = var.instance[count.index]
  }
}

data "aws_ami" "example" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]
}

variable "instance" {
  default = ["frontend","mongodb","catalogue"]
}



