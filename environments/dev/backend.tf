
terraform {
  backend "gcs" {
    bucket = "serviceswithprimarysecondary-tfstate"
    prefix = "env/dev"
  }
}
