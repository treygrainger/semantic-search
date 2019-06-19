#!/bin/bash
#

BIN_DIR="$(dirname "${BASH_SOURCE-$0}")"
source "$BIN_DIR/myenv.sh"
cd ${BIN_DIR}

if [ "$FUSION_URL" == "" ]; then
  FUSION_URL = "http://localhost:8764"
fi

if [ "$FUSION_USER" == "" ]; then
  FUSION_USER = "admin"
fi

if [ "$FUSION_PASS" == "" ]; then
  echo -e "ERROR: Must provide a valid password for Fusion user: $FUSION_USER"
  exit 1
fi

FUSION_VERSION=4.2.2
CONNECTOR_PLUGIN=lucidworks.file-4.2.2.zip

echo "Downloading Legacy Filesystem Connector"
curl "https://download.lucidworks.com/fusion-$FUSION_VERSION/$CONNECTOR_PLUGIN" --output "$CONNECTOR_PLUGIN"
echo "Installing Legacy Filesystem Connector"
curl -u "$FUSION_USER:$FUSION_PASS" -H "Content-Type: application/octet-stream" -X PUT --data-binary @$CONNECTOR_PLUGIN "$FUSION_URL/api/apollo/blobs/$CONNECTOR_PLUGIN?resourceType=plugin:connector"
rm $CONNECTOR_PLUGIN
echo "Filesystem Connector Installation Complete"
