## RUNNING ELASTIC SEARCH
* docker pull elasticsearch:7.8.0
* docker run --name elasticsearch --network elk-net -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" elasticsearch:7.8.0

## RUNNING KIBANA
* docker pull kibana:7.8.0
* docker run --name kibana --network elk-net -p 5601:5601 -p 8080:8080 -e ELASTICSEARCH_URL=http://elasticsearch:9200 kibana:7.8.0 

## RUNNING LOGSTASH
* docker build -t customlogstash .
* docker run --name logstash --network elk-net --rm customlogstash 
* docker run --rm -it -v $PWD/config/:/usr/share/logstash/config/ customlogstash
* docker run --name logstash -v $PWD/:/tmp/ --network elk-net --rm customlogstash logstash -f /tmp/config/logstash-docker.conf

## USING DOCKER-COMPOSE
* docker-compose up build -d
