#crear contenedores
docker container run \
-dp 3307:3306 \
--name world-db \
--env MARIADB_USER=example-user \
--env MARIADB_PASSWORD=user-password \
--env MARIADB_ROOT_PASSWORD=root-secret-password \
--env MARIADB_DATABASE=world-db \
--volume world-db:/var/lib/mysql \
--network world-app \
mariadb:jammy

docker container run \
--name phpmyadmin \
-d \
-e PMA_ARBITRARY=1 \
-p 8080:80 \
--network world-app \
phpmyadmin:5.2.0-apache

docker container run \
--name nest-app \
-w /app \
-dp 80:3000 \
-v "$(pwd)":/app \
node:16-alpine3.16 \
sh -c "yarn install && yarn start:dev"

 docker exec -it 024 /bin/sh

# usuarios de linux 
    sudo chown -R 5050:5050 pgadmin

# crear build
docker build -t devacampuzano/cron-ticker .

# crear montar a repositorios
docker push devacampuzano/cron-ticker 

# crear buildx
docker buildx build --platform linux/amd64,linux/arm64 -t devacampuzano/cron-ticker . --push