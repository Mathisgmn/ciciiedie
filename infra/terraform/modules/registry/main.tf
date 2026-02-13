variable "name" { type = string }

resource "null_resource" "registry" {
  triggers = {
    name = var.name
  }
}

output "registry_url" {
  value = "registry.example.com/${var.name}"
}
