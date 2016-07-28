
resource "aws_instance" "recoverable_instance" {
  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"

  tags {
    Environment = "${var.envtype}"
    Name        = "${var.envname}-${var.envtype}-${var.service_name}-${format("%02d", count.index + 1)}"
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
