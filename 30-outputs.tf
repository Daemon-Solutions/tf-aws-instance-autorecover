
output "instance_id" {
  value = "${aws_instance.recoverable_instance.id}"
}

output "availability_zone" {
  value = "${aws_instance.recoverable_instance.availability_zone}"
}
