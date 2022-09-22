# creating subnet1
resource "aws_subnet" "tf-sn-1" {
  vpc_id                  = aws_vpc.tf-vpc.id
  cidr_block              = "192.168.100.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-south-1a"

  tags = {
    name = "tf-sn-1"
  }
}


# creating subnet2
resource "aws_subnet" "tf-sn-2" {
  vpc_id                  = aws_vpc.tf-vpc.id
  cidr_block              = "192.168.200.0/24"
  map_public_ip_on_launch = false
  availability_zone       = "ap-south-1b"

  tags = {
    "name" = "tf-sn-2"
  }
}
