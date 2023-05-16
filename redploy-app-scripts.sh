docker image build -t ajeebpeter/eksdemo:appserver -f deploy/app/Dockerfile .

docker push ajeebpeter/eksdemo:appserver

kubectl delete -f deploy/app/deployment.yaml
kubectl delete -f deploy/app/service.yaml

kubectl apply -f deploy/app/deployment.yaml
kubectl apply -f deploy/app/service.yaml

kubectl delete -f deploy/web/deployment.yaml
kubectl delete -f deploy/web/service.yaml

kubectl apply -f deploy/web/deployment.yaml
kubectl apply -f deploy/web/service.yaml
