# docker-inject-env-react-runtime

Small sample project that shows how to inject a environment variable (e.g. for a API Url) into a dockerized React application.

As opposed to baking the environment variable into the docker image during the docker build, this approach allows you to have just one docker image that can be deployed to different environments (e.g. staging and prod). 

The trick here is to set the variable on the global window object in a small JavaScript file `env_vars.js` embedded in the html.

This js `env_vars.js` is created when the docker container is starting up, using a little bash script `docker-entrypoint.sh` that reads the environment variables passed to the docker container.

## Try it out

To try it out clone the project and build the docker image.

```
git clone git://github.com/githubjakob/react-inject-env-docker-runtime
cd react-inject-env-docker-runtime
```

Then build the docker image:

```
docker build -t docker-inject-env-react-runtime .
```

On startup, you can inject environment variables into the docker container, which is then picked up by the React app:

```
docker run -d -p 8081:8080 -e API_URL=test.myapp.com docker-inject-env-react-runtime

docker run -d -p 8082:8080 -e API_URL=prod.myapp.com docker-inject-env-react-runtime
```

Navigate to http://localhost:8081/ and http://localhost:8082/ respectively to see the different Urls in the different containers.