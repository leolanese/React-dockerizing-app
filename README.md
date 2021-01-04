# react-dockerizing-app
react-dockerizing-app

## Running images
Our react app need two images: `one is a node for compiling and building`, and `the other is nginx for running our View`


## Working spaces
The working directory for `React`: `/my-app`, and for `nginx`: `/usr/share/nginx/html`

## Deploy My-App
```js
npx create-react-app my-app
cd my-app
npm start
```

## Create a docker image
Create a docker image from the docker file doing:
```js
docker image build -t <username>/<image-name> .
docker push <username>/<image-name>
```


## Test it
```js
docker container run -d -p 8080:80 <username>/<image-name>
```

## Composing images
We can docker-compose, to escale our container, also for speeding up the testing and building several images simultaneously in a better composable way.

```js
version: "3"

services:
  ui-prod:
    container_name: ui-prod
    build:
      context: .
      dockerfile: DockerFile.prod
    ports:
      - "8080:80"
```

## Run docker-compose
```js
docker-compose up
```