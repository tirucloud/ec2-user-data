resource "aws_instance" "ec2_example" {
  ami           = "ami-06b09bfacae1453cb"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-094e7bff7507b111d"]
  subnet_id              = "subnet-08b6268ee1f351b3e"
  # 2. Key Name
  # Specify the key name and it should match with key_name from the resource "aws_key_pair"
  key_name = var.aws_key_pair
  user_data = file("${path.module}/userdata.tpl")
  tags     = {
    Name = "Terraform EC2 - using tls_private_key module"
  }
  depends_on = [var.aws_key_pair]
}