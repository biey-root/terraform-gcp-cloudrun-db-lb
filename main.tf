module "cloudsql" {
  source          = "./cloudsql"
  project_id      = var.project_id
  region          = var.region
  db_name         = var.db_name
  db_user         = var.db_user
  db_password     = var.db_password
  #private_network = var.private_network # if using private IP
}

module "cloudrun" {
  source        = "./cloudrun"
  project_id    = var.project_id
  region        = var.region
  service_name  = var.service_name
  db_user       = var.db_user
  db_password   = var.db_password
  db_name       = var.db_name
  db_host       = module.cloudsql.instance_private_ip # or instance_ip if using public
  image         = var.image
  image_tag     = var.image_tag
}

module "loadbalancer" {
  source        = "./loadbalancer"
  project_id    = var.project_id
  region        = var.region
  service_name  = var.service_name
  # Add other required variables here
}