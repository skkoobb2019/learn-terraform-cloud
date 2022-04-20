provider "aws" {
  region = var.region
}

data "aws_ami" "amazon-linux-2" {
 most_recent = true

 filter {
   name   = "owner-alias"
   values = ["amazon"]
 }

 filter {
   name   = "name"
   values = ["amzn2-ami-hvm*"]
 }

 owners = ["amazon"]
}

resource "aws_instance" "amazon-linux-2" {
  ami           = data.aws_ami.amazon-linux-2.id
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
    "Linux Distribution" = "Amazon Linux 2"
  }
  
}
