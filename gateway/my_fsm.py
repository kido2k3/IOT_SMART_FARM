from my_parameters import speed
import math

# the state of communication
ST_IDLE = 0
ST_MIXER1 = 1
ST_MIXER2 = 2
ST_MIXER3 = 3
ST_PUMP_IN = 4
ST_SELECTOR = 5
ST_PUMP_OUT = 6
# some variables
state = ST_IDLE
counter = 0 # 1 corresponds to 100ms

def state_machine_1_cycle () :
    if state == ST_IDLE :
        state = ST_MIXER1
    elif state == ST_MIXER1 :
        if (counter == math.ceil(flow1/speed)):
            counter = 0
            state = ST_MIXER2
    elif state == ST_MIXER2 :
        if (counter == math.ceil(flow2/speed)):
            counter = 0
            state = ST_MIXER3
    elif state == ST_MIXER3 :
        if (counter == math.ceil(flow3/speed)):
            counter = 0
            state = ST_PUMP_IN
    elif state == ST_PUMP_IN :
        if counter == time_pump_in*10 :
            state = ST_SELECTOR
            counter = 0
    elif state == ST_SELECTOR :
        if area == 1:
            pass
        elif area == 2:
            pass
        elif area == 3:
            pass
    elif state == ST_PUMP_OUT :
        if counter == time_pump_out*10 :
            state = ST_IDLE
            counter = 0
    counter = counter + 1