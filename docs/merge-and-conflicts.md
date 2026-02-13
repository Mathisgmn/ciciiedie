# Merge et résolution de conflits (C22)

## Politique de merge

- MR obligatoire vers `main`.
- Rebase sur `main` avant review.
- Merge strategy : **squash and merge**.
- CI verte + 1 approbation minimum requises.

## Process recommandé

```bash
git checkout main
git pull --ff-only
git checkout feature/123-ma-feature
git rebase main
# résoudre les conflits éventuels
# relancer tests locaux
git push --force-with-lease
```

## Résolution de conflit (guide)

1. Identifier les fichiers en conflit :
   ```bash
   git status
   ```
2. Ouvrir les marqueurs `<<<<<<<`, `=======`, `>>>>>>>` et choisir/combiner les modifications.
3. Vérifier la compilation/tests :
   ```bash
   cd front && npm run build
   cd ../back && ./gradlew test
   ```
4. Marquer comme résolu :
   ```bash
   git add <fichiers>
   git rebase --continue
   ```
5. Re-push la branche :
   ```bash
   git push --force-with-lease
   ```

## Checklist MR

- [ ] Rebase sur `main`
- [ ] Conflits résolus
- [ ] Lint/test/build OK en local
- [ ] CI complète verte
- [ ] Documentation mise à jour
