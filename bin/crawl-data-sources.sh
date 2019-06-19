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


DATASOURCES[0]='datasource:upload-entities-manual'
DATASOURCES[1]='datasource:upload-places-manual'
DATASOURCES[2]='upload-entities-geonames-cities'
DATASOURCES[3]='datasource:file-places-crawled'


for CURRENT_DATASOURCE in ${DATASOURCES[*]}
do
  #CURRENT_DATASOURCE='datasource:upload-entities-manual'
  echo "Starting $CURRENT_DATASOURCE"
  curl -u "${FUSION_USER}:${FUSION_PASS}" -H "Content-type:application/json" -X POST -d '{"action":"start","comment":"Started via shell script"}' "${FUSION_URL}/api/apps/semantic-search/jobs/${CURRENT_DATASOURCE}/actions"
  echo -e "\n\nWaiting for $CURRENT_DATASOURCE to finish crawl"
  sleep 10
  COUNTER=0
  MAX_LOOPS=60
  job_status="running"
  while [  $COUNTER -lt $MAX_LOOPS ]; do
    response=$(curl -u $FUSION_USER:$FUSION_PASS -s "$FUSION_URL/api/jobs/$CURRENT_DATASOURCE")
    [[ "$response" =~ \"status\"\ \:\ \"([^\"]*)\" ]] && job_status="${BASH_REMATCH[1]}"
    echo "The $CURRENT_DATASOURCE job is: $job_status"
    if [ "running" == "$job_status" ]; then
      sleep 10
      let COUNTER=COUNTER+1  
    else
      let COUNTER=999
    fi
  done

  if [ "$job_status" != "success" ]; then
    echo -e "\nThe $CURRENT_DATASOURCE job has not finished (last known state: $job_status) in over 10 minutes! Script will exit as there's likely a problem that needs to be corrected manually.\nCheck the var/log/connectors/connectors.log in your Fusion installation for errors."
    exit 1
  fi
done

#datasource:file-places-crawled

#echo "Starting datasource:upload-places-manual"
#curl -u '$FUSION_USER:$FUSION_PASS' -H "Content-type:application/json" -X POST -d '{"action":"start","comment":"Started via shell script"}' $FUSION_URL/api/apollo/apps/semantic-search/jobs/datasource:upload-places-manual/actions

#echo "Starting datasource:upload-entities-geonames-cities"
#curl -u '$FUSION_USER:$FUSION_PASS' -H "Content-type:application/json" -X POST -d '{"action":"start","comment":"Started via shell script"}' $FUSION_URL/api/apollo/apps/semantic-search/jobs/datasource:upload-entities-geonames-cities/actions

#echo "Starting datasource:upload-entities-manual"
#curl -u '$FUSION_USER:$FUSION_PASS' -H "Content-type:application/json" -X POST -d '{"action":"start","comment":"Started via shell script"}' $FUSION_URL/api/apollo/apps/semantic-search/jobs/datasource:upload-entities-manual/actions
