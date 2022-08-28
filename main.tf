provider "aws" {
 
    region = "us-east-1"
    access_key = "AKIAWVQMKDHPTO6BXEXM"
    secret_key = "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"
}



# create VPC
resource "aws_vpc" "development-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "develop-vpc"
  }
}


#create variable
variable "vars-dev" {
  description = "change the subnet-a"
  
}

#create subnet VPC
resource "aws_subnet" "dev-subnet-a" {
  vpc_id = aws_vpc.development-vpc.id  
  cidr_block = var.vars-dev
  availability_zone = "us-east-1a"
   tags = {
    Name = "dev-subnet-a"
  }
}
#create subnet VPC
resource "aws_subnet" "dev-subnet-b" {
  vpc_id     = aws_vpc.development-vpc.id
  cidr_block = "10.0.20.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "dev-subnet-b"
  }
}