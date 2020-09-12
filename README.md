# Golang HTTP Echo Server

The dumbest HTTP server you can find. Send a request and have it echoed back to you.

## Usage

```go
go run echoserver.go
```

Then point your browser to [http://localhost:8080](http://localhost:8080).

The port will be set to `8080` by default. If you want to run the server on another port, pass it using the `PORT` environment variable or as a parameter:

```go
go run echoserver.go 8090
```

## Docker

Follow the instructions below to _dockerize_ the server.

### Build image

```bash
docker build -t go-http-echo-server .
```

If you don't want to use the default port (`8080`), make sure you change that in the Dockerfile before building the image.

### Run container

```bash
docker run -d -p 8080:8080 go-http-echo-server
```

## Kubernetes

Run the bash script to push the image into a registry (`localhost:32000` by default) and deploy it to Kubernetes.

```bash
./deploy.sh
```

Or use the existing Docker image:

```bash
IMAGE=docker.pkg.github.com/gysel/go-http-echo-server/http-echo-server
kubectl create deployment echo-server --image=$IMAGE
kubectl expose deployment echo-server --port=80 --target-port=8080
```

Please note that GitHub requires you to log in even when the image is public.
(See https://github.community/t5/GitHub-Actions/docker-pull-from-public-GitHub-Package-Registry-fail-with-quot/td-p/32782)
