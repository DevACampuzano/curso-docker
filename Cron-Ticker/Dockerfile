
# base
FROM node:19.2-alpine

# cd app
WORKDIR /app

# dest /app
COPY package.json ./

# instalar las dependencias
RUN npm install

# dest /app
COPY . .

#Realizar testing
RUN npm run test

# eliminar archivos y directior no requeridos
RUN rm -rf tests && rm -rf node_modules

#instalar dependecia de producion
RUN npm install --prod

#comando run de la imagen
CMD [ "node", "app.js" ]

