# Kubernetes (niveau simple / pédagogique)

Ce repository n’est pas orienté production Kubernetes aujourd’hui.
Pour rester dans le scope étudiant (simple et cohérent), on documente ici une approche minimale.

## Pourquoi Kubernetes ?

Kubernetes sert à :

- orchestrer plusieurs conteneurs/services
- redémarrer automatiquement en cas d’échec
- scaler horizontalement les pods
- séparer les environnements (dev/staging/prod)

## Manifests minimaux à prévoir

Pour une version future :

1. `Deployment` backend
2. `Service` backend (ClusterIP)
3. `Deployment` frontend
4. `Service` frontend
5. (optionnel) `Ingress` pour exposer les routes
6. `resources` (requests/limits) et probes (readiness/liveness)

## Exemple de stratégie de scaling

- Démarrer avec `replicas: 2` sur le backend
- Ajouter un HPA CPU (ex: min 2, max 5)
- Monitorer latence et erreurs avant d’augmenter davantage

## Limite volontaire

Aucun manifest K8s n’est imposé dans ce rendu pour éviter de “sur-promettre” une infra non testée.
La conteneurisation validée pour ce projet reste Docker Compose (`docker-compose.yml`).
