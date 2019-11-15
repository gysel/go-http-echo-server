REGISTRY=localhost:32000
docker build -t http-echo-server .
docker tag http-echo-server $REGISTRY/http-echo-server
docker push $REGISTRY/http-echo-server
kubectl create deployment echo-server --image=$REGISTRY/http-echo-server
kubectl expose deployment echo-server --port=80 --target-port=8080