#Mandatory parameters
variable "aws_region" {
  type        = string
  description = "AWS region"
  #define here the region where DAPFW will be deployed
  default = "eu-west-1"
}

variable "vpc_name" {
  type        = string
  description = "Name of the VPC to be used for the glue jobs"
  #define here the name of the VPC to be used by the glue jobs
  default = "private-dev-aftersales"
}


