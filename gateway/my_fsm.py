from my_parameters import *
from my_os import OS
from my_serial import *
from my_crc import CRC_MOD_BUS

class Command:
    def __init__(self, glob_connect = None, crc_calc = None, data = 0, flag =0):
        self.glob_connect = UART()
        self.crc_calc = CRC_MOD_BUS(crc_lists)
        self.data = data
        self.flag = flag

    def read_connection(self):
        self.data = self.glob_connect.ReadSerial()

    def turn_mixer_1_on(self):
        self.glob_connect.ser.write(self.crc_calc.export("MIXER1_ON"))
        # turn mixer 1 off

    def turn_mixer_1_off(self):
        self.glob_connect.ser.write(self.crc_calc.export("MIXER1_OFF"))

        # turn mixer 2 on
    def turn_mixer_2_on(self):
        self.glob_connect.ser.write(self.crc_calc.export("MIXER2_ON"))
        # turn mixer 2 off

    def turn_mixer_2_off(self):
        self.glob_connect.ser.write(self.crc_calc.export("MIXER2_OFF"))

        # turn mixer 3 on
    def turn_mixer_3_on(self):
        self.glob_connect.ser.write(self.crc_calc.export("MIXER3_ON"))
        # turn mixer 3 off

    def turn_mixer_3_off(self):
        self.glob_connect.ser.write(self.crc_calc.export("MIXER3_OFF"))

        # select area 1
    def select_area_1(self):
        self.glob_connect.ser.write(self.crc_calc.export("SELECTOR1_ON"))
        # unselect area 1

    def unselect_area_1(self):
        self.glob_connect.ser.write(self.crc_calc.export("SELECTOR1_OFF"))

        # select area 2
    def select_area_2(self):
        self.glob_connect.ser.write(self.crc_calc.export("SELECTOR2_ON"))
        # unselect area 2

    def unselect_area_2(self):
        self.glob_connect.ser.write(self.crc_calc.export("SELECTOR2_OFF"))

        # select area 3
    def select_area_3(self):
        self.glob_connect.ser.write(self.crc_calc.export("SELECTOR3_ON"))
        # unselect area 3

    def unselect_area_3(self):
        self.glob_connect.ser.write(self.crc_calc.export("SELECTOR3_OFF"))

        # turn in_pump on
    def turn_in_pump_on(self):
        self.glob_connect.ser.write(self.crc_calc.export("PUMP_IN_ON"))
        # turn in_pump off

    def turn_in_pump_off(self):
        self.glob_connect.ser.write(self.crc_calc.export("PUMP_IN_OFF"))

        # turn out_pump on
    def turn_out_pump_on(self):
        self.glob_connect.ser.write(self.crc_calc.export("PUMP_OUT_ON"))
        # turn out_pump off

    def turn_out_pump_off(self):
        self.glob_connect.ser.write(self.crc_calc.export("PUMP_OUT_OFF"))

def my_fsm(state, mixer, area, command, count, os, flag):
    os.add_process(command.read_connection,0,0)
    # print(flag)
    if state == ST_IDLE:
        state = ST_MIXER1
        os.add_process(command.turn_mixer_1_on)
        print("state mixer1")
    elif state == ST_MIXER1:
        if(command.data == -2 and command.flag == 0):
            if(count % 10 == 0):
                os.add_process(command.turn_mixer_1_on)
            if(count / 10 > 3):
                print("time out1")
                print("state mixer2")
                os.add_process(command.turn_mixer_1_off)
                os.add_process(command.turn_mixer_2_on)
                count = 0
                state = ST_MIXER2
        elif(command.data != -2):
            command.flag = 1
            command.count = 0
        else:
            if count >= (mixer[0]/SPEED)*10 :
                os.add_process(command.turn_mixer_1_off)
                os.add_process(command.turn_mixer_2_on)
                count = 0
                state = ST_MIXER2
                command.flag = 0
                print("state mixer2")
    elif state == ST_MIXER2:
        if(command.data == -2 and command.flag == 0):
            if(count % 10 == 0):
                os.add_process(command.turn_mixer_1_off)
                os.add_process(command.turn_mixer_2_on)
            if(count / 10 > 3):
                print("time out2")
                print("state mixer3")
                os.add_process(command.turn_mixer_2_off)
                os.add_process(command.turn_mixer_3_on)
                count = 0
                state = ST_MIXER3
        elif(command.data != -2):
            command.flag = 1
            command.count = 0
        else:
            if count >= (mixer[1]/SPEED)*10 :
                os.add_process(command.turn_mixer_2_off)
                os.add_process(command.turn_mixer_3_on)
                count = 0
                state = ST_MIXER3
                command.flag = 0
                print("state mixer3")
    elif state == ST_MIXER3:
        if(command.data == -2 and command.flag == 0):
            if(count % 10 == 0):
                os.add_process(command.turn_mixer_2_off)
                os.add_process(command.turn_mixer_3_on)
            if(count / 10 > 3):
                print("time out3")
                print("state pump in")
                os.add_process(command.turn_mixer_3_off)
                os.add_process(command.turn_in_pump_on)
                count = 0
                state = ST_PUMP_IN
        elif(command.data != -2):
            command.flag = 1
            command.count = 0
        else:
            if count >= (mixer[1]/SPEED)*10 :
                os.add_process(command.turn_mixer_3_off)
                os.add_process(command.turn_in_pump_on)
                count = 0
                state = ST_PUMP_IN
                command.flag = 0
                print("state pump in")
    elif state == ST_PUMP_IN:
        if(command.data == -2 and command.flag == 0):
            if(count % 10 == 0):
                os.add_process(command.turn_mixer_3_off)
                os.add_process(command.turn_in_pump_on)
            if(count / 10 > 3):
                print("time out4")
                print("state selector")
                if(area == "1"):
                    os.add_process(command.select_area_1)
                elif(area == "2"):
                    os.add_process(command.select_area_2)
                elif(area == "3"):
                    os.add_process(command.select_area_3)
                os.add_process(command.turn_in_pump_off)
                count = 0
                state = ST_SELECTOR
        elif(command.data != -2):
            command.flag = 1
            command.count = 0
        else:
            if count >= (20)*10 :
                if(area == "1"):
                    os.add_process(command.select_area_1)
                elif(area == "2"):
                    os.add_process(command.select_area_2)
                elif(area == "3"):
                    os.add_process(command.select_area_3)
                os.add_process(command.turn_in_pump_off)
                count = 0
                state = ST_SELECTOR
                command.flag = 0
                print("state selector")
    elif state == ST_SELECTOR:
        
        if(command.data == -2 and command.flag == 0):
            if(count % 10 == 0):
                if(area == "1"):
                    os.add_process(command.select_area_1)
                elif(area == "2"):
                    os.add_process(command.select_area_2)
                elif(area == "3"):
                    os.add_process(command.select_area_3)
                os.add_process(command.turn_in_pump_off)
            if(count / 10 > 3):
                print("time out5")
                print("state pump out")
                os.add_process(command.turn_out_pump_on)
                count = 0
                state = ST_PUMP_OUT
        elif(command.data != -2):
            command.flag = 1
            command.count = 0
        else:
            os.add_process(command.turn_out_pump_on)
            count = 0
            state = ST_PUMP_OUT
            command.flag = 0
            print("state pump out")
    elif state == ST_PUMP_OUT:
        
        if(command.data == -2 and command.flag == 0):
            if(count % 10 == 0):
                os.add_process(command.turn_out_pump_on)
            if(count / 10 > 3):
                print("time out6")
                if(area == "1"):
                    os.add_process(command.unselect_area_1)
                elif(area == "2"):
                    os.add_process(command.unselect_area_2)
                elif(area == "3"):
                    os.add_process(command.unselect_area_3)
                os.add_process(command.turn_out_pump_off)
                count = 0
                state = ST_END_STATE
        elif(command.data != -2):
            command.flag = 1
            command.count = 0
        else:
            if count >= 20*10 :
                if(area == "1"):
                    os.add_process(command.unselect_area_1)
                elif(area == "2"):
                    os.add_process(command.unselect_area_2)
                elif(area == "3"):
                    os.add_process(command.unselect_area_3)
                os.add_process(command.turn_out_pump_off)
                count = 0
                state = ST_END_STATE
                command.flag = 0
    elif state == ST_END_STATE:
        if(command.data == -2 and command.flag == 0):
            if(count % 10 == 0):
                if(area == "1"):
                    os.add_process(command.unselect_area_1)
                elif(area == "2"):
                    os.add_process(command.unselect_area_2)
                elif(area == "3"):
                    os.add_process(command.unselect_area_3)
                os.add_process(command.turn_out_pump_off)
            if(count / 10 > 3):
                print("time out7")
                state = ST_IDLE
                count = 0
                flag = False
        elif(command.data != -2):
            state = ST_IDLE
            flag = False
            count = 0
            pass
    count += 1
    return state, mixer, area, command, count, os, flag


class FSM:
    def __init__(self, fsm, mixer, area, flag = True, command=None, count=0, os=None) -> None:
        self.state = ST_IDLE
        self.count = count
        self.fsm = fsm
        self.mixer = mixer
        self.area = area
        self.command = Command()
        self.os = OS()
        self.flag = flag

    def run_fsm(self):
        self.state, self.mixer, self.area, self.command, self.count, self.os, self.flag = self.fsm(self.state, self.mixer, self.area, self.command, self.count, self.os, self.flag)
    
    def add(self):
        self.os.add_process(self.run_fsm,0,1)
    
    def check(self):
        if self.flag == False:
            self.os.remove_process(self.run_fsm)

# for testing
# tao file moi de test
# from time import sleep
# from my_mini_task import *
# from my_fsm import *
# from my_task import Task
# from my_mini_task import miniTask

# os = OS()
# task1 = Task("1", 5, [20, 35, 10], "2", "18:30")
# childTask = miniTask(task1)
# print(childTask.area)
# print(childTask.mixer)
# # class_fsm = FSM(my_fsm, childTask.mixer, childTask.area)
# # os.add_process(class_fsm.add)
# # os.add_process(class_fsm.check,0,1)
# os.add_process(childTask.run_task)
# while True:
#     os.dispatch_process()
#     # print(task1.cycle_num)
#     # print(class_fsm.flag)
#     sleep(0.1)