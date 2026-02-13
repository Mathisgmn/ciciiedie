variable "name" { type = string }
variable "network_id" { type = string }

resource "null_resource" "cluster" {
  triggers = {
    name       = var.name
    network_id = var.network_id
  }
}

output "cluster_name" {
  value = var.name
}
