# CI/CD GitLab (C22)

Pipeline : `.gitlab-ci.yml`

## Stages

1. `lint` : vérifications statiques (TypeScript compile-check, Java compile-check)
2. `test` : tests unitaires front/back
3. `build` : génération dist Angular + JAR Spring Boot
4. `security` : SAST (Semgrep), SCA (`npm audit`), scan secrets (Gitleaks)
5. `package` : build image Docker, scan Trivy (CRITICAL => fail), publication registre
6. `deploy` : déploiement staging auto (main), production manuelle

## Cache

Le cache accélère la pipeline :

- `front/.npm/`
- `.gradle/caches/`
- `.gradle/wrapper/`

## Artifacts

Artifacts conservés :

- couverture front (`front/coverage/`)
- rapports de tests back (`back/build/reports/tests/`)
- livrables build (`front/dist/`, `back/build/libs/*.jar`)
- image Docker tar (`image.tar`)

## Gate de qualité (merge bloquant)

Le merge doit être bloqué si l’un des jobs échoue :

- tests KO
- SAST/SCA KO
- secrets détectés
- vulnérabilité CRITICAL détectée par Trivy

À activer côté GitLab : **Settings > Merge requests > Pipelines must succeed**.

## Variables CI requises

- `CI_REGISTRY`, `CI_REGISTRY_USER`, `CI_REGISTRY_PASSWORD`, `CI_REGISTRY_IMAGE`
- `KUBECONFIG` (ou variables kube équivalentes pour `kubectl`)
