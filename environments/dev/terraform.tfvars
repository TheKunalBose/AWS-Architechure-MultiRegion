region              = "us-east-1"
environment         = "dev"
vpc_cidr            = "10.0.0.0/16"

public_subnet_cidr  = ["10.0.1.0/24", "10.0.7.0/24"]  
web_subnet_cidr     = ["10.0.3.0/24", "10.0.4.0/24"]
app_subnet_cidr     = ["10.0.5.0/24", "10.0.6.0/24"]


availability_zones  = ["us-east-1a", "us-east-1b"]

instance_type       = "t2.micro"  
ami_id              = "ami-007868005aea67c54" 


elb_security_groups = ["sg-0a3c46c65b683021e"]  

nat_gateway_enabled = true  
