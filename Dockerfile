FROM node:16-alpine as builder

WORKDIR '/app'

#COPY ./node_modules .
COPY ./package.json .
RUN npm install

COPY . .

RUN npm run build


FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html