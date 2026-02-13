# Git workflow (C21)

## Stratégie de branches

MicroCRM utilise une stratégie **trunk-based** :

- `main` est la branche de référence, toujours déployable.
- Les développements se font sur des branches courtes:
  - `feature/<ticket>-<slug>`
  - `fix/<ticket>-<slug>`
  - `chore/<ticket>-<slug>`
  - `hotfix/<ticket>-<slug>`
- Toute fusion vers `main` passe par une Merge Request (MR).

## Convention de commits

Le projet applique **Conventional Commits**.

Format:

```text
<type>(<scope>): <description>
```

Types autorisés : `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `build`, `ci`, `chore`, `perf`, `revert`.

Exemples:

- `feat(front): add person edit form validation`
- `fix(back): handle null organization in repository`
- `ci(c22): add security and image scanning stages`

## Revue de code

- Au moins **1 approbation** requise.
- Pipeline CI vert obligatoire avant merge.
- Checklist MR obligatoire (template).
- `CODEOWNERS` utilisé pour demander les reviewers par défaut.

## Protection de branche (GitLab)

Configurer dans **Settings > Repository > Protected branches** :

- Branche protégée : `main`
- Allowed to merge : Maintainers
- Allowed to push : No one
- Require approval : 1 minimum
- Reject unsigned/failed pipeline merge : activé
- Merge checks : *Pipelines must succeed* activé

## Politique de merge

- Méthode : **Squash and merge** (historique propre sur `main`).
- Rebase recommandé avant ouverture de MR (`git pull --rebase origin main`).
- `main` ne reçoit aucun commit direct.
