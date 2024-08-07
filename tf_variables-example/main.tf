# defining vpc
resource "aws_vpc" "vpc_tf"{
    cidr_block = var.cidr_tf
    tags = {
      "name" = var.vpc_tf
    }
}
# definig subnet 
resource "aws_subnet" "tf_subnet"{
    count = length(var.subnet_tf)
    vpc_id = aws_vpc.vpc_tf.id 
    cidr_block = var.subnet_tf[count.index]
    availability_zone = var.ava_tf[count.index]
    tags = {
      "name" = "terraform_subnet ${count.index}"
    }
}
# defining internetgateway
resource "aws_internet_gateway" "tf_int"{
    vpc_id = aws_vpc.vpc_tf.id 
    tags = {
        "name"= "terraform_intgw"
    }
}
# define routetable and routes
resource "aws_route_table" "rt_tf"{
    vpc_id = aws_vpc.vpc-tf.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.tf_int.id 
    }
}
resource "aws_route_table_association" "assoc_tf" {
    count = lenght(var.subnet_tf)
    route_table_id = aws_internet_gateway.tf_int.id 
    subnet_id = aws_subnet.tf_subnet[count.index].id

}