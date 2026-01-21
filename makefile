
all: fullAnalysis.pdf ratesGraph.pdf rates.txt postOutZoneData.gz preOutZoneData.gz preInZoneData.gz
	echo "Everything has now been built"

clean:
	rm -f ratesGraph.pdf fullAnalysis.pdf rates.txt preInAvgCollisions.txt postInAvgCollisions.txt postInAvgs.txt postInZoneData.gz postOutZoneData.gz preInZoneData.gz preOutZoneData.gz preTollData.gz postTollData.gz
	echo "All Clean"

#3 graphs, collsions, entries, rates all pre vs post toll
fullAnalysis.pdf: rates.txt postInAvgs.txt postInAvgCollisions.txt MTAavgs.txt preInAvgCollisions.txt  
	python3 plotFullAnalysis.py 

#graphs accident rates pre vs post toll
ratesGraph.pdf: rates.txt plotRates.py
	python3 plotRates.py

#processes avg collisions and entries both pre and post and caluclates rates
rates.txt: postInAvgs.txt postInAvgCollisions.txt MTAavgs.txt preInAvgCollisions.txt
	gawk -f rates.awk postInAvgs.txt postInAvgCollisions.txt MTAavgs.txt preInAvgCollisions.txt > rates.txt

#processes pre toll in congestion zone collisions and calculates avg
preInAvgCollisions.txt: preInZoneData.gz avgCollisions2.awk
	zcat preInZoneData.gz | gawk -f avgCollisions2.awk > preInAvgCollisions.txt

#processes post toll in congestion zone collisions and calculates avg
postInAvgCollisions.txt: postInZoneData.gz avgCollisions.awk
	zcat postInZoneData.gz | gawk -f avgCollisions.awk > postInAvgCollisions.txt

#processes congestion data, sorts post toll and calculates avg entries
postInAvgs.txt: MTAcongestion.gz avgEntries.awk
	zcat MTAcongestion.gz | gawk -f avgEntries.awk > postInAvgs.txt

#processes post toll collision data, seperates in congestion zone                                        
postInZoneData.gz: postTollData.gz inZone.awk
	zcat postTollData.gz | gawk -f inZone.awk | gzip > postInZoneData.gz

#processes post toll collision data, seperates out of congestion zone
postOutZoneData.gz: postTollData.gz outZone.awk
	zcat postTollData.gz | gawk -f outZone.awk | gzip > postOutZoneData.gz

#processes pre toll collision data, seperates in congestion zone
preInZoneData.gz: preTollData.gz inZone.awk 
	zcat preTollData.gz | gawk -f inZone.awk | gzip > preInZoneData.gz

#processes pre toll collision data, seperates out of congestion zone
preOutZoneData.gz: preTollData.gz outZone.awk
	zcat preTollData.gz | gawk -f outZone.awk | gzip > preOutZoneData.gz

#processes collision data, seperates into pre toll implementation 
preTollData.gz: rawCollisions.gz preToll.awk
	zcat rawCollisions.gz | gawk -f preToll.awk | gzip > preTollData.gz

#processes collision data, seperates int post toll implementation
postTollData.gz: rawCollisions.gz postToll.awk
	zcat rawCollisions.gz | gawk -f postToll.awk | gzip > postTollData.gz
