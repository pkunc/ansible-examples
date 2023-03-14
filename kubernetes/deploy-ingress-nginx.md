# Install Ingress-NGINX on Kubernetes

## Deploy manually, using helm

1. Define a new repository
```shell
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
```

2. Install Ingress-NGINX to a dedicated namespace "ingress-nginx"
```shell
helm upgrade --install ingress-nginx ingress-nginx/ingress-nginx \
  --namespace ingress-nginx \
  --create-namespace \
  --atomic
```


## Deploy with Ansible

1. Run Ansible playbook
```shell
ansible-playbook deploy-ingress-nginx.yml
```


# Uninstall Ingress-NGINX

1. Uninstall cert-manager
```shell
helm uninstall ingress-nginx -n ingress-nginx
```

2. Delete namespace
```shell
kubectl delete namespace ingress-nginx
```