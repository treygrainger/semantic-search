#!/bin/bash
#
echo "Building Fusion App"
endpath=$(basename "$(pwd)") 
if [ $endpath = "bin" ]
then
  $(echo pwd; cd ../app/semantic-search/; zip -rv ../semantic-search.zip .* ;)  
else
  $(cd bin/ ; echo pwd; cd ../app/semantic-search/; zip -rv ../semantic-search.zip .* ;)	
fi

#zip -rv ../app/semantic-search.zip ../app/semantic-search
echo "Fusion App ready for import in app/semantic-search.zip"
