# Install Loki stack on Kubernetes

## Deploy manually, using helm

1. Define a new repository
```shell
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
```

3. Install Loki to a dedicated namespace "loki-stack"
```shell
helm upgrade --install loki grafana/loki-stack \
  --namespace loki-stack \
  --create-namespace \
  --atomic
```


## Deploy with Ansible

1. Run Ansible playbook
```shell
ansible-playbook deploy-loki.yml
```


# Add Loki resource to Grafana

1. Access Grafana web UI

2. Create a new resource, type Loki. Set hostname URL:
    ```
    http://loki.loki-stack.svc.cluster.local:3100
    ```


# Uninstall Loki stack

1. Uninstall Loki stack
```shell
helm uninstall loki -n loki-stack
```

2. Delete namespace
```shell
kubectl delete namespace loki-stack
```