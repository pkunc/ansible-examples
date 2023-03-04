# Install Longhorn

## Deploy manually, using helm

1. Install required packages
    ```shell
    sudo yum install curl, findmnt, grep, awk, blkid, lsblk, gawk, epel-release, jq, nfs-utils
    ```

1. Install iscsi
  - Install the package
    ```shell
    sudo yum install iscsi-initiator-utils
    ```

  - Set the current value
    ```shell
    echo "InitiatorName=$(/sbin/iscsi-iname)" > /etc/iscsi/initiatorname.iscsi
    ```

1. Define a new repository
    ```shell
    helm repo add longhorn https://charts.longhorn.io
    helm repo update
    ```


3. Install Longhorn to a dedicated namespace "longhorn-system"
    ```shell
    helm upgrade -install longhorn longhorn/longhorn \
      --namespace longhorn-system \
      --create-namespace \
      --set persistence.defaultClassReplicaCount=1
    ```


## Deploy with Ansible

1. Run Ansible playbook
    ```shell
    ansible-playbook deploy-longhorn.yml
    ```

# Access Longhorn

1. Set port-forwarding on your local workstaion
    ```shell
    kubectl port-forward service/longhorn-frontend 33333:80 -n longhorn-system
    ```

2. Open Longhorn frontend UI in a web browser on your workstation, using a forwarded port
    ```shell
    http://localhost:33333
    ```


# Uninstall Longhorn

1. Uninstall Longhorn
    ```shell
    helm uninstall longhorn -n longhorn-system
    ```

2. Delete the namespace
    ```shell
    kubectl delete namespace longhorn-system
    ```