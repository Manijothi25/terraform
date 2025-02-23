
provider "aws" {
  region = "ap-south-1"  
  access_key = "AKIAW3MD6R6YBMKCG47N"
  secret_key = "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"
}
resource "aws_vpc" "vpc-dev" {
    cidr_block = "10.0.0.0/16"
    tags = {
        "Name" = "vpc-dev"
    }
}
resource "aws_internet_gateway" "vpc-dev-igw" {
    vpc_id = aws_vpc.vpc-dev.id
}
resource "aws_eip" "my-eip" {
    domain= "vpc"
    tags ={
        "Name"="my-eip"
    }
 depends_on = [aws_internet_gateway.vpc-dev-igw]
 }