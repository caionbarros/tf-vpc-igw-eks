```hcl
module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.cluster_name
  cluster_version = "1.20"
  subnets         = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]

  vpc_id = aws_vpc.main.id

  node_groups = {
    eks_nodes = {
      desired_capacity = var.node_count
      max_capacity     = var.node_count
      min_capacity     = var.node_count

      instance_type = var.node_instance_type
      key_name      = var.key_name

      additional_tags = {
        Environment = "test"
        Name        = "eks-worker-node"
      }
    }
  }

  write_kubeconfig   = true
  config_output_path = "./"
  manage_aws_auth    = true

  map_roles = [
    {
      rolearn  = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${aws_iam_role.demo_role.name}"
      username = "admin"
      group    = "system:masters"
    }
  ]

  map_users = [
    {
      userarn  = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/${var.user_name}"
      username = var.user_name
      group    = "system:masters"
    }
  ]

  map_accounts = [data.aws_caller_identity.current.account_id]

  cluster_enabled_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
  cluster_log_retention_in_days = 7

  cluster_endpoint_private_access = false
  cluster_endpoint_public_access  = true

  cluster_create_security_group  = true
  cluster_create_iam_resources   = true
  manage_cluster_iam_resources   = true
  write_aws_auth_config          = true
  manage_worker_iam_resources    = true
  workers_role_arns              = [aws_iam_role.demo_role.arn]
  workers_role_name              = aws_iam_role.demo_role.name
  workers_role_policy_arns       = [aws_iam_policy.demo_policy.arn]
  workers_role_policy_arns_count = 1
}
```

