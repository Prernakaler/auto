/*variable "aws_access_key" {}
variable "aws_secret_key" {}
#variable "aws_key_path" {}
#variable "key_name" {}

variable "aws_region"{
default = "us-east-1"
}

variable "vpcid" {
        description = "The VPC to deploy into, allowed values: vpc-a388f8d8"
default = "vpc-a388f8d8"
}

variable "subnetid"{
        description = "allowed values:subnet-06a7aa773206e667c , Id of an existing subnet (for the primary network) in your Virtual Private Cloud (VPC)"
default = "subnet-06a7aa773206e667c"
}

variable "securitygroup"{
        description = "allowed values: sg-655dfe2c , Id of an existing security group (for the primary network) in your Virtual Private Cloud (VPC)"
default = "sg-655dfe2c"
}

variable "InstanceType"{
 description = "t2.medium, m3.large, m3.xlarge, m3.2xlarge, cc2.8xlarge, c3.xlarge, c3.2xlarge, c3.4xlarge, c3.8xlarge, c4.xlarge, c4.2xlarge, c4.4xlarge, c4.8xlarge"
default = "t2.micro"
}

variable "architecture" {
description = " allowed values: x86-64"
default = "x86-64"
}

variable "ami"{
        type = "map"
}

variable "key_name"{
*/
                
        variable "ami"{
                }
        variable "architecture"{
                }
        variable "subnetid"{
                }
        variable "InstanceType"{}
        variable "key_name"{}
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

