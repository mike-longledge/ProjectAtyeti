
terraform {
  backend "gcs" {
    bucket = "staking-prod-313416-tfstate"
    prefix = "env/dev"
  }
}
