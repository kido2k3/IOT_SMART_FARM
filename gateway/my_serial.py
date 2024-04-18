import serial.tools.list_ports
import time

NONE = "None"


class UART:
    ser = NONE
    mess = ""

    def __init__(self) -> None:
        try:
            self.ser = serial.Serial(port=self.getPort(), baudrate=9600)
            print(self.ser)
            if self.ser == NONE:
                self.port_error = True
        except:
            self.ser = NONE
            self.port_error = True
            print("Error in serial")

    def getPort(self):
        ports = serial.tools.list_ports.comports()
        N = len(ports)
        commPort = "None"
        for i in range(0, N):
            port = ports[i]
            strPort = str(port)
            # print(strPort)
            if "USB-SERIAL CH340" in strPort:
                splitPort = strPort.split(" ")
                commPort = (splitPort[0])
        return commPort

    def ProcessData(self, data):
        pass

    def ReadSerial(self):
        pass

# # for testing
# temp = UART()
# while True:
#     temp.ReadSerial()
#     time.sleep(0.01)
