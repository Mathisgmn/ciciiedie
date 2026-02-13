# CI/CD (GitHub Actions)

## Objectif

Avoir une pipeline simple, lisible et fiable pour :

1. lint
2. test
3. build
4. sécurité

Le workflow est défini dans `.github/workflows/ci.yml`.

## Déclencheurs

- `pull_request` (toutes les PR)
- `push` sur `main`
- `workflow_dispatch` (manuel, utile pour le déploiement staging de démonstration)

## Jobs

- `lint` : vérifications rapides (backend + frontend)
- `test` : tests backend
- `build` : builds applicatifs + image Docker standalone
- `security` : scan secrets, dépendances, image Docker
- `deploy-staging` : exemple de déploiement manuel (placeholder pédagogique)

## Cache

Le workflow active :

- cache npm via `actions/setup-node`
- cache Gradle via `actions/setup-java`

## Option SonarQube (facultative)

Si vous souhaitez ajouter SonarQube plus tard :

1. Ajouter les secrets GitHub :
   - `SONAR_TOKEN`
   - `SONAR_HOST_URL`
2. Ajouter un job dédié dans `ci.yml` avec le scanner Sonar.

Exemple d’intention :

```yaml
- name: SonarQube Scan
  run: ./gradlew sonarqube
  env:
    SONAR_TOKEN: ${{ secrets.SONAR_TOKEN }}
    SONAR_HOST_URL: ${{ secrets.SONAR_HOST_URL }}
```

Pour ce projet étudiant, ce n’est pas obligatoire tant que la pipeline de base est robuste.
