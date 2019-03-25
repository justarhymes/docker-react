FROM node:alpine as builder
WORKDIR '/app'
COPY package.json yarn.lock  ./
RUN yarn --pure-lockfile
COPY ./ ./
RUN yarn build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
