# jitsi-do
This project deploys Jitsi to DigitalOcean with Terraform and Ansible.

## Environment Setup
This project has a Bash script (`setup.sh`) to set up a virtual environment. This shell 
scrip installs **Terraform** and **Ansible** in a virtual environment:

```bash
$ ./setup install
```

When Terraform and Ansible is installed, activate the virtualenv with:

```
$ activate .env/bin/activate
```

To remove the virtual environment, execute:

```bash
./setup.sh clean
```

## Creating Digitalocean Instance
The project has these Terraform files:

- `variable.tf`: contains all variables used by Terraform.
- `provider.ft`: specifies the provider that is going to be used and Terraform version.
- `01_ssh_key.tf`: configures your public SSH key in Digitalocean. If you already have a 
public SSH key configured in your account, this step may not be necessary.
- `02_droplet.tf`: creates the instance (aka Droplet in Digitalocean).
- `03_dns.tf`: adds a DNS `A` record pointing to the created instance.

This project use `TF_VAR_<var_name>` environment variable to set the Digitalocean token,
so `TF_VAR_do_token` needs to be defined.

```bash
(.env) $ export TF_VAR_do_token=xxxxx
(.env) $ terraform init
(.env) $ terraform plan
(.env) $ terraform apply
```

## Deploying Jitsi with Ansible and Docker Compose
In order to quickly run Jitsi Meet on the instance created before, running Docker and
Docker Compose, execute this Ansible Playbook:

```bash
(.env) $ ansible-playbook -i hosts.yml deploy_jitsi.yml
```

This playbook will execute all steps described
[here](https://jitsi.github.io/handbook/docs/devops-guide/devops-guide-docker)

## To-do
- Make the ansible playbook idempotent
- Add firewall rules
