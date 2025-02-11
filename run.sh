#!/usr/bin/env bash
terraform apply
terraform output -json > terraform.out
jinja2 --format=json jinja/ansible_inventory.j2 terraform.out -o ansible/ansible_inventory
jinja2 --format=json jinja/lb-compose.yaml.j2   terraform.out -o logbroker/docker-compose.yaml
jinja2 --format=json jinja/ssh_commands.j2      terraform.out -o ssh_commands
jinja2 --format=json jinja/sanity_check.sh.j2   terraform.out -o sanity_check.sh
chmod +x sanity_check.sh

cd ansible
ansible-playbook clickhouse.yml
ansible-playbook compute.yml
ansible-playbook reverse_proxy.yml
