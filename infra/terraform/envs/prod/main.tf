terraform {
  backend "local" {
    path = "terraform-prod.tfstate"
  }
}

module "network" {
  source = "../../modules/network"
  name   = "microcrm-prod"
  cidr   = "10.30.0.0/16"
}

module "registry" {
  source = "../../modules/registry"
  name   = "microcrm-prod"
}

module "cluster" {
  source     = "../../modules/cluster"
  name       = "microcrm-prod"
  network_id = module.network.network_id
}

module "compute" {
  source       = "../../modules/compute"
  name         = "microcrm-prod"
  cluster_name = module.cluster.cluster_name
  node_count   = 5
}
