resource "aws_vpc" "example_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "example-vpc"
  }
}

resource "aws_subnet" "example_subnet" {
  vpc_id                  = aws_vpc.example_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-west-2a"

  tags = {
    Name = "example-subnet"
  }
}

resource "aws_instance" "example_instance" {
  ami                    = "ami-0c94855ba95c71c99" # This is an Ubuntu AMI ID for us-west-2
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.example_subnet.id

  tags = {
    Name = "example-instance"
  }
}
