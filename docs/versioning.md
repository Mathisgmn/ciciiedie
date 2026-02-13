# Versioning et releases (C21)

## Schéma de version

Le projet suit **Semantic Versioning** : `MAJOR.MINOR.PATCH`.

- `MAJOR` : changement incompatible API/comportement.
- `MINOR` : nouvelle fonctionnalité rétrocompatible.
- `PATCH` : correction rétrocompatible.

## Source de vérité

- Les tags Git (`vX.Y.Z`) sont la source de vérité des releases.
- Le fichier [`CHANGELOG.md`](../CHANGELOG.md) est maintenu avec le format *Keep a Changelog*.

## Process release

1. Mettre à jour `CHANGELOG.md` dans la section `[Unreleased]`.
2. Préparer la MR de release (`chore/release-vX-Y-Z`).
3. Après merge sur `main`, créer le tag :

```bash
git checkout main
git pull --ff-only
git tag -a vX.Y.Z -m "Release vX.Y.Z"
git push origin vX.Y.Z
```

4. Publier les release notes à partir de la section correspondante du changelog.

## Traçabilité

Chaque changement de version doit référencer :

- la MR de release,
- le tag Git,
- les jobs CI passés (tests, sécurité, build, scan image).
