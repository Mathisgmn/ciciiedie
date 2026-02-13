# Déploiement staging (exemple simple)

## Objectif

Fournir un job `deploy-staging` pédagogique dans GitHub Actions, déclenché manuellement.

## Fonctionnement actuel

Le job est dans `.github/workflows/ci.yml` et s’exécute via `workflow_dispatch`.
Par défaut, il affiche un message (placeholder) pour montrer où brancher un vrai déploiement.

## Brancher un vrai déploiement

Selon votre cible, ajouter les secrets GitHub nécessaires :

- `STAGING_SSH_HOST`
- `STAGING_SSH_USER`
- `STAGING_SSH_KEY`
- ou `KUBECONFIG` / token de plateforme

Puis remplacer l’étape placeholder par une commande réelle, par exemple :

- copie d’artefacts + redémarrage service via SSH
- `kubectl apply` sur un cluster de staging
- appel d’API de plateforme

## Où configurer les secrets

GitHub → `Settings` → `Secrets and variables` → `Actions` → `New repository secret`.
