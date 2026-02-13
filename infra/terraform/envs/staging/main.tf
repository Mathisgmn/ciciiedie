terraform {
  backend "local" {
    path = "terraform-staging.tfstate"
  }
}

module "network" {
  source = "../../modules/network"
  name   = "microcrm-staging"
  cidr   = "10.20.0.0/16"
}

module "registry" {
  source = "../../modules/registry"
  name   = "microcrm-staging"
}

module "cluster" {
  source     = "../../modules/cluster"
  name       = "microcrm-staging"
  network_id = module.network.network_id
}

module "compute" {
  source       = "../../modules/compute"
  name         = "microcrm-staging"
  cluster_name = module.cluster.cluster_name
  node_count   = 3
}
