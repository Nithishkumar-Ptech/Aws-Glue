resource "aws_vpc" "main" {
  cidr_block           = var.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "my-vpc"
  }
}

resource "aws_subnet" "subnet" {
  count             = length(var.azs)
  cidr_block        = cidrsubnet(var.cidr_block, 8, count.index)
  vpc_id            = aws_vpc.main.id
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "subnet-${count.index}"
  }
}
