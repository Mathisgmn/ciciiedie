# Merge & gestion des conflits

## Process de merge recommandé

1. Créer une branche (`feature/*`, `fix/*`, `chore/*`).
2. Pousser la branche et ouvrir une PR vers `main`.
3. Laisser la CI vérifier : lint, test, build + sécurité.
4. Corriger les retours si nécessaire.
5. Fusionner la PR dans `main` quand tout est vert.

## Branch protection GitHub (à activer)

Dans GitHub :

1. `Settings` → `Branches` → `Add branch protection rule`.
2. Pattern : `main`.
3. Activer :
   - `Require a pull request before merging`
   - `Require status checks to pass before merging`
   - `Require branches to be up to date before merging`
   - (option simple) `Require approvals` (au moins 1)
4. Sauvegarder.

Résultat : aucun push direct sur `main`, uniquement via PR validée.

## Résoudre un conflit (simple)

### Option rebase (recommandé)

```bash
git checkout feature/ma-branche
git fetch origin
git rebase origin/main
# résoudre les conflits
git add .
git rebase --continue
```

Puis re-tester et pousser :

```bash
git push --force-with-lease
```

### Option merge

```bash
git checkout feature/ma-branche
git fetch origin
git merge origin/main
# résoudre les conflits
git add .
git commit
```

## Après résolution

Toujours refaire :

- lint
- tests
- build

Puis vérifier que la CI GitHub est verte avant fusion.
