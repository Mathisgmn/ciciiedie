variable "name" { type = string }
variable "cluster_name" { type = string }
variable "node_count" { type = number }

resource "null_resource" "compute" {
  triggers = {
    name         = var.name
    cluster_name = var.cluster_name
    node_count   = tostring(var.node_count)
  }
}

output "node_pool" {
  value = "${var.name}-${var.node_count}"
}
