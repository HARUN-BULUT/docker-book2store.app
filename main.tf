
resource "aws_instance" "tf-ec2" {
  ami = data.aws_ami.amazon-linux-2023.id
  instance_type = var.instance_type
  count = var.num_of_instance
  vpc_security_group_ids = [ aws_security_group.tf-sec-grp.id ]
  user_data = base64decode("${file("user-data.sh")}")
  tags = {
    Name = "Harun-bookstore"
  }
}
resource "aws_security_group" "tf-sec-grp" {
  name = "bookstore-sec-grp"
  vpc_id = data.aws_vpc.selected.id

  ingress = {
        from_port = 80
        protocol = "tcp"
        to_port = 80
        cidr_blocks = ["0.0.0.0/0"]
  }
  ingress = {
        from_port = 22
        protocol = "tcp"
        to_port = 22
        cidr_blocks = ["0.0.0.0/0"]
  }
  egress = {
    from_port = 0
    protocol = -1
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }



}
