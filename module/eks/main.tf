resource "aws_iam_role" "eks-nodes-role" {
  name = "eks-node-group-nodes"

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "nodes-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.eks-nodes-role.name
}

resource "aws_iam_role_policy_attachment" "nodes-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.eks-nodes-role.name
}

resource "aws_iam_role_policy_attachment" "nodes-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.eks-nodes-role.name
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "18.2.3"
  cluster_name                    = var.cluster_name
  cluster_version                 = var.cluster_version
  vpc_id     = var.vpc_id
  subnet_ids = var.subnet_ids
 
 eks_managed_node_group_defaults = {
	subnet_ids = var.private_subnet_ids
  }
  
   # EKS Managed Node Group(s)
   eks_managed_node_groups = {
    private-nodes = {
      min_size     = 1
      max_size     = 5
      desired_size = 2
	  iam_role_arn = aws_iam_role.eks-nodes-role.arn		
      instance_types = var.instance_types

      tags = {
		"k8s.io/cluster-autoscaler/eks-cluster"    = "owned"
		"k8s.io/cluster-autoscaler/enabled"           = "TRUE"
      }
	  
    }
  }
}