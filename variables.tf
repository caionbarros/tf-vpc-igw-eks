```hcl
variable "region" {
  description = "The region where to deploy the infrastructure"
  default     = "us-west-2"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "The CIDR blocks for the public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "The CIDR blocks for the private subnets"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  default     = "my-eks-cluster"
}

variable "node_instance_type" {
  description = "The instance type of the EKS worker nodes"
  default     = "t3a.medium"
}

variable "node_count" {
  description = "The number of worker nodes"
  default     = 2
}
```
