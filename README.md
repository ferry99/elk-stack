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
* docker run --name logstash -v $PWD/config/:/tmp/config/ -v $PWD/logs/:/tmp/logs/ --network elk-net -p 5044:5044 --rm customlogstash logstash -f /tmp/config/logstash-filebeat.conf


## RUNNING FILEBEAT ON APP 2
* cd APP_2
* docker run --network elk-net -v $PWD/filebeat.yml:/usr/share/filebeat/filebeat.yml -v H:/ELK-Stack/APP_2/logs/:/tmp/APP_2/logs/ docker.elastic.co/beats/filebeat:7.4.2 -e -d "*"
* Another way using : docker-compose up 

## RUNNING FILEBEAT ON APP 2
* cd APP_3
* docker run --network elk-net -v $PWD/filebeat.yml:/usr/share/filebeat/filebeat.yml -v H:/ELK-Stack/APP_3/logs/:/tmp/APP_3/logs/ docker.elastic.co/beats/filebeat:7.4.2 -e -d "*"

## USING DOCKER-COMPOSE
* docker-compose up build -d
