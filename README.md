# tf-aws-instance-autorecover

Create an EC2 instance that will autorecover

## Usage

```
module "instance_recovery" {
  envname       = "test"
  envtype       = "prod"
  instance_type = "m4.xlarge"
  ami_id        = "ami-ec680b9f"
  service_name  = "test-web"
}
```

## Variables

* `envname` - The name of the environemt or vpc that the bastions are being deployed into
* `envtype` - The type of environemt e.g. nonprod, prod
* `aws_region` - The region in which the instance should be located
* `instance_type` - The instnace type/size
* `ami_id` - The id of the ami to use when creating the instance
* `service_name` - The name of the service for which this instance is a member
