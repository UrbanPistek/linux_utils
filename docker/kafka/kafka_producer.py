import json
import sys
import time
import argparse
from kafka import KafkaProducer

def publish_kafka(producer, topic, msg):
    packet = {'msg': msg}
    producer.send(topic, packet)

def main():
    print("=> Kafka Producer")

    # Configure 
    parser = argparse.ArgumentParser()
    parser.add_argument("-i","--ip", type = str, default = "localhost", help = "Kafka Broker IP")
    parser.add_argument("-p","--port", type = str, default = 9092, help = "Kafka Broker Port")
    parser.add_argument("-t","--topic", type = str, default = "main", help = "Kafka Topic")
    parser.add_argument("-m","--msg", type = str, default = "test", help = "Messege to send")
    args = parser.parse_args()

    topic = args.topic
    ip = args.ip
    port = args.port
    msg = args.msg

    print('\n config:')
    print("kafka: ", ip + ":" + port, "topics: ", topic)

    # Setup kafka
    producer = KafkaProducer(
        bootstrap_servers=[ip + ":" + port],
        value_serializer=lambda x: 
        json.dumps(x).encode('utf-8')
    )

    producer.flush()
    publish_kafka(producer, topic, msg)

if __name__ == '__main__':
    main()
