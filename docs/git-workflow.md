# Git workflow (simple, trunk-based)

Ce projet suit une stratégie **trunk-based légère** : la branche `main` reste la source de vérité, avec des branches courtes pour chaque changement.

## Branches

- `main` : branche stable, protégée, toujours déployable.
- `feature/*` : ajout de fonctionnalité.
- `fix/*` : correction de bug.
- `chore/*` : maintenance (docs, CI, outillage).

Exemples :

- `feature/add-search`
- `fix/person-form-validation`
- `chore/update-ci-docs`

## Commits

Format attendu des messages de commit :

- `feat: ...`
- `fix: ...`
- `chore: ...`

Exemples :

- `feat: add github pull request template`
- `fix: correct backend docker exposed port`
- `chore: add ci and security docs`

## Tags (versioning simple)

Pour marquer les versions livrées :

- format recommandé : `vMAJOR.MINOR.PATCH`
- exemple : `v1.0.0`

Commandes utiles :

```bash
git tag v1.0.0
git push origin v1.0.0
```

## Cycle de contribution court

1. Créer une branche depuis `main`.
2. Commiter avec un message `feat/fix/chore`.
3. Ouvrir une Pull Request vers `main`.
4. Vérifier CI + checklist PR.
5. Fusionner seulement quand tout est OK.
