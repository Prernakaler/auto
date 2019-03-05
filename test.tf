resource "aws_instance" "ec21" {
        ami = "${lookup(var.ami, var.architecture)}"
        instance_type ="${var.InstanceType}"
        availability_zone = "us-east-1a"
        key_name = "${var.key_name}"
        subnet_id = "${var.subnetid}"
        security_groups =[ "${var.securitygroup}"]
        tags {
                Name = "ec2instance"
}
        /*count = "${lookup(var.instance_count, var.no_of_instances)}"*/
}

output "Public_dns" {
  value = "${aws_instance.ec21.public_dns}"
}
output "Name_of_ec2" {
  value = "${aws_instance.ec21.tags.Name}"
}

