terraform {
  backend "gcs" {
    bucket = "project-koko-370310-tf-state"
    prefix = "practice/8-env/remote-state/cloud-sql"
  }
}