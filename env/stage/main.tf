module "network" {
  source = "../../modules/network"

  vpc_name = var.vpc_name
  vpc_cidr = var.vpc_cidr
  
  availability_zones = var.availability_zones
  igw_tags = var.igw_tags
  
  public_subnets_cidr      = var.public_subnets_cidr
  public_subnet_tags = var.public_subnet_tags
  
  private_subnets_cidr     = var.private_subnets_cidr
  private_subnet_tags = var.private_subnet_tags
  
  nat_gateway_tags = var.nat_gateway_tags
  
  public_route_table_tags = var.public_route_table_tags
  
  private_route_table_tags = var.private_route_table_tags  
}

module "eks" {
  source = "../../modules/eks"

  cluster_name = var.cluster_name
  
  cluster_version = var.cluster_version
  
  vpc_id = module.network.vpc_id
  
  subnet_ids = concat (module.network.private_subnets, module.network.public_subnets)
  
  private_subnet_ids = module.network.private_subnets
  
  instance_types = var.instance_types
}