// EC2 Instance Resource for Module
resource "aws_instance" "mod" {
  ami = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  count = "${var.number_of_instances}"

  key_name = "${var.key_pair}"
  subnet_id = "${var.subnet_id}"
  availability_zone = "${var.az}"
  associate_public_ip_address = "${var.associate_public_ip_address}"
  vpc_security_group_ids = ["${var.vpc_security_group_ids}"]
  iam_instance_profile = "${var.instance_profile}"
  monitoring = "${var.monitoring}"

  provisioner "remote-exec" {
    inline = "${var.provisioner_commands}"

    connection {
      type     = "ssh"
      user     = "${var.instance_user}"
      private_key = "${var.server_pem}"
    }
  }

  tags = "${merge(var.tags, map("Name", format("%s-%02d", var.name, count.index + 1)))}"
}
