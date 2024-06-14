data "terraform_remote_state" "foundation" {
  backend = "gcs"
  config = {
    bucket = "project-koko-370310-tf-state"
    prefix = "practice/11-cloud-run/foundation"
  }
}
