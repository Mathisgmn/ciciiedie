# Sécurité (CI)

La pipeline CI intègre 3 contrôles simples :

1. **Secrets** : scan avec Gitleaks
2. **Dépendances** : `npm audit` (frontend)
3. **Image Docker** : scan Trivy

## Pourquoi ce choix ?

- Simple à comprendre pour un projet étudiant
- Facile à exécuter automatiquement dans GitHub Actions
- Bon socle avant des outils plus avancés (SAST/DAST)

## Résultats attendus

- La PR échoue si un secret est détecté
- La PR échoue si des vulnérabilités npm critiques/hautes sont trouvées
- La PR échoue si Trivy trouve des vulnérabilités critiques sur l’image

## Bonnes pratiques minimales

- Ne jamais commiter `.env` réel
- Utiliser les `GitHub Secrets` pour tokens/mots de passe
- Mettre à jour régulièrement les dépendances
