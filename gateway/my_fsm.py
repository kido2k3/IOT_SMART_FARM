from my_parameters import *
from my_os import OS
from my_task import Task
from my_serial import *
from my_crc import CRC_MOD_BUS

class Command:
    glob_connect = UART()
    crc_calc = CRC_MOD_BUS(crc_lists)
    data = 0
    flag = 0

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

def my_fsm(state, task, command, count, os):
    # os.add_process(transfer_data,0,0)
    # os.add_process(turn_mixer_1_off,0,0)
    os.add_process(command.read_connection,0,0)
    
    if state == ST_IDLE:
        state = ST_MIXER1
        os.add_process(command.turn_mixer_1_on)
    elif state == ST_MIXER1:
        print(command.data)
        if(command.data == -2 and command.flag == 0):
            if(count % 10 == 0):
                os.add_process(command.turn_mixer_1_on)
            if(count / 10 > 3):
                print("time out1")
                os.add_process(command.turn_mixer_1_off)
                os.add_process(command.turn_mixer_2_on)
                count = 0
                state = ST_MIXER2
        elif(command.data != -2):
            command.flag = 1
            command.count = 0
        else:
            print("mixer1 is running")
            if count >= (task.mixer[0]/SPEED)*10 :
                os.add_process(command.turn_mixer_1_off)
                os.add_process(command.turn_mixer_2_on)
                count = 0
                state = ST_MIXER2
                command.flag = 0
    elif state == ST_MIXER2:
        print(command.data)
        if(command.data == -2 and command.flag == 0):
            if(count % 10 == 0):
                os.add_process(command.turn_mixer_1_off)
                os.add_process(command.turn_mixer_2_on)
            if(count / 10 > 3):
                print("time out2")
                os.add_process(command.turn_mixer_2_off)
                os.add_process(command.turn_mixer_3_on)
                count = 0
                state = ST_MIXER3
        elif(command.data != -2):
            command.flag = 1
            command.count = 0
        else:
            print("mixer2 is running")
            if count >= (task.mixer[1]/SPEED)*10 :
                os.add_process(command.turn_mixer_2_off)
                os.add_process(command.turn_mixer_3_on)
                count = 0
                state = ST_MIXER3
                command.flag = 0
    elif state == ST_MIXER3:
        print(command.data)
        if(command.data == -2 and command.flag == 0):
            if(count % 10 == 0):
                os.add_process(command.turn_mixer_2_off)
                os.add_process(command.turn_mixer_3_on)
            if(count / 10 > 3):
                print("time out3")
                os.add_process(command.turn_mixer_3_off)
                os.add_process(command.turn_in_pump_on)
                count = 0
                state = ST_PUMP_IN
        elif(command.data != -2):
            command.flag = 1
            command.count = 0
        else:
            print("mixer3 is running")
            if count >= (task.mixer[1]/SPEED)*10 :
                os.add_process(command.turn_mixer_3_off)
                os.add_process(command.turn_in_pump_on)
                count = 0
                state = ST_PUMP_IN
                command.flag = 0
    elif state == ST_PUMP_IN:
        print(command.data)
        if(command.data == -2 and command.flag == 0):
            if(count % 10 == 0):
                os.add_process(command.turn_mixer_3_off)
                os.add_process(command.turn_in_pump_on)
            if(count / 10 > 3):
                print("time out4")
                if(task.area == "1"):
                    os.add_process(command.select_area_1)
                elif(task.area == "2"):
                    os.add_process(command.select_area_2)
                elif(task.are == "3"):
                    os.add_process(command.select_area_3)
                os.add_process(command.turn_in_pump_off)
                count = 0
                state = ST_SELECTOR
        elif(command.data != -2):
            command.flag = 1
            command.count = 0
        else:
            print("pumping in")
            if count >= (20)*10 :
                if(task.area == "1"):
                    os.add_process(command.select_area_1)
                elif(task.area == "2"):
                    os.add_process(command.select_area_2)
                elif(task.are == "3"):
                    os.add_process(command.select_area_3)
                os.add_process(command.turn_in_pump_off)
                count = 0
                state = ST_SELECTOR
                command.flag = 0
    elif state == ST_SELECTOR:
        print(command.data)
        if(command.data == -2 and command.flag == 0):
            if(count % 10 == 0):
                if(task.area == "1"):
                    os.add_process(command.select_area_1)
                elif(task.area == "2"):
                    os.add_process(command.select_area_2)
                elif(task.are == "3"):
                    os.add_process(command.select_area_3)
                os.add_process(command.turn_in_pump_off)
            if(count / 10 > 3):
                print("time out5")
                os.add_process(command.turn_out_pump_on)
                count = 0
                state = ST_PUMP_OUT
        elif(command.data != -2):
            command.flag = 1
            command.count = 0
        else:
            print("selecting ")
            if count >= 10 :
                os.add_process(command.turn_out_pump_on)
                count = 0
                state = ST_PUMP_OUT
                command.flag = 0
    elif state == ST_PUMP_OUT:
        print(command.data)
        if(command.data == -2 and command.flag == 0):
            if(count % 10 == 0):
                os.add_process(command.turn_out_pump_on)
            if(count / 10 > 3):
                print("time out6")
                if(task.area == "1"):
                    os.add_process(command.unselect_area_1)
                elif(task.area == "2"):
                    os.add_process(command.unselect_area_2)
                elif(task.are == "3"):
                    os.add_process(command.unselect_area_3)
                os.add_process(command.turn_out_pump_off)
                count = 0
                state = ST_END_STATE
                task.cycle_num -= 1
        elif(command.data != -2):
            command.flag = 1
            command.count = 0
        else:
            print("pumping out ")
            if count >= 20*10 :
                if(task.area == "1"):
                    os.add_process(command.unselect_area_1)
                elif(task.area == "2"):
                    os.add_process(command.unselect_area_2)
                elif(task.are == "3"):
                    os.add_process(command.unselect_area_3)
                os.add_process(command.turn_out_pump_off)
                task.cycle_num -= 1
                count = 0
                state = ST_END_STATE
                command.flag = 0
    elif state == ST_END_STATE:
        if(command.data == -2 and command.flag == 0):
            if(count % 10 == 0):
                if(task.area == "1"):
                    os.add_process(command.unselect_area_1)
                elif(task.area == "2"):
                    os.add_process(command.unselect_area_2)
                elif(task.are == "3"):
                    os.add_process(command.unselect_area_3)
                os.add_process(command.turn_out_pump_off)
            if(count / 10 > 3):
                print("time out7")
                state = ST_IDLE
                count = 0
        elif(command.data != -2):
            state = ST_IDLE
            count = 0
            pass
    count += 1
    return state, task, command, count, os


class FSM:
    def __init__(self, fsm, task, command=None, count=0, os=None) -> None:
        self.state = ST_IDLE
        self.count = count
        self.fsm = fsm
        self.task = task
        self.command = Command()
        self.os = OS()

    def run_fsm(self):
        self.state, self.task, self.command, self.count, self.os = self.fsm(self.state, self.task, self.command, self.count, self.os)

#for testing
from time import sleep

os = OS()
task1 = Task("1", 5, [20, 35, 10], "2", "18:30")
class_fsm = FSM(my_fsm, task1, True)
os.add_process(class_fsm.run_fsm, 0, 1)
while True:
    os.dispatch_process()
    print(task1.cycle_num)
    sleep(0.1)