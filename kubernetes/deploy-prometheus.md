# Install Prometheus stack on Kubernetes

## Deploy manually, using helm

1. Define a new repository
```shell
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
```

3. Install Prometheus to a dedicated namespace "monitoring"
```shell
helm upgrade --install prometheus prometheus-community/kube-prometheus-stack \
  --namespace monitoring \
  --create-namespace \
  --set prometheus.prometheusSpec.evaluationInterval=5m \
  --set prometheus.prometheusSpec.scrapeInterval=5m \
  --atomic
```


## Deploy with Ansible

1. Run Ansible playbook
```shell
ansible-playbook deploy-prometheus.yml
```


# Access Grafana UI

1. Get Grafana admin password (the default password is `prom-operator`)
```shell
kubectl get secret --namespace monitoring prometheus-grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
```

2. Set port-forwarding for Grafana port
```shell
kubectl port-forward --namespace monitoring service/prometheus-grafana 3080:80
```

3. Open the forwarded port in your web browser
```shell
http://localhost:3080
```

4. Log with the following credentials \
Username: `admin` \
Password: `<use the password from step 2>`


# Uninstall Prometheus stack

1. Uninstall Prometheus stack
```shell
helm uninstall prometheus -n monitoring
```

2. Delete namespace
```shell
kubectl delete namespace monitoring
```