
output "instance_id" {
  value = "${aws_instance.recoverable_instance.id}"
}

output "public_ip" {
  value = "${aws_instance.recoverable_instance.public_ip}"
}

output "availability_zone" {
  value = "${aws_instance.recoverable_instance.availability_zone}"
}
