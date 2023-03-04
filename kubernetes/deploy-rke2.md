# Install RKE2

Note - terminology:\
*RKE2 Server* = Kubernetes Control Plane \
*RKE2 Agent* = Kubernetes Worker Node

## Deploy manually, using helm

1. Stop firewalld (on server and agent node)
    ```shell
    systemctl status firewalld
    sudo systemctl stop firewalld
    sudo systemctl disable firewalld
    ```

2. Install RKE2 server
    ```shell
    curl -sfL https://get.rke2.io --output install.sh
    chmod +x install.sh
    sudo ./install.sh
    ```

3. Configure RKE2 server

  - Create file `/etc/rancher/rke2/config.yaml` and add the following content:
      ```shell
      write-kubeconfig-mode: "0644"
      tls-san:
        - "kube1.showcase.blue"
      node-label:
        - "nodetype=master"
      etcd-expose-metrics: true  # for scraping data in prometheus
      kube-controller-manager-arg: # for scraping datas via prometheus
        - "bind-address=0.0.0.0"
      kube-scheduler-arg:  # for scraping datas on prometheus
        - "bind-address=0.0.0.0"
      ```

4. Start RKE2 server
    ```shell
    sudo systemctl start rke2-server
    ```

5. Install RKE2 Agent
    ```shell
    curl -sfL https://get.rke2.io --output install.sh
    chmod +x install.sh
    sudo INSTALL_RKE2_TYPE="agent" ./install.sh
    ```

3. Configure RKE2 agent
  - Get access token from the server node. It is located here: `/var/lib/rancher/rke2/server/node-token`
  - Create file `/etc/rancher/rke2/config.yaml` and add the following content:
    ```shell
    write-kubeconfig-mode: "0644"
    tls-san:
      - "kube2.showcase.blue"
    node-label:
      - "nodetype=master"
    server: https://kube1.showcase.blue:9345
    token: PUT-YOUR-ACCESS-TOKEN-HERE
    ```


## Deploy with Ansible

1. Run Ansible playbook to deploy **RKE2 Server**
    ```shell
    ansible-playbook deploy-rke2-server.yml
    ```

2. Copy the server access token from the script output.

3. Paste server access token into the Anget playbook, or paste it during the agent playbook execution.

4. Run Ansible playbook to deploy **RKE2 Agent**
    ```shell
    ansible-playbook deploy-rke2-agent.yml
    ```


## Access the newly installed Kubernetes (on server)
1. Check the important files location
    - kubectl is located here:
        `/var/lib/rancher/rke2/bin/`
    - kubeconfig file is created here:
        `/etc/rancher/rke2/rke2.yaml`
    - Token for connecting agents to this server is stored here:
        `/var/lib/rancher/rke2/server/node-token`
    - Logs can be displayed by:
        `journalctl -u rke2-server -f`

2. Create a symlink for kubectl
    ```shell
    sudo ln -s $(find /var/lib/rancher/rke2/data/ -name kubectl) /usr/local/bin/kubectl
    ```
3. Export kubeconfig location
    ```shell
    export KUBECONFIG=/etc/rancher/rke2/rke2.yaml
    ```

4. Use kubectl
    ```shell
    kubectl get all -A
    ```


# Uninstall RKE2 (on server and agents)

1. Uninstall RKE2
    ```shell
    sudo /usr/bin/rke2-uninstall.sh
    ```
*Note:* The uninstall script also removes Rancher RMP repositories.
