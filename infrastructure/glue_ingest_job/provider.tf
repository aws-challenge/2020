# Parameters to set externally:
# * AWS region (e.g. by exporting AWS_DEFAULT_REGION env variable)

provider "aws" {}
provider "random" {}
provider "null" {}
provider "template" {}
provider "external" {}