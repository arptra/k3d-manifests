#create cluster
k3d cluster create -p "8080:80@loadbalancer"
#deploy dashboard
kubectl apply -f https://raw.githubusercontent.com/arptra/k3d-manifests/master/kuber-dashboard.yaml
#deploy argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/arptra/k3d-manifests/master/argocd.yaml
#deploy nginx-router
kubectl apply -f https://raw.githubusercontent.com/arptra/k3d-manifests/master/full_router_configs.yaml
#get token
kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | awk '/^kubernetes-dashboard-token-/{print $1}') | awk '$1=="token:"{print $2}'