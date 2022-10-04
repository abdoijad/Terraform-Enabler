# Input Variables
# AWS Region
variable "aws_region" {
    description = "Region in which aws resources to be created"
    type = string
    default = "ap-south-1"
}

# AWS EC2 Instance type
variable "instance_type" {
    description = "Ec2 Instance type"
    type = string
    default = "t2.micro"  
}

