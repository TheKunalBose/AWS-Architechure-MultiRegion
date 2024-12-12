region = "us-west-2"
environment = "prod"
vpc_cidr = "192.168.0.0/16"

public_subnet_cidr = ["192.168.1.0/24", "192.168.2.0/24"]
web_subnet_cidr = ["192.168.3.0/24", "192.168.4.0/24"]
app_subnet_cidr = ["192.168.5.0/24", "192.168.6.0/24"]

availability_zones = ["us-west-2a", "us-west-2b"]

instance_type      = "t3.medium"
ami_id        = "ami-1" 

elb_security_groups = ["sg-a", "sg-b"]  

