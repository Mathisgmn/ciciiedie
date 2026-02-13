# Terraform infrastructure (C25)

Structure IaC modulaire avec séparation d'environnements.

## Arborescence

- `modules/network` : réseau logique
- `modules/registry` : registre d'images
- `modules/cluster` : cluster Kubernetes
- `modules/compute` : nœuds de calcul
- `envs/dev|staging|prod` : composition par environnement

## Commandes

```bash
cd infra/terraform/envs/dev
terraform init
terraform fmt -check -recursive ../../
terraform validate
terraform plan -out=tfplan
```

## Politique CI

- `fmt`, `validate`, `plan` automatiques
- `apply` manuel et protégé (environnement production)
