resource "aws_security_group" "example_security_group" {
  name        = "example-sg"
  description = "Allow SSH and HTTP inbound traffic"

  vpc_id = aws_vpc.example_vpc.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "example-security-group"
  }
}

output "security_group_id" {
  description = "The ID of the security group"
  value       = aws_security_group.example_security_group.id
}