#create cluster
k3d cluster create -p "8080:80@loadbalancer"
#deploy dashboard
kubectl apply -f https://raw.githubusercontent.com/arptra/k3d-manifests/master/kuber-dashboard.yaml
#deploy argocd
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
#deploy nginx-router
kubectl apply -f https://raw.githubusercontent.com/arptra/k3d-manifests/master/full_router_configs.yaml