#!/bin/bash
#
echo "Downloading Legacy Filesystem Connector"
endpath=$(basename "$(pwd)") 
curl "https://download.lucidworks.com/fusion-4.2.2/lucidworks.file-4.2.2.zip" --output "lucidworks.file-4.2.2.zip"
echo "Installing Legacy Filesystem Connector"
curl -u "admin:password123" -H "Content-Type: application/octet-stream" -X PUT --data-binary @lucidworks.file-4.2.2.zip "http://localhost:8764/api/apollo/blobs/lucidworks.file-4.2.2.zip?resourceType=plugin:connector"
echo "Filesystem Connector Installation Complete"
