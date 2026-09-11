set -e


NAME="kubernetes-demo-api"
USERNAME="johnnyq001"
IMAGE="$USERNAME/$NAME:latest"


echo "Build docker image ..."
docker build -t $IMAGE .


echo "Push docker image ..."
docker push $IMAGE


echo "Apply kubernetes manefest"
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

echo "Getting pods ..."
kubectl get pods


echo "Getting services ..."
kubectl get services


echo "Getting main service"
kubectl get services $NAME-service
