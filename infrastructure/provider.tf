# Parameters to set externally:
# * AWS region (e.g. by exporting AWS_DEFAULT_REGION env variable)

provider "aws" {
  version = "~> 2.56.0"
  region  = var.aws_region
}

provider "random" {
  version = ">= 2.2"
}
provider "null" {
  version = "~> 2.1"
}
provider "template" {
  version = ">= 2.1"
}
provider "external" {
  version = ">= 1.2"
}