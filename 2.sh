## Task 3: Create a Cloud SQL instance
gcloud sql instances create qwiklabs-demo --tier=db-n1-standard-2 --region=us-central1 --root-password=P4ssw0rd

## Task 4: Create a database
gcloud sql databases create bike --instance=qwiklabs-demo 

gcloud sql connect  qwiklabs-demo --user=root

