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
---
### Further information
[ng-inx](http://nginx.org/en/docs/ngx_core_module.html)

[docker containers](https://www.docker.com/get-started)

[docker compose](https://docs.docker.com/compose/reference/help/)

---
### :100: <i>Thanks!</i>
#### Now, don't be an stranger. Let's stay in touch!

> I'm a passionately curious Front-end Engineer. I like sharing what I know, and learning what I don't. London, UK.

##### :radio_button: linkedin: <a href="https://www.linkedin.com/in/leolanese/" target="_blank">@LeoLaneseltd</a>
##### :radio_button: Twitter: <a href="https://twitter.com/LeoLaneseltd" target="_blank">@LeoLaneseltd</a>
##### :radio_button: Portfolio: <a href="https://www.leolanese.com" target="_blank">www.leolanese.com</a>
##### :radio_button: DEV.to: <a href="https://www.dev.to/leolanese" target="_blank">dev.to/leolanese</a>
##### :radio_button: Blog: <a href="https://www.leolanese.com/blog" target="_blank">leolanese.com/blog</a>
##### :radio_button: Questions / Suggestion / Recommendation: developer@leolanese.com