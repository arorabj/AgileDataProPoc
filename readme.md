## Setup and requirements
Assumptions, New project is already setup

## Enable the API

BigQuery API should be enabled by default in all Google Cloud projects. You can check whether this is true with the following command in the Cloud Shell: You should be BigQuery listed:

`gcloud services list`

You should see BigQuery listed:

`
NAME                            TITLE
bigquery.googleapis.com         BigQuery API
`
In case the BigQuery API is not enabled, you can use the following command in the Cloud Shell to enable it:

`gcloud services enable bigquery.googleapis.com`

## Authenticate API requests
In order to make requests to the BigQuery API, you need to use a Service Account. A Service Account belongs to your project and it is used by the Google Cloud Python client library to make BigQuery API requests. Like any other user account, a service account is represented by an email address. In this section, you will use the Cloud SDK to create a service account and then create credentials you will need to authenticate as the service account.

First, set a PROJECT_ID environment variable:

`export PROJECT_ID=$(gcloud config get-value core/project)`

Next, create a new service account to access the BigQuery API by using:

`gcloud iam service-accounts create my-bigquery-sa \
  --display-name "my bigquery service account"`
  
Next, create credentials that your Python code will use to login as your new service account. Create these credentials and save it as a JSON file ~/key.json by using the following command:

`gcloud iam service-accounts keys create ~/key.json \
  --iam-account my-bigquery-sa@${PROJECT_ID}.iam.gserviceaccount.com`
Finally, set the GOOGLE_APPLICATION_CREDENTIALS environment variable, which is used by the BigQuery Python client library, covered in the next step, to find your credentials. The environment variable should be set to the full path of the credentials JSON file you created, by using:

`export GOOGLE_APPLICATION_CREDENTIALS=~/key.json`

## Set up access control

BigQuery uses Identity and Access Management (IAM) to manage access to resources. BigQuery has a number of predefined roles (user, dataOwner, dataViewer etc.) that you can assign to your service account you created in the previous step. You can read more about Access Control in the BigQuery docs.

Before you can query public datasets, you need to make sure the service account has at least the roles/bigquery.user role. In Cloud Shell, run the following command to assign the user role to the service account:

`gcloud projects add-iam-policy-binding ${PROJECT_ID} \
  --member "serviceAccount:my-bigquery-sa@${PROJECT_ID}.iam.gserviceaccount.com" \
  --role "roles/bigquery.user"`
You can run the following command to verify that the service account has the user role:

`gcloud projects get-iam-policy $PROJECT_ID`

You should see the following:

bindings:
`- members:
  - serviceAccount:my-bigquery-sa@<PROJECT_ID>.iam.gserviceaccount.com
  role: roles/bigquery.user`

## Library requirements

pip3 install --user --upgrade google-cloud-bigquery