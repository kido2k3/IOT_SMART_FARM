from my_serial import UART
from my_crc import CRC_MOD_BUS
from my_parameters import crc_lists

class Tasks :

    def __init__(self) -> None:
        self.crc_calc = CRC_MOD_BUS(crc_lists)
        self.ser = UART()
    # turn mixer 1 on
    def turn_mixer_1_on(self):
        # send the command to turn mixer 1 on
        self.ser.write(self.crc_calc.export("mixer1_ON"))
    # turn mixer 1 off
    def turn_mixer_1_off(self, my_serial: UART):
        my_serial.ser.write(self.crc_calc.export("mixer1_OFF"))

    # turn mixer 2 on
    def turn_mixer_2_on(self, my_serial: UART):
        # send the command to turn mixer 2 on
        my_serial.ser.write(self.crc_calc.export("mixer2_ON"))
    # turn mixer 2 off
    def turn_mixer_2_off(self, my_serial: UART):
        # send the command to turn mixer 2 on
        my_serial.ser.write(self.crc_calc.export("mixer2_OFF"))

    # turn mixer 3 on
    def turn_mixer_3_on(self, my_serial: UART):
        # send the command to turn mixer 3 on
        my_serial.ser.write(self.crc_calc.export("mixer3_ON"))
    # turn mixer 3 off
    def turn_mixer_3_off(self, my_serial: UART):
        # send the command to turn mixer 3 on
        my_serial.ser.write(self.crc_calc.export("mixer3_OFF"))

    # select area 1
    def select_area_1(self,my_serial: UART):
        # send the command to select area 1
        my_serial.ser.write(self.crc_calc.export("selector1_ON"))
    # unselect area 1
    def unselect_area_1(self, my_serial: UART):
        # send the command to unselect area 1
        my_serial.ser.write(self.crc_calc.export("selector1_OFF"))

    # select area 2
    def select_area_2(self, my_serial: UART):
        # send the command to select area 2
        my_serial.ser.write(self.crc_calc.export("selector2_ON"))
    # unselect area 2
    def unselect_area_2(self, my_serial: UART):
        # send the command to unselect area 2
        my_serial.ser.write(self.crc_calc.export("selector2_OFF"))

    # select area 3
    def select_area_3(self, my_serial: UART):
        # send the command to select area 2
        my_serial.ser.write(self.crc_calc.export("selector3_ON"))
    # unselect area 3
    def unselect_area_3(self, my_serial: UART):
        # send the command to unselect area 1
        my_serial.ser.write(self.crc_calc.export("selector3_OFF"))

    # turn in_pump on
    def turn_in_pump_on(self, my_serial: UART):
        # send the command to turn in pump on
        my_serial.ser.write(self.crc_calc.export("pump_in_ON"))
    # turn in_pump off
    def turn_in_pump_off(self, my_serial: UART):
        # send the command to turn in pump off
        my_serial.ser.write(self.crc_calc.export("pump_in_OFF"))

    # turn out_pump on
    def turn_out_pump_on(self, my_serial: UART):
        # send the command to turn in pump on
        my_serial.ser.write(self.crc_calc.export("pump_out_ON"))
    # turn out_pump off
    def turn_out_pump_off(self, my_serial: UART):
        # send the command to turn in pump on
        my_serial.ser.write(self.crc_calc.export("pump_out_OFF"))
