#!/bin/bash
#
echo "Building Fusion App"
$(echo pwd; cd ../app/semantic-search; zip -rv ../semantic-search.zip .* ;)
#zip -rv ../app/semantic-search.zip ../app/semantic-search
echo "Fusion App ready for import in app/semantic-search.zip"
