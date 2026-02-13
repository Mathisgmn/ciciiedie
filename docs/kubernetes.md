# Kubernetes déploiement/scale/rollback (C24)

## Manifests fournis

- `k8s/namespace.yaml`
- `k8s/configmap.yaml`
- `k8s/rbac.yaml`
- `k8s/deployment.yaml`
- `k8s/service.yaml`
- `k8s/ingress.yaml`
- `k8s/hpa.yaml`

## Déploiement staging

```bash
kubectl apply -f k8s/namespace.yaml
kubectl apply -f k8s/configmap.yaml
kubectl apply -f k8s/rbac.yaml
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
kubectl apply -f k8s/ingress.yaml
kubectl apply -f k8s/hpa.yaml
kubectl rollout status deployment/microcrm -n microcrm-staging
```

## Rolling update

```bash
kubectl set image deployment/microcrm microcrm=registry.example.com/microcrm:<tag> -n microcrm-staging
kubectl rollout status deployment/microcrm -n microcrm-staging
```

## Rollback

```bash
kubectl rollout undo deployment/microcrm -n microcrm-staging
kubectl rollout history deployment/microcrm -n microcrm-staging
```

## Scaling

Auto-scaling CPU via HPA (2 à 6 replicas).

```bash
kubectl get hpa -n microcrm-staging
kubectl top pods -n microcrm-staging
```
