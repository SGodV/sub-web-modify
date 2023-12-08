FROM node:16-alpine AS build
WORKDIR /app
COPY . .
RUN yarn install
RUN yarn build
RUN yarn global add http-server
EXPOSE 80
CMD http-server /app/dist -p 80
# FROM nginx:1.24-alpine
# COPY --from=build /app/dist /usr/share/nginx/html
# EXPOSE 80
# CMD [ "nginx", "-g", "daemon off;" ]
