FROM node:16-alpine AS builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm i -D --save-exact mini-css-extract-plugin@2.4.5
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html