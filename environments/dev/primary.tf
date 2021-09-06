# Create the Cloud Run service primary-1
resource "google_cloud_run_service" "run_primary_1" {
  name = "primary-1"
  location = "us-east1"

  template {
    spec {
      containers {
        image = "us-central1-docker.pkg.dev/serviceswithprimarysecondary/project-atyeti/primary-1:v1"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

  # Waits for the Cloud Run API to be enabled
  depends_on = [google_project_service.run_api]
}

# Allow unauthenticated users to invoke the service
resource "google_cloud_run_service_iam_member" "run_all_primary_1_users" {
  service  = google_cloud_run_service.run_primary_1.name
  location = google_cloud_run_service.run_primary_1.location
  role     = "roles/run.invoker"
  member   = "allUsers"
}

# Display the service URL
output "primary-1-url" {
  value = google_cloud_run_service.run_primary_1.status[0].url
}

# Create the Cloud Run service primary-2
resource "google_cloud_run_service" "run_primary_2" {
  name = "primary-2"
  location = "us-east1"

  template {
    spec {
      containers {
        image = "us-central1-docker.pkg.dev/serviceswithprimarysecondary/project-atyeti/primary-2:v1"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

  # Waits for the Cloud Run API to be enabled
  depends_on = [google_project_service.run_api]
}

# Allow unauthenticated users to invoke the service
resource "google_cloud_run_service_iam_member" "run_all_primary_2_users" {
  service  = google_cloud_run_service.run_primary_2.name
  location = google_cloud_run_service.run_primary_2.location
  role     = "roles/run.invoker"
  member   = "allUsers"
}

# Display the service URL
output "primary-2-url" {
  value = google_cloud_run_service.run_primary_2.status[0].url
}
