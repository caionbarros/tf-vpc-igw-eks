```hcl
provider "aws" {
  region = var.region
}

provider "random" {}

provider "local" {}

provider "null" {}

provider "template" {}

data "aws_availability_zones" "available" {}

data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "cluster_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "node_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}
```

