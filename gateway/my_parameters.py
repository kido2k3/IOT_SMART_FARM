# for my_crc.py
crc_lists = {
    "mixer1_ON": [1, 6, 0, 0, 0, 255],
    "mixer1_OFF": [1, 6, 0, 0, 0, 0],
    "mixer2_ON": [2, 6, 0, 0, 0, 255],
    "mixer2_OFF": [2, 6, 0, 0, 0, 0],
    "mixer3_ON": [3, 6, 0, 0, 0, 255],
    "mixer3_OFF": [3, 6, 0, 0, 0, 0],
    "selector1_ON": [4, 6, 0, 0, 0, 255],
    "selector1_OFF": [4, 6, 0, 0, 0, 0],
    "selector2_ON": [5, 6, 0, 0, 0, 255],
    "selector2_OFF": [5, 6, 0, 0, 0, 0],
    "selector3_ON": [6, 6, 0, 0, 0, 255],
    "selector3_OFF": [6, 6, 0, 0, 0, 0],
    "pump_in_ON": [7, 6, 0, 0, 0, 255],
    "pump_in_OFF": [7, 6, 0, 0, 0, 0],
    "pump_out_ON": [8, 6, 0, 0, 0, 255],
    "pump_out_OFF": [8, 6, 0, 0, 0, 0],
    "soil_temperature":[10 ,3, 0, 6, 0, 1],
    "soil_humidity": [10, 3, 0, 7, 0, 1]
}

# for my_server.py
list_of_feeds = [""]
host = ""
user = ""
password = ""
