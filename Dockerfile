FROM node:20-alpine AS front-build

WORKDIR /src
COPY front/package*.json ./
RUN npm ci
COPY front/ ./
RUN npx @angular/cli build --configuration production

FROM gradle:8-jdk17 AS back-build

WORKDIR /src
COPY back/ ./
RUN ./gradlew build -x test

FROM caddy:2.8-alpine AS front

COPY --from=front-build /src/dist/microcrm/browser /usr/share/caddy
COPY misc/docker/Caddyfile /etc/caddy/Caddyfile

EXPOSE 80 443

FROM eclipse-temurin:21-jre-alpine AS back

WORKDIR /app
COPY --from=back-build /src/build/libs/microcrm-0.0.1-SNAPSHOT.jar /app/microcrm.jar

EXPOSE 8080
CMD ["java", "-jar", "/app/microcrm.jar"]

FROM alpine:3.20 AS standalone

RUN apk add --no-cache openjdk21-jre-headless supervisor caddy wget
WORKDIR /app

COPY --from=front /usr/share/caddy /app/front
COPY --from=front /etc/caddy/Caddyfile /app/Caddyfile
COPY --from=back /app/microcrm.jar /app/back/microcrm.jar
COPY misc/docker/supervisor.ini /app/supervisor.ini

EXPOSE 80 443 8080
CMD ["/usr/bin/supervisord", "-c", "/app/supervisor.ini"]
