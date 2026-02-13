# Développement local reproductible (C23)

## Prérequis

- Docker >= 24
- Docker Compose v2

## Démarrage identique partout

```bash
cp .env.example .env
docker compose up --build
```

Applications exposées :

- Frontend : `http://localhost:${FRONT_HTTP_PORT}`
- Backend : `http://localhost:${BACK_PORT}`

## Arrêt

```bash
docker compose down -v
```

## Healthchecks

- `back` : vérifie `http://localhost:8080`
- `front` : vérifie `http://localhost:80`

## Débogage

```bash
docker compose ps
docker compose logs -f back
docker compose logs -f front
```
