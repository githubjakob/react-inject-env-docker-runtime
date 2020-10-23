# docker-inject-env-react-runtime

A common pattern for hosting React applications is to bundle them in a Docker container which then is deployed in a Kubernetes cluster.

In a setup where you have multiple cluster environments, e.g. a test, a staging and a production environment, each containing its own backend and frontend application running on different hosts, you need to pass 

Since a React application is just static JavaScript running in the clients browsers, one way would be to inject the different parameters into the Docker image when building the container. 



The React documentation gives a hint how to do this https://create-react-app.dev/docs/title-and-meta-tags/#injecting-data-from-the-server-into-the-page





docker build -t docker-inject-env-react-runtime .

docker run -d -p 8080:8080 -e STRIPE_PUBLISHABLE_KEY=my_test_key docker-inject-env-react-runtime

docker run -d -p 8080:8080 -e STRIPE_PUBLISHABLE_KEY=my_prod_key docker-inject-env-react-runtime