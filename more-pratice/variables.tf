variable "instance_count" {
    type = number
    default = 1
    description = "Number of instances"
}

variable "availability_zones" {
    type = list
    default = [ "us-east-1", "us-west-1" ]
    description = "zones"
}

variable "enable_monitoring" {
    type = bool
    default = "true"
}


variable "tags" {
    type = map(string)
    default={
        Name = "Instance1"
        Project = "Roboshop"
        env = "Dev"
    }
}