terraform {
  backend "s3" {
    bucket         = "kbzbucket"
    key            = "aws-cloud/dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
  }
}
 