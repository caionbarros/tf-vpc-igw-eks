```hcl
module "node_groups" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.cluster_name
  cluster_version = "1.17"
  subnets         = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]

  node_groups = {
    eks_nodes = {
      desired_capacity = var.node_count
      max_capacity     = var.node_count
      min_capacity     = var.node_count

      instance_type = var.node_instance_type
      key_name      = var.cluster_name

      additional_tags = {
        Environment = "test"
        Name        = "eksworker"
      }
    }
  }
}
```

