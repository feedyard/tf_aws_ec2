// EC2 Instance Resource for Module
resource "aws_instance" "mod" {
  ami = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  count = "${var.number_of_instances}"

  key_name = "${var.key_pair}"
  subnet_id = "${var.subnet_id}"
  availability_zone = "${var.az}"
  associate_public_ip_address = "${var.associate_public_ip_address}"
  vpc_security_group_ids = ["${var.vpc_security_group_ids}}"]
  iam_instance_profile = "${var.instance_profile}"
  monitoring = "${var.monitoring}"

  tags = "${merge(var.tags, map("Name", format("%s", var.name, count.index)))}"
}