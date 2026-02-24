variable "envionment" {
  description = "Envrionment name"
  type = string
  default = "dev"
}

variable "instance_coount" {
    description = "no of ec2 instances"
    type = number
    default = 1
  
}

variable "instance_type" {
    description = "instance type for each environment" 
    type = map(string)

    default = {
      "dev" = "t3.micro"
      "prod" = "t3.small"
    }
}

variable "security_rules" {
    description = "security group rules"
    type = list(object({
    from_port        = number
    to_port          = number
    protocol         = string
    cidr_blocks      = list(string)
    ipv6_cidr_blocks = list(string)
    }))
}