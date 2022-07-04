import json
import sys
import time
import argparse
from kafka import KafkaConsumer

def main():
    print("=> Kafka Consumer")

    # Configure 
    parser = argparse.ArgumentParser()
    parser.add_argument("-i","--ip", type = str, default = "localhost", help = "Kafka Broker IP")
    parser.add_argument("-p","--port", type = str, default = 9092, help = "Kafka Broker Port")
    parser.add_argument("-t","--topic", type = str, default = "main", help = "Kafka Topic")
    args = parser.parse_args()

    topic = args.topic
    ip = args.ip
    port = args.port

    print('\n config:')
    print("kafka: ", ip + ":" + port, "topics: ", topic)

    # Setup consumer
    consumer = KafkaConsumer(
    bootstrap_servers=[ip + ":" + port],
    auto_offset_reset='earliest',
    group_id = None,
    value_deserializer=lambda x: json.loads(x.decode('utf-8')))

    # subscribe to topic
    consumer.subscribe(topics=topic)
    print(f'consumer: {consumer}')
    print(f'consumer topics: \n {consumer.topics()}')

    # This will loop forever
    try: 
        for message in consumer:
            print ("%d:%d: v=%s" % (message.partition,
                                message.offset,
                                message.value))
    except KeyboardInterrupt:
        print("Metrics: \n", consumer.metrics())
        consumer.close()
        sys.exit()

if __name__ == '__main__':
    main()
