from my_serial import UART
from my_crc import CRC_MOD_BUS
from my_parameters import crc_lists
import time

class Function:

    def __init__(self) -> None:
        self.crc_calc = CRC_MOD_BUS(crc_lists)
        self.uart_connect = UART()
        self.count = 0
        self.flag = 0
    # turn mixer 1 on

    def check_timeout(self, command :str):
        while self.uart_connect.ReadSerial() == -2:
            if(self.flag == 0):
                self.uart_connect.ser.write(self.crc_calc.export(command))
                self.flag = 1
            else:
                if self.uart_connect.ReadSerial() == -2:
                    self.count += 1
                    self.flag = 0
                    if(self.count > 3):
                        print("time out")
                        self.count = 0
                        self.flag = 0
                        return
                    time.sleep(1)
                else:
                    print("success")


    def turn_mixer_1_on(self):
        self.check_timeout("MIXER1_ON")
    # turn mixer 1 off

    def turn_mixer_1_off(self):
        # self.uart_connect.ser.write(self.crc_calc.export("MIXER1_OFF"))
        self.check_timeout("MIXER1_OFF")

    # turn mixer 2 on
    def turn_mixer_2_on(self):
        # send the command to turn mixer 2 on
        # self.uart_connect.ser.write(self.crc_calc.export("MIXER2_ON"))
        self.check_timeout("MIXER2_ON")
    # turn mixer 2 off

    def turn_mixer_2_off(self):
        # send the command to turn mixer 2 on
        # self.uart_connect.ser.write(self.crc_calc.export("MIXER2_OFF"))
        self.check_timeout("MIXER2_OFF")

    # turn mixer 3 on
    def turn_mixer_3_on(self):
        # send the command to turn mixer 3 on
        # self.uart_connect.ser.write(self.crc_calc.export("MIXER3_ON"))
        self.check_timeout("MIXER3_ON")
    # turn mixer 3 off

    def turn_mixer_3_off(self):
        # send the command to turn mixer 3 on
        # self.uart_connect.ser.write(self.crc_calc.export("MIXER3_OFF"))
        self.check_timeout("MIXER3_OFF")

    # select area 1
    def select_area_1(self):
        # send the command to select area 1
        # self.uart_connect.ser.write(self.crc_calc.export("SELECTOR1_ON"))
        self.check_timeout("SELECTOR1_ON")
    # unselect area 1

    def unselect_area_1(self):
        # send the command to unselect area 1
        # self.uart_connect.ser.write(self.crc_calc.export("SELECTOR1_OFF"))
        self.check_timeout("SELECTOR1_OFF")

    # select area 2
    def select_area_2(self):
        # send the command to select area 2
        # self.uart_connect.ser.write(self.crc_calc.export("SELECTOR2_ON"))
        self.check_timeout("SELECTOR2_ON")
    # unselect area 2

    def unselect_area_2(self):
        # send the command to unselect area 2
        # self.uart_connect.ser.write(self.crc_calc.export("SELECTOR2_OFF"))
        self.check_timeout("SELECTOR2_OFF")

    # select area 3
    def select_area_3(self):
        # send the command to select area 2
        # self.uart_connect.ser.write(self.crc_calc.export("SELECTOR3_ON"))
        self.check_timeout("SELECTOR3_ON")
    # unselect area 3

    def unselect_area_3(self):
        # send the command to unselect area 1
        # self.uart_connect.ser.write(self.crc_calc.export("SELECTOR3_OFF"))
        self.check_timeout("SELECTOR3_OFF")

    # turn in_pump on
    def turn_in_pump_on(self):
        # send the command to turn in pump on
        # self.uart_connect.ser.write(self.crc_calc.export("PUMP_IN_ON"))
        self.check_timeout("PUMP_IN_ON")
    # turn in_pump off

    def turn_in_pump_off(self):
        # send the command to turn in pump off
        # self.uart_connect.ser.write(self.crc_calc.export("PUMP_IN_OFF"))
        self.check_timeout("PUMP_IN_OFF")

    # turn out_pump on
    def turn_out_pump_on(self):
        # send the command to turn in pump on
        # self.uart_connect.ser.write(self.crc_calc.export("PUMP_OUT_ON"))
        self.check_timeout("PUMP_OUT_ON")
    # turn out_pump off

    def turn_out_pump_off(self):
        # send the command to turn in pump on
        # self.uart_connect.ser.write(self.crc_calc.export("PUMP_OUT_OFF"))
        self.check_timeout("PUMP_OUT_OFF")


function_obj = Function()

# Gọi các phương thức của đối tượng Function để thực hiện các hành động

function_obj.turn_mixer_1_on()