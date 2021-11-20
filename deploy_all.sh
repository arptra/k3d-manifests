#create cluster
k3d cluster create -p "8080:80@loadbalancer"
#deploy dashboard
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.4.0/aio/deploy/recommended.yaml
#create sample user
kubectl apply -f https://raw.githubusercontent.com/arptra/k3d-manifests/master/dashboard_cluster_role.yaml
#deploy argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/arptra/k3d-manifests/master/argocd.yaml
#deploy nginx-router
kubectl apply -f https://raw.githubusercontent.com/arptra/k3d-manifests/master/full_router_configs.yaml
#get token
echo "PRINT TOKEN"
kubectl -n kubernetes-dashboard get secret $(kubectl -n kubernetes-dashboard get sa/admin-user -o jsonpath="{.secrets[0].name}") -o go-template="{{.data.token | base64decode}}"