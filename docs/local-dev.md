# Développement local

## Prérequis

- Docker + Docker Compose
- (optionnel) Java 17 et Node 20+ pour lancer sans Docker

## Variables d’environnement

Copier le fichier d’exemple :

```bash
cp .env.example .env
```

## Lancer avec Docker Compose

```bash
docker compose up --build
```

Services exposés :

- Frontend : http://localhost:80
- Backend API : http://localhost:8080

## Arrêter

```bash
docker compose down
```

## Lancer sans Docker (rappel)

Backend :

```bash
cd back
./gradlew build
java -jar build/libs/microcrm-0.0.1-SNAPSHOT.jar
```

Frontend :

```bash
cd front
npm ci
npm run start
```


## Dépannage Docker (Windows)

Si `docker compose up --build` échoue pendant le build backend avec `gradlew not found` ou une erreur Gradle incompatible :

- vérifier que vous avez bien la dernière version du repository (`git pull`),
- relancer un build sans cache :

```bash
docker compose build --no-cache back
docker compose up
```

Le Dockerfile normalise maintenant les fins de ligne (`CRLF`) et utilise le **Gradle Wrapper** du projet pour forcer la bonne version de Gradle.
