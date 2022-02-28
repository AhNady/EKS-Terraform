module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.11.3"
  name = var.vpc_name
  cidr = var.vpc_cidr
  
  azs = var.availability_zones
  
  # Create igw with tag name igw
  create_igw = true
  igw_tags = var.igw_tags
  
  # Create public subnet
  public_subnets      = var.public_subnets_cidr
  map_public_ip_on_launch = true
  public_subnet_tags = var.public_subnet_tags
  
  # Create private subnet
  private_subnets     = var.private_subnets_cidr
  private_subnet_tags = var.private_subnet_tags
  
  # Create nat gateway
  enable_nat_gateway = true
  nat_gateway_tags = var.nat_gateway_tags
  
  # Public route table 
  public_route_table_tags = var.public_route_table_tags
  
  # Private route table
  private_route_table_tags = var.private_route_table_tags
  
}

