provider "aws"{
  region = var.region 
  profile = "dev"  
  shared_credentials_files = ["/home/dog/.aws/credentials"]
}


resource "aws_instance" "my_ec2_instance" {
  ami = var.ami 
  instance_type = var.instance_type 

  tags = {

    Name = var.Name

  }
}
