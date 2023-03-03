# Install cert-manager on Kubernetes

## Deploy manually, using helm

1. Define a new repository
```
helm repo add jetstack https://charts.jetstack.io
helm repo update
```

2. Define new CRDs
```
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.11.0/cert-manager.crds.yaml
```

3. Install cert-manager to a dedicated namespace "cert-manager"
```
helm upgrade --install cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --version v1.11.0
```


## Deploy with Ansible

1. Run Ansible playbook
```
ansible-playbook deploy-cert-manager.yml
```



# Uninstall cert-manager on Kubernetes

1. Uninstall cert-manager
```
helm uninstall cert-manager -n cert-manager
```

2. Delete CRDs
```
kubectl delete -f https://github.com/cert-manager/cert-manager/releases/download/v1.11.0/cert-manager.crds.yaml
```

3. Delete namespace
```
kubectl delete namespace cert-manager
```