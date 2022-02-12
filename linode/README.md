# Ansible for Linode

## Prerequisites
Install the official Python library for the Linode API v4:
```
pip install linode_api4
```

Install Linode collection from Ansible Galaxy:
```
ansible-galaxy collection install linode.cloud
```

Expose Linode token as an environment variable:
```
export LINODE_ACCESS_TOKEN=abcabcabc....
```

## Run playbooks
You can run playbook in a traditional way, as a parameter to ansible-playbook:
```
ansible-playbook create-instance.yml
```

Or you can launch it as a runnable script:
```
./create-instance.yml
```

## Local root access
Some playbooks require local root access (become: true). 
If your current user account does not allow sudo without entering a password,
run the command with the additional parameter. Example:
```
./create-instance.yml --ask-become-pass
```

## Additional resources
[Ansible section on Linode documentation](https://www.linode.com/docs/guides/deploy-linodes-using-ansible/)