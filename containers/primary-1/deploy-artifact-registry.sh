#!/bin/bash

gcloud config set project serviceswithprimarysecondary
PROJECT_ID=$(gcloud config get-value project)
gcloud auth configure-docker us-central1-docker.pkg.dev
gcloud builds submit
