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

5) Install the File System connector:
./bin/install-filesystem-connector.sh

6) Import your app from /app/semantic-search.zip into Fusion through the "Import App" button on the Fusion home screen

7) Click on the "Semantic Search" App tile, and then select the "places" collection from the top-left dropdown. Now go to the search bar (top-right) and search for "data sources" and click on the top link (under "Navigation"). Then click on the "file-places-crawled" datasource and update the "start links" setting to point to the local directory where you downloaded the file in step 1. The default is currently:
/Users/treygrainger/Development/natural-language-search/app/datasets/places-crawled.json.zip

8) Run both datasources on the screen ("file-places-crawled" and "upload-places-manual")

9) Click on the collections drop-down again (top-left) and select the "entities" collection.

10) Navigate to datasources again, and run both the datasources on the screen ("entities-geonames-cities" and "upload-entities-manual")

11) Once the datasources all finish running, go to http://HOSTNAME:8983/solr/entities/semantic

12) Have fun testing different queries. Suggestions:
bbq near haystack
top masala near Atlanta
...

13) If you would like to modify the UI and logic, select the "entities" collection and then search for and select "solr config". Under your Solr Config files, click on "velocity" and then "semantic.vm" and you will be able to make and save changes.

The above process will be cleaned up and automated, but posting this for now so people can get going. Have fun!
