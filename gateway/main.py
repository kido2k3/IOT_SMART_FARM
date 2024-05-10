import time
from my_server import Server
from my_parameters import *

if True:
    my_server = Server(LIST_OF_FEEDS, HOST, USER, PASSWORD)


while True:
    time.sleep(0.1)