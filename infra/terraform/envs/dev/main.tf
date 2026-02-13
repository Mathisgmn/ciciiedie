terraform {
  backend "local" {
    path = "terraform-dev.tfstate"
  }
}

module "network" {
  source = "../../modules/network"
  name   = "microcrm-dev"
  cidr   = "10.10.0.0/16"
}

module "registry" {
  source = "../../modules/registry"
  name   = "microcrm-dev"
}

module "cluster" {
  source     = "../../modules/cluster"
  name       = "microcrm-dev"
  network_id = module.network.network_id
}

module "compute" {
  source       = "../../modules/compute"
  name         = "microcrm-dev"
  cluster_name = module.cluster.cluster_name
  node_count   = 2
}
