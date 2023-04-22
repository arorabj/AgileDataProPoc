#export GOOGLE_APPLICATION_CREDENTIALS="./my-key.json"

import os

os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = "./my-key.json"

from google.cloud import bigquery

# Create a client object
client = bigquery.Client()

# Define your query
query = """
SELECT *
FROM `bigquery-public-data.samples.gsod`
WHERE year = 2019 AND month = 7
LIMIT 10
"""

# Execute the query
query_job = client.query(query)

# Fetch the results
results = query_job.result()

# Print the results
for row in results:
    print(row)

