
# base
FROM node:19.2-alpine as deps

# cd app
WORKDIR /app

# dest /app
COPY package.json ./

# instalar las dependencias
RUN npm install





#stage builder
FROM node:19.2-alpine as builder

# cd app
WORKDIR /app

#copiar del stage de deps
COPY --from=deps /app/node_modules ./node_modules

# dest /app
COPY . .

#Realizar testing
RUN npm run test





#stage prod-deps
FROM node:19.2-alpine as prod-deps

# cd app
WORKDIR /app

# dest /app
COPY package.json ./

#instalar dependecia de producion
RUN npm install --prod





#stage runner
FROM node:19.2-alpine as runner

# cd app
WORKDIR /app

#copiar del stage de prod-deps
COPY --from=prod-deps /app/node_modules ./node_modules

# copia app.js
COPY app.js ./
# copia la carpeta tasks
COPY tasks/ ./tasks

#comando run de la imagen
CMD [ "node", "app.js" ]
