data "aws_amit" "ami_id" {
  most_recent      = true
  owners           = [973714476881]

  filter {
    name   = "Redhat-9-DevOps-Practice"
    values = ["ami-0220d79f3f480ecf5"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  
}

resource "aws_instance" "instance" {
      count = var.instance_coount
      ami = [data.ami_id]
      instance_type = var.envionment == "prod" ? "t3.medium" : "t2.micro"
      vpc_security_group_ids = [aws_security_group.sg.id]
      tags = {
        Envrionment = var.envionment
        Name = "EC2_INSTANCE"
        
      }

}


resource "aws_security_group" "sg" {
  name   = "dynamic-sg"
  vpc_id = aws_vpc.main.id

  dynamic "ingress" {
    for_each = var.security_rules

    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
}