docker build -t pchandel09/multi-client:latest -t pchandel09/multi-client:$GIT_SHA -f ./client/Dockerfile ./client
docker build -t pchandel09/multi-server:latest -t pchandel09/multi-server:$GIT_SHA -f ./server/Dockerfile ./server
docker build -t pchandel09/multi-worker:latest -t pchandel09/multi-worker:$GIT_SHA -f ./worker/Dockerfile ./worker
docker push pchandel09/multi-client:latest
docker push pchandel09/multi-server:latest
docker push pchandel09/multi-worker:latest
docker push pchandel09/multi-client:$GIT_SHA
docker push pchandel09/multi-server:$GIT_SHA
docker push pchandel09/multi-worker:$GIT_SHA
kubectl apply -f k8s
kubectl set image deployment/multi-client-deployment client=pchandel09/multi-client:$GIT_SHA
kubectl set image deployment/multi-server-deployment client=pchandel09/multi-server:$GIT_SHA
kubectl set image deployment/multi-worker-deployment client=pchandel09/multi-worker:$GIT_SHA





