# this is Adafruit Connection module by paho-mqtt
import paho.mqtt.client as mqtt
import sys


class Server:
    # Some config paras
    AIO_FEED_NAMES = list()
    AIO_USERNAME =  str()
    AIO_KEY = ''
    AIO_HOST = str()
    client = None
    buffer = str()
    self_publish = 0
    received = False
    # The callback for when the client receives a CONN_ACK response from the server.

    def connected(self, client, user_data, flags, rc):
        # Connected function will be called when the client is connected to Adafruit IO.
        if (rc == 0):
            print('Successfully connecting to the server')
        else:
            print("connecting to the server fail")
        for topic in self.AIO_FEED_NAMES:
            client.subscribe(f'{self.AIO_USERNAME}/feeds/{topic}')

    def subscribed(self, client, user_data, mid, granted_qos):
        # This method is called when the client subscribes to a new feed.
        print('Subscribed successfully to {0} with QoS {1}'.format(
            self.AIO_FEED_NAMES[mid-1], granted_qos[0]))

    # The callback for when a  message is received from the server.

    def message(self, client, user_data, msg):
        # The feed_id parameter identifies the feed, and the payload parameter has
        # the new value.
        data = msg.payload
        # decode payload from bytes to string
        data = data.decode('utf-8')
        print(f'Feed {msg.topic} received new value: {data}')
        # write a call back function for handling data 
        

    def disconnected(self, client, user_data, rc):
        # Disconnected function will be called when the client disconnects.
        print('Disconnected from server')
        sys.exit(1)

    def __init__(self, lists_of_feeds: list, host:str, user:str, password:str):
        self.AIO_FEED_NAMES = lists_of_feeds
        self.AIO_HOST = host
        self.AIO_USERNAME = user
        self.AIO_KEY = password
        self.client = mqtt.Client()
        # Enter credentials
        self.client.username_pw_set(self.AIO_USERNAME, self.AIO_KEY)

        self.client.on_connect = self.connected
        self.client.on_message = self.message
        self.client.on_subscribe = self.subscribed
        self.client.connect(host=self.AIO_HOST, port=1883, keepalive=60)

        self.client.loop_start()
        # client loop forever is suitable for subscribe-only processes


# for testing
# import random
# temp = AdafruitConnection()
# while True:
#     value = random.randint(0, 1)
#     print(f'Publishing {value} to {temp.AIO_FEED_NAMES[0]}.')
#     temp.client.publish(f'{temp.AIO_USERNAME}/feeds/{temp.AIO_FEED_NAMES[0]}', value)
#     time.sleep(10)
