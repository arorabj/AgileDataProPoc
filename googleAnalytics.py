#ip install google-auth google-auth-oauthlib google-auth-httplib2 google-api-python-client

from google.oauth2.credentials import Credentials
from googleapiclient.discovery import build
from googleapiclient.errors import HttpError
import pandas as pd

# Set up authorization
creds = Credentials.from_authorized_user_file('credentials.json')

# Set up the Analytics Reporting API
analytics = build('analyticsreporting', 'v4', credentials=creds)

# Query the API to get the data
response = analytics.reports().batchGet(
    body={
        'reportRequests': [
            {
                'viewId': 'VIEW_ID',
                'dateRanges': [{'startDate': 'START_DATE', 'endDate': 'END_DATE'}],
                'metrics': [{'expression': 'ga:sessions'}, {'expression': 'ga:users'}],
                'dimensions': [{'name': 'ga:date'}]
            }
        ]
    }
).execute()

# Convert the response to a pandas dataframe
data = []
for report in response.get('reports', []):
    columnHeader = report.get('columnHeader', {})
    dimensionHeaders = columnHeader.get('dimensions', [])
    metricHeaders = columnHeader.get('metricHeader', {}).get('metricHeaderEntries', [])
    rows = report.get('data', {}).get('rows', [])
    for row in rows:
        rowDict = {}
        dimensions = row.get('dimensions', [])
        metrics = row.get('metrics', [])[0].get('values', [])
        for i, dimension in enumerate(dimensions):
            rowDict[dimensionHeaders[i]] = dimension
        for i, metric in enumerate(metrics):
            rowDict[metricHeaders[i].get('name')] = metric
        data.append(rowDict)

df = pd.DataFrame(data)