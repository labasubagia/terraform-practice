project_id = "project-koko-370310"
network    = "cloudrun"
region     = "asia-southeast1"

container_images = {
  "hello" = "gcr.io/project-koko-370310/hello"
  "redis" = "gcr.io/project-koko-370310/redis"
}

subnets = [
  {
    name          = "vpccon"
    region        = "asia-southeast1"
    ip_cidr_range = "192.168.1.0/28"
  },
]

services = [
  "cloudbuild",
  "cloudresourcemanager",
  "compute",
  "iam",
  "redis",
  "run",
  "secretmanager",
  "servicenetworking",
  "sqladmin",
  "vpcaccess",
]


sa_name = "cloudrun"
roles   = ["secretmanager.secretAccessor", "run.invoker", "redis.editor"]

vpc_connector_name = "vpccon"
