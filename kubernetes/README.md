# Kubernetes Ansible Playbooks

A set of scripts that I use to quickly deploy Kubernetes and Kubernetes applications.

## Deploy Kubernetes

### Self-managed Kubernetes
- Prepare Linux nodes (create instance, update DNS records)
  - [AWS](../aws/)
  - [Linode](../linode/)
- [Prepare CentOS](../linux)


**Option A: RKE2**
- [Deploy RKE2 server](deploy-rke2-server.yml)
- [Deploy RKE2 agents](deploy-rke2-agent.yml)

**Option B: K3s**
- [Deploy K3s server](deploy-k3s-server.yml)
- [Deploy K3s agents](deploy-k3s-agent.yml)

&nbsp;
- [Fetch kubeconfig](fetch-kubeconfig.yml)


## Deploy Kubernetes Extenstions
- [Deploy cert-manager](deploy-cert-manager.md)
- [Deploy Ingress-NGINX](deploy-ingress-nginx.md)
- Deploy Rancher Manager (optional, alternative: [OpenLens](https://github.com/MuhammedKalkan/OpenLens))
- [Deploy Longhorn](deploy-longhorn.md) (local persistent storage)
- [Deploy Prometheus stack](deploy-prometheus.md) (Prometheus, Alertmanager, Grafana)
- [Deploy Loki stack](deploy-loki.md) (Loki, Promtail)
