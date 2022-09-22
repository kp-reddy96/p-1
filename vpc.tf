# creating a vpc
resource "aws_vpc" "tf-vpc" {
  cidr_block       = "192.168.0.0/16"
  instance_tenancy = "default"
  tags = {
    name = "tf-vpc"
  }


}