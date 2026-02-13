# Sécurité des déploiements (C25)

## Menaces principales

- Injection de secrets dans Git
- Dépendances vulnérables (front/back)
- Vulnérabilités de l'image conteneur
- Régression sécurité lors des merges
- Permissions Kubernetes trop larges

## Contrôles implémentés

- **SAST** : Semgrep (`sast-semgrep`)
- **SCA** : `npm audit --audit-level=high`
- **Secrets scan** : Gitleaks (`secrets-scan`)
- **Image scan** : Trivy sur `image.tar`, fail si vulnérabilité `CRITICAL`
- **RBAC minimal** : `k8s/rbac.yaml` (Role en lecture ciblée)
- **Environnements protégés** : `deploy-prod` manuel

## Gestion des secrets

- Secrets exclus du repo (`.env`, `terraform.tfvars`, state terraform)
- Utiliser variables CI/CD GitLab protégées/maskées :
  - `CI_REGISTRY_PASSWORD`
  - `KUBECONFIG`
  - credentials cloud

## Gates bloquants

Le merge doit être refusé si un job sécurité échoue :

- `sast-semgrep`
- `sca-frontend`
- `secrets-scan`
- `trivy-image-scan`
