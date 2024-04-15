FROM node:alpine as builder
WORKDIR '/app'
COPY ./node_modules .
COPY ./package.json .
COPY . .
RUN npm run build


FROM nginx:latest
COPY --from=builder /app/build /usr/share/nginx/html