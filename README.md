# Example Sinatra application to demonstrate a timeout issue in Firefox

## The issue

There is a NetworkError that happens 30 seconds after the request is made. It doesn't happen in Chrome, or when request is sent via CURL.

## How to reproduce

1. Run this service in Google Cloud Run or Google Cloud App Engine. Most likely the problem would happen with other services too, but many of them (heroku, scalingo) have 30 seconds timeout enforced on the server side, so I wasn't able to reproduce that on them. You can use bin/beploy script like this: `PROJECT=your_google_cloud_project_name bin/deploy`
2. Open Web Developer Tools
3. When you click "Link 2" (which sends a request to which server responds in 2 seconds), everything works fine), but when you click "Link 31" or "Link 45" (which take respectively 31 and 45 seconds for the server to respond), you will see `Uncaught (in promise) TypeError: NetworkError when attempting to fetch resource.` in the Web Developers Tools console.
