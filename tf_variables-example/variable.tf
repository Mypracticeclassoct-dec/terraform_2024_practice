variable "vpc_tf" {
type= string 
default = "terraform_vpc"
description = "This variable is defined to pass the vpc name in the resource "  
}
# cidr range for the vpc 
variable "cidr_tf" {
    type = string 
    default = "10.0.0.0/16"
    description = "the cidr range of the vpc"
}
# define the subnet 
variable "subnet_tf" {
  type = list(string)
  default = ["10.0.0.1/28","10.0.0.2/28"]
  description = "The subnets cidrs "
}
# define the availability zone
variable "ava_tf" {
  type = list(string)
  default = [ "us-east-1a","us-east-1b" ]
  description= "The availability zone for subnet to be created"
}