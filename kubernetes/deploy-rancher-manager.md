# Install Rancher Manager on Kubernetes

## Deploy manually, using helm

1. Define a new repository
```
helm repo add rancher-latest https://releases.rancher.com/server-charts/latest
helm repo update
```

2. Install Rancher Manager

Choose one of the following options. \
If you are not sure, chose the first option - default generated certificate.

2.1 Install with a default generated certificate

```
helm upgrade -install rancher rancher-latest/rancher \
  --namespace cattle-system \
  --create-namespace \
  --set hostname=kube1.showcase.blue \
  --set replicas=1 \
  --set bootstrapPassword=SecretPassword \
  --atomic
```

2.2 Install with Let's Encrypt certificates
```
helm upgrade -i rancher rancher-latest/rancher \
  --namespace cattle-system \
  --create-namespace \
  --set hostname=kube1.showcase.blue \
  --set replicas=1 \
  --set bootstrapPassword=SecretPassword \
  --set ingress.ingressClassName=nginx \
  --set ingress.tls.source=letsEncrypt \
  --set letsEncrypt.email=petr.kunc@gmail.com \
  --set letsEncrypt.environment=staging \
  --atomic
```


## Deploy with Ansible

1. Run Ansible playbook

Edit the playbook `deploy-rancher-manager.yml` and set correct values in the `vars:` section.

```
ansible-playbook deploy-cert-manager.yml
```


# Uninstall Rancher Manager on Kubernetes

1. Uninstall cert-manager
```
helm uninstall rancher -n cattle-system
```

2. Delete namespace
```
kubectl delete cattle-system
```