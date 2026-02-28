resource "aws_instance" "example" {

  for_each = toset(["frontend", "backend"])
  ami = "ami-0220d79f3f480ecf5"

  instance_type = "t3.micro"

  tags = {
    Name = each.key
    Project = "Roboshop"
    Envrionment = "Dev"
  }

  connection {
    type = "ssh"
    user = "ec2-user"
    password = "Devops321"
    host = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [ 
        "sudo dnf install nginx -y",
        "sudo dnf start nginx ",
        "sudo systemctl status nginx"
     ]
    
  }

    provisioner "remote-exec" {
    inline = [ 
        "sudo dnf stop nginx"
     ]
    when = destroy
    
  }

}