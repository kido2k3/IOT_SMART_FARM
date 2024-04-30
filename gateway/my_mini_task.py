from my_fsm import *
from my_os import operation_system

id = 0
class miniTask:
    def __init__(self, task, command) -> None:
        global id
        self.id = id
        id+= 1
        self.mixer = task.mixer
        self.area = task.area
        self.fsm = FSM(my_fsm, self.mixer, self.area, command)
    def __str__(self) -> str:
        return f"miniTask {self.task}"
    def run_task(self):
        global operation_system
        print("Start mini task id: ",self.id)
        operation_system.add_process(self.fsm.add)
        operation_system.add_process(self.fsm.check, 0, 1)