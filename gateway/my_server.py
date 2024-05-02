# this is server Connection module by paho-mqtt
import paho.mqtt.client as mqtt
import sys

class Server:
    # Some config paras
    AIO_FEEDS = dict()
    AIO_USERNAME =  str()
    AIO_KEY = ''
    AIO_HOST = str()
    client = None
    buffer = str()
    self_publish = 0
    received = False
    # The callback for when the client receives a CONN_ACK response from the server.

    def published(self, client, userdata, mid):
        print("published successfully mid: ", mid)
    def connected(self, client, user_data, flags, rc):
        # Connected function will be called when the client is connected to server
        if (rc == 0):
            print('Successfully connecting to the server')
        else:
            print("connecting to the server fail")
        for topic in self.AIO_FEEDS.values():
            client.subscribe(topic)

    def subscribed(self, client, user_data, mid, granted_qos):
        # This method is called when the client subscribes to a new feed.
        print('Subscribed successfully to {0} with QoS {1}'.format(mid, granted_qos[0]))

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

    def __init__(self, list_of_feeds: list, host:str, user:str, password:str):
        self.AIO_HOST = host
        self.AIO_USERNAME = user
        self.AIO_KEY = password
        for topic in list_of_feeds:
            self.AIO_FEEDS.update({topic: f"{self.AIO_USERNAME}/feeds/{topic}"})
        self.client = mqtt.Client()
        # Enter credentials
        self.client.username_pw_set(self.AIO_USERNAME, self.AIO_KEY)

        self.client.on_connect = self.connected
        self.client.on_message = self.message
        self.client.on_subscribe = self.subscribed
        self.client.on_publish = self.published
        self.client.connect(host=self.AIO_HOST, port=1883, keepalive=60)

        self.client.loop_start()
        # client loop forever is suitable for subscribe-only processes


# for testing
import time
import json
temp = Server([], "io.adafruit.com","kido2k3","aio_Npjc80KNOWkXyy5wRoVQpM5mSTmq")
time.sleep(2)
x = { "value": 22.587,
    "lat": 38.1123,
    "lon": -91.2325,
    "ele": 112}
y = json.dumps(x)
temp.client.publish("kido2k3/feeds/iot-gateway",y)
time.sleep(2)
x = { "value": 40,
    "lat": 38.1123,
    "lon": -91.2325,
    "ele": 112}
y = json.dumps(x)
temp.client.publish("kido2k3/feeds/iot-gateway",y)
print("sent")
while True:
    pass
