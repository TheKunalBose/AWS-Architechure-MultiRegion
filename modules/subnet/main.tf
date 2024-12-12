# Create Public Subnets
resource "aws_subnet" "public" {
  count = length(var.public_subnet_cidr)

  vpc_id                  = var.vpc_id
  cidr_block              = element(var.public_subnet_cidr, count.index)
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "Public-${count.index + 1}"
    Environment = var.environment
  }
}

# Create Web Subnets 
resource "aws_subnet" "web" {
  count = length(var.web_subnet_cidr)

  vpc_id                  = var.vpc_id
  cidr_block              = element(var.web_subnet_cidr, count.index)
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "Web-${count.index + 1}"
    Environment = var.environment
  }
}

# Create App Subnets
resource "aws_subnet" "app" {
  count = length(var.app_subnet_cidr)

  vpc_id                  = var.vpc_id
  cidr_block              = element(var.app_subnet_cidr, count.index)
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = false
  tags = {
    Name = "App-${count.index + 1}"
    Environment = var.environment
  }
}

# # Output the subnet IDs
# output "public_subnets" {
#   description = "List of public subnets"
#   value       = aws_subnet.public[*].id
# }

# output "web_subnets" {
#   description = "List of web subnets"
#   value       = aws_subnet.web[*].id
# }

# output "app_subnets" {
#   description = "List of app subnets"
#   value       = aws_subnet.app[*].id
# }
