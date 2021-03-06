
resource "aws_instance" "recoverable_instance" {
  ami                    = "${var.ami_id}"
  instance_type          = "${var.instance_type}"
  user_data              = "${var.user_data}"
  security_groups        = ["${split(",",var.security_groups)}"]
  subnet_id              = "${var.subnet_id}"
  availability_zone      = "${var.availability_zone}"
  iam_instance_profile   = "${var.iam_instance_profile}"
  
  tags {
    Environment = "${var.envtype}"
    Name        = "${var.envname}-${var.envtype}-${var.service_name}-${var.instance_number}"
    Service     = "${var.service_name}"
  }
}

resource "aws_cloudwatch_metric_alarm" "autorecover" {
  alarm_name          = "ec2-autorecover-${var.service_name}"
  namespace           = "AWS/EC2"
  evaluation_periods  = "2"
  period              = "60"
  alarm_description   = "This metric auto recovers EC2 instances"
  alarm_actions       = ["arn:aws:automate:${var.aws_region}:ec2:recover"]
  statistic           = "Minimum"
  comparison_operator = "GreaterThanThreshold"
  threshold           = "0"
  metric_name         = "StatusCheckFailed_System"
  dimensions {
    InstanceId = "${aws_instance.recoverable_instance.id}"
  }
}
