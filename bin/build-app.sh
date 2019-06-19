#!/bin/bash
#
BIN_DIR="$(dirname "${BASH_SOURCE-$0}")"
source "$BIN_DIR/myenv.sh"

echo "Building Fusion App"
echo $BIN_DIR
cd ${BIN_DIR}/../app/semantic-search/ 
echo pwd
zip -rv ../semantic-search.zip .* 
echo "Fusion App ready for import in app/semantic-search.zip"
