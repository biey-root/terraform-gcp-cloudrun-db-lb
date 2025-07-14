# GCP Terraform Infrastructure

This project provisions a Google Cloud Platform (GCP) infrastructure using Terraform. It includes modules for Cloud SQL, Cloud Run, and a Load Balancer, and is configured for deployment in Southeast Asia (near the Philippines).

## Features
- **Cloud SQL**: Managed PostgreSQL database
- **Cloud Run**: Serverless container deployment
- **Load Balancer**: HTTP(S) load balancing for Cloud Run

## Prerequisites
- [Terraform](https://www.terraform.io/downloads.html) >= 1.0
- [Google Cloud SDK](https://cloud.google.com/sdk/docs/install)
- GCP project with billing enabled
- Sufficient IAM permissions to create resources

## Enable Required GCP APIs
Before deploying, enable the necessary GCP APIs with the following commands:
```sh
gcloud services enable sqladmin.googleapis.com
# Cloud SQL

gcloud services enable run.googleapis.com
# Cloud Run

gcloud services enable compute.googleapis.com
# Compute Engine (required for Load Balancer)

gcloud services enable iam.googleapis.com
# IAM (for permissions)
```

## Setup
1. **Clone the repository**
   ```sh
   git clone https://github.com/biey-root/terraform-gcp-cloudrun-db-lb/tree/main
   cd terraform-gcp-cloudrun-db-lb
   ```

2. **Authenticate with Google Cloud**
   ```sh
   gcloud auth application-default login
   ```

3. **Configure variables**
   Edit `terraform.tfvars` with your values:
   ```hcl
   project_id   = "your-gcp-project-id"
   region       = "asia-southeast1"
   zone         = "asia-southeast1-a"
   db_name      = "my-cloudsql-db"
   service_name = "my-cloudrun-app"
   image        = "your-image-name"
   image_tag    = "latest"
   ```
   - `image` should be the container image name (without tag)
   - `image_tag` is the tag for your container image

4. **Initialize Terraform**
   ```sh
   terraform init
   ```

5. **Validate the configuration**
   ```sh
   terraform validate
   ```

6. **Review the plan**
   ```sh
   terraform plan
   ```

7. **Apply the configuration**
   ```sh
   terraform apply
   ```
   Confirm with `yes` when prompted.

## Outputs
- `cloud_run_url`: The URL of the deployed Cloud Run service
- `load_balancer_ip`: The global IP address of the load balancer

## Cleanup
To destroy all resources created by this project:
```sh
terraform destroy
```

## Notes
- Ensure your GCP project has the necessary APIs enabled: Cloud SQL, Cloud Run, Compute Engine, IAM, etc.
- The `.gitignore` is set up to avoid committing sensitive or unnecessary files.

---
Feel free to customize this project for your needs!
