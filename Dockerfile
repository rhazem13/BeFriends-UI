# first stage of building angular image
FROM node:18.14.2-alpine3.17 as build
RUN mkdir -p /app

WORKDIR /app

COPY package.json /app/
RUN npm install

COPY . /app/
RUN npm run build --prod

# fina lstage
FROM nginx:stable-alpine-perl
COPY --from=build /app/dist/helpdesk /usr/share/nginx/html







