from my_parameters import *
from my_os import operation_system
from my_serial import serialUART
from my_crc import crc_calc


class Command:
    def __init__(self, data=0, flag=0):
        self.data = data
        self.flag = flag

    def read_connection(self):
        self.data = serialUART.ReadSerial()

    def turn_mixer_1_on(self):
        serialUART.ser.write(crc_calc.export("MIXER1_ON"))
        # turn mixer 1 off

    def turn_mixer_1_off(self):
        serialUART.ser.write(crc_calc.export("MIXER1_OFF"))

        # turn mixer 2 on
    def turn_mixer_2_on(self):
        serialUART.ser.write(crc_calc.export("MIXER2_ON"))
        # turn mixer 2 off

    def turn_mixer_2_off(self):
        serialUART.ser.write(crc_calc.export("MIXER2_OFF"))

        # turn mixer 3 on
    def turn_mixer_3_on(self):
        serialUART.ser.write(crc_calc.export("MIXER3_ON"))
        # turn mixer 3 off

    def turn_mixer_3_off(self):
        serialUART.ser.write(crc_calc.export("MIXER3_OFF"))

        # select area 1
    def select_area_1(self):
        serialUART.ser.write(crc_calc.export("SELECTOR1_ON"))
        # unselect area 1

    def unselect_area_1(self):
        serialUART.ser.write(crc_calc.export("SELECTOR1_OFF"))

        # select area 2
    def select_area_2(self):
        serialUART.ser.write(crc_calc.export("SELECTOR2_ON"))
        # unselect area 2

    def unselect_area_2(self):
        serialUART.ser.write(crc_calc.export("SELECTOR2_OFF"))

        # select area 3
    def select_area_3(self):
        serialUART.ser.write(crc_calc.export("SELECTOR3_ON"))
        # unselect area 3

    def unselect_area_3(self):
        serialUART.ser.write(crc_calc.export("SELECTOR3_OFF"))

        # turn in_pump on
    def turn_in_pump_on(self):
        serialUART.ser.write(crc_calc.export("PUMP_IN_ON"))
        # turn in_pump off

    def turn_in_pump_off(self):
        serialUART.ser.write(crc_calc.export("PUMP_IN_OFF"))

        # turn out_pump on
    def turn_out_pump_on(self):
        serialUART.ser.write(crc_calc.export("PUMP_OUT_ON"))
        # turn out_pump off

    def turn_out_pump_off(self):
        serialUART.ser.write(crc_calc.export("PUMP_OUT_OFF"))

command = Command()

def my_fsm(state, task, command, count, flag):
    global operation_system

    operation_system.add_process(command.read_connection, 0, 0)
    # print(flag)
    if state == ST_IDLE:
        state = ST_MIXER1
        operation_system.add_process(command.turn_mixer_1_on)
        print("state mixer1: ", task.mixer[0])
    elif state == ST_MIXER1:
        if (command.data == -2 and command.flag == 0):
            if (count % 10 == 0):
                operation_system.add_process(command.turn_mixer_1_on)
            if (count / 10 > 3):
                print("time out1")
                print("state mixer2: ", task.mixer[1])
                operation_system.add_process(command.turn_mixer_1_off)
                operation_system.add_process(command.turn_mixer_2_on)
                count = 0
                state = ST_MIXER2
        elif (command.data != -2):
            command.flag = 1
            command.count = 0
        else:
            if count >= (task.mixer[0]/SPEED)*10:
                operation_system.add_process(command.turn_mixer_1_off)
                operation_system.add_process(command.turn_mixer_2_on)
                count = 0
                state = ST_MIXER2
                command.flag = 0
                print("state mixer2: ", task.mixer[1])
    elif state == ST_MIXER2:
        if (command.data == -2 and command.flag == 0):
            if (count % 10 == 0):
                operation_system.add_process(command.turn_mixer_1_off)
                operation_system.add_process(command.turn_mixer_2_on)
            if (count / 10 > 3):
                print("time out2")
                print("state mixer3: ", task.mixer[2])
                operation_system.add_process(command.turn_mixer_2_off)
                operation_system.add_process(command.turn_mixer_3_on)
                count = 0
                state = ST_MIXER3
        elif (command.data != -2):
            command.flag = 1
            command.count = 0
        else:
            if count >= (task.mixer[1]/SPEED)*10:
                operation_system.add_process(command.turn_mixer_2_off)
                operation_system.add_process(command.turn_mixer_3_on)
                count = 0
                state = ST_MIXER3
                command.flag = 0
                print("state mixer3: ", task.mixer[2])
    elif state == ST_MIXER3:
        if (command.data == -2 and command.flag == 0):
            if (count % 10 == 0):
                operation_system.add_process(command.turn_mixer_2_off)
                operation_system.add_process(command.turn_mixer_3_on)
            if (count / 10 > 3):
                print("time out3")
                print("state pump in")
                operation_system.add_process(command.turn_mixer_3_off)
                operation_system.add_process(command.turn_in_pump_on)
                count = 0
                state = ST_PUMP_IN
        elif (command.data != -2):
            command.flag = 1
            command.count = 0
        else:
            if count >= (task.mixer[1]/SPEED)*10:
                operation_system.add_process(command.turn_mixer_3_off)
                operation_system.add_process(command.turn_in_pump_on)
                count = 0
                state = ST_PUMP_IN
                command.flag = 0
                print("state pump in")
    elif state == ST_PUMP_IN:
        if (command.data == -2 and command.flag == 0):
            if (count % 10 == 0):
                operation_system.add_process(command.turn_mixer_3_off)
                operation_system.add_process(command.turn_in_pump_on)
            if (count / 10 > 3):
                print("time out4")
                print("state selector")
                if (task.area == "1"):
                    operation_system.add_process(command.select_area_1)
                elif (task.area == "2"):
                    operation_system.add_process(command.select_area_2)
                elif (task.area == "3"):
                    operation_system.add_process(command.select_area_3)
                operation_system.add_process(command.turn_in_pump_off)
                count = 0
                state = ST_SELECTOR
        elif (command.data != -2):
            command.flag = 1
            command.count = 0
        else:
            if count >= (20)*10:
                if (task.area == "1"):
                    operation_system.add_process(command.select_area_1)
                elif (task.area == "2"):
                    operation_system.add_process(command.select_area_2)
                elif (task.area == "3"):
                    operation_system.add_process(command.select_area_3)
                operation_system.add_process(command.turn_in_pump_off)
                count = 0
                state = ST_SELECTOR
                command.flag = 0
                print("state selector")
    elif state == ST_SELECTOR:

        if (command.data == -2 and command.flag == 0):
            if (count % 10 == 0):
                if (task.area == "1"):
                    operation_system.add_process(command.select_area_1)
                elif (task.area == "2"):
                    operation_system.add_process(command.select_area_2)
                elif (task.area == "3"):
                    operation_system.add_process(command.select_area_3)
                operation_system.add_process(command.turn_in_pump_off)
            if (count / 10 > 3):
                print("time out5")
                print("state pump out")
                operation_system.add_process(command.turn_out_pump_on)
                count = 0
                state = ST_PUMP_OUT
        elif (command.data != -2):
            command.flag = 1
            command.count = 0
        else:
            operation_system.add_process(command.turn_out_pump_on)
            count = 0
            state = ST_PUMP_OUT
            command.flag = 0
            print("state pump out")
    elif state == ST_PUMP_OUT:

        if (command.data == -2 and command.flag == 0):
            if (count % 10 == 0):
                operation_system.add_process(command.turn_out_pump_on)
            if (count / 10 > 3):
                print("time out6")
                if (task.area == "1"):
                    operation_system.add_process(command.unselect_area_1)
                elif (task.area == "2"):
                    operation_system.add_process(command.unselect_area_2)
                elif (task.area == "3"):
                    operation_system.add_process(command.unselect_area_3)
                operation_system.add_process(command.turn_out_pump_off)
                count = 0
                state = ST_END_STATE
        elif (command.data != -2):
            command.flag = 1
            command.count = 0
        else:
            if count >= 20*10:
                if (task.area == "1"):
                    operation_system.add_process(command.unselect_area_1)
                elif (task.area == "2"):
                    operation_system.add_process(command.unselect_area_2)
                elif (task.area == "3"):
                    operation_system.add_process(command.unselect_area_3)
                operation_system.add_process(command.turn_out_pump_off)
                count = 0
                state = ST_END_STATE
                command.flag = 0
                task.cycle_num -= 1
    elif state == ST_END_STATE:
        if (command.data == -2 and command.flag == 0):
            if (count % 10 == 0):
                if (task.area == "1"):
                    operation_system.add_process(command.unselect_area_1)
                elif (task.area == "2"):
                    operation_system.add_process(command.unselect_area_2)
                elif (task.area == "3"):
                    operation_system.add_process(command.unselect_area_3)
                operation_system.add_process(command.turn_out_pump_off)
            if (count / 10 > 3):
                print("time out7")
                state = ST_IDLE
                task.status = DONE
                task.cycle_num -= 1
                count = 0
                flag = False
        elif (command.data != -2):
            state = ST_IDLE
            task.status = DONE
            task.cycle_num -= 1
            count = 0
            pass
    count += 1
    return state, task, command, count, flag


class FSM:
    def __init__(self, fsm, task, command, flag=True, count=0) -> None:
        self.state = ST_IDLE
        self.count = count
        self.fsm = fsm
        self.task = task
        self.command = command
        self.flag = flag

    def run_fsm(self):
        self.state, self.task, self.command, self.count, self.flag = self.fsm(
            self.state, self.task, self.command, self.count, self.flag)

    def add(self):
        global operation_system
        operation_system.add_process(self.run_fsm, 0, 1)

    def rmv(self):
        global operation_system
        operation_system.remove_process(self.run_fsm)

    def check(self):
        global operation_system
        if self.flag == False:
            operation_system.remove_process(self.run_fsm)

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
