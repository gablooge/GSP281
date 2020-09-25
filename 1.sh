#!/bin/bash
gcloud auth revoke --all

while [[ -z "$(gcloud config get-value core/account)" ]]; 
do echo "waiting login" && sleep 2; 
done

while [[ -z "$(gcloud config get-value project)" ]]; 
do echo "waiting project" && sleep 2; 
done



## Task 1: Create a cloud storage bucket

export PROJECT_ID=$(gcloud info --format='value(config.project)')
gsutil mb gs://$PROJECT_ID

## Task 2: Upload CSV files to Cloud Storage

gsutil cp *_data.csv gs://$PROJECT_ID

## Task 3: Create a Cloud SQL instance
gcloud sql instances create qwiklabs-demo --tier=db-n1-standard-2 --region=us-central1 --root-password=P4ssw0rd

## Task 4: Create a database
gcloud sql databases create bike --instance=qwiklabs-demo 

# gcloud sql connect  qwiklabs-demo --user=root
