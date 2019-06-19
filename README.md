Semantic Search Demo
Author: Trey Grainger

Instructions:
1) Download the crawled places dataset and place into datasets/ directory:
[ Ask Trey for Link for now until he can clean it up for public consumption ]

2) Build the Semantic Search Fusion App:
./bin/build-app.sh

3) Download and Start OR Create a Cloud Instance of Lucidworks Fusion 4.2:
https://lucidworks.com/download/

4) Go to the Fusion Home Screen and login (or create your admin account if prompted)

5) If you need to change the default user, password, or Fusion URL, update those values in bin/myenv.sh

6) Install the File System connector:
./bin/install-filesystem-connector.sh

7) Import your app from /app/semantic-search.zip into Fusion through the "Import App" button on the Fusion home screen

8) Open the Fusion Admin UI and change the start link for the "file-places-crawled" datasource to to absolute path of your downloaded dataset from #1. i.e.:
/Users/treygrainger/Development/semantic-search/datasets/places-crawled.json.zip

9) Performa a crawl of each of the needed data sources:
./bin/crawl-data-sources.sh

10) You're all set! Now go to http://HOSTNAME:8983/solr/entities/semantic

10) Have fun testing different queries. Suggestions:
bbq near haystack
top masala near Atlanta
...

If you would like to modify the UI and logic, select the "entities" collection and then search for and select "solr config". Under your Solr Config files, click on "velocity" and then "semantic.vm" and you will be able to make and save changes.

The above process will be further cleaned up and automated, but posting this for now so people can get going. Have fun!
