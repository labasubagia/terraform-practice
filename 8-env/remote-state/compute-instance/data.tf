# remote state from cloud sql
data "terraform_remote_state" "cloud_sql" {
  backend = "gcs"
  config = {
    bucket = "project-koko-370310-tf-state"
    prefix = "practice/8-env/remote-state/cloud-sql"
  }
}

# just for log
output "connection_name" {
  value = data.terraform_remote_state.cloud_sql.outputs.connection_name
}
