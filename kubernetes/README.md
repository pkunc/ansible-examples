# Kubernetes Ansible Playbooks

A set of scripts that I use to quickly deploy Kubernetes and Kubernetes applications.

## Deploy Kubernetes

### Self-managed Kubernetes
- Prepare Linux nodes (create instance, update DNS records)
  - [AWS](../aws/)
  - [Linode](../linode/)
- Prepare CentOS
- [Deploy RKE2 server](deploy-rke2-server.yml)
- [Deploy RKE2 agents](deploy-rke2-agent.yml)
- [Fetch kubeconfig](fetch-kubeconfig.yml)


## Deploy Kubernetes Extenstions
- [Deploy cert-manager](deploy-cert-manager.md)
- Deploy Rancher Manager (optional, alternative: [OpenLens](https://github.com/MuhammedKalkan/OpenLens))
- Deploy Longhorn (local persistent storage)
- Deploy Prometheus stack (Prometheus, Alertmanager, Grafana)
- Deploy Loki stack (Loki, Promtail)
