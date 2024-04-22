
# the state
from my_function import Function
from time import sleep
from my_os import OS
from my_task import Task
ST_IDLE = 0
ST_MIXER1 = 1
ST_MIXER2 = 2
ST_MIXER3 = 3
ST_PUMP_IN = 4
ST_SELECTOR = 5
ST_PUMP_OUT = 6
TIMER_ONE = 4


def my_fsm(state, count):
    return state, count


class FSM:
    def __init__(self, fsm,  count=0, os=None) -> None:
        self.state = ST_IDLE
        self.count = count
        self.fsm = fsm

    def run_fsm(self):
        self.state, self.count = self.fsm(self.state, self.count)

#for testing

os = OS()
func = Function()

class_fsm = FSM(my_fsm)
os.add_process(class_fsm.run_fsm, 0, 1)
while True:
    os.dispatch_process()
    sleep(0.1)
