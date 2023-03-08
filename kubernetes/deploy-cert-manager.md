# Install cert-manager on Kubernetes

## Deploy manually, using helm

1. Define a new repository
```shell
helm repo add jetstack https://charts.jetstack.io
helm repo update
```

2. Define new CRDs
```shell
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.11.0/cert-manager.crds.yaml
```

3. Install cert-manager to a dedicated namespace "cert-manager"
```shell
helm upgrade --install cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --version v1.11.0
```


## Deploy with Ansible

1. Run Ansible playbook
```shell
ansible-playbook deploy-cert-manager.yml
```


# Uninstall cert-manager

1. Uninstall cert-manager
```shell
helm uninstall cert-manager -n cert-manager
```

2. Delete CRDs
```shell
kubectl delete -f https://github.com/cert-manager/cert-manager/releases/download/v1.11.0/cert-manager.crds.yaml
```

3. Delete namespace
```shell
kubectl delete namespace cert-manager
```