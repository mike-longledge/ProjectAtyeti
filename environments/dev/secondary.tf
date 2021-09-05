# Create the Cloud Run service secondary-1
resource "google_cloud_run_service" "run_secondary_1" {
  name = "secondary-1"
  location = "us-central1"

  template {
    spec {
      containers {
        image = "gcr.io/google-samples/hello-app:1.0"
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
resource "google_cloud_run_service_iam_member" "run_all_secondary_1_users" {
  service  = google_cloud_run_service.run_secondary_1.name
  location = google_cloud_run_service.run_secondary_1.location
  role     = "roles/run.invoker"
  member   = "allUsers"
}

# Display the service URL
output "secondary-1-url" {
  value = google_cloud_run_service.run_secondary_1.status[0].url
}

# Create the Cloud Run service secondary-2
resource "google_cloud_run_service" "run_secondary_2" {
  name = "secondary-2"
  location = "us-central1"

  template {
    spec {
      containers {
        image = "gcr.io/google-samples/hello-app:1.0"
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
resource "google_cloud_run_service_iam_member" "run_all_secondary_2_users" {
  service  = google_cloud_run_service.run_secondary_2.name
  location = google_cloud_run_service.run_secondary_2.location
  role     = "roles/run.invoker"
  member   = "allUsers"
}

# Display the service URL
output "secondary-2-url" {
  value = google_cloud_run_service.run_secondary_2.status[0].url
}
