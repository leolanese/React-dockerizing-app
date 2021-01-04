FROM node:13.12.0-alpine as build
## Use the alpine stable version of node and nginx.

WORKDIR /my-app

ENV PATH /app/node_modules/.bin:$PATH

COPY package.*json ./
## Copy package.json and package-lock.json to install the package instead so copying from the working directory in your local computer.

RUN npm install --silent
## Install packages

RUN npm install react-scripts@3.4.0 -g --silent
## Install react scripts

COPY . ./
## copy the files from the local computer to the container

RUN npm run build

FROM nginx:stable-alpine
## Use an nginx image

COPY --from=build /app/build /usr/share/nginx/html
## copy the build folder from build to /usr/share/nginx/html

COPY nginx.conf /etc/nginx/conf.d/default.conf
## Create an `nginx.config` file and copy it to /etc/nginx/conf.d/default.conf

EXPOSE 80
## Expose default port 80

CMD ["nginx","-g","daemon off;"]