# TO RUN THIS
# $ terraform workspace new prod
# $ terraform workspace list
# $ terraform workspace select prod
# $ terraform apply -var-file prod.tfvars
# https://developer.hashicorp.com/terraform/language/state/workspaces

project_id  = "sampahku-0001"
server_name = "server-env"
environment = "prod"
