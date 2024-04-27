from my_fsm import *
from my_os import OS

class miniTask:
    def __init__(self, task, os=None, fsm=None) -> None:
        self.mixer = task.mixer
        self.area = task.area
        self.os = OS()
        self.fsm = FSM(my_fsm, self.mixer, self.area)
    def __str__(self) -> str:
        return f"miniTask {self.task}"
    
    def run_task(self):
        self.os.add_process(self.fsm.add)
        self.os.add_process(self.fsm.check, 0, 1)
    