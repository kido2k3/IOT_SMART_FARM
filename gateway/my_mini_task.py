from my_fsm import *
from my_os import OS
from my_parameters import *

class miniTask:
    def __init__(self, task, fsm=None) -> None:
        self.cycle_num = task.cycle_num
        self.mixer = task.mixer
        self.area = task.area
        self.os = OS()
        self.fsm = FSM(my_fsm, self)
        self.flag = WAITING
    def __str__(self) -> str:
        return f"miniTask: cycle_num={self.cycle_num}, mixer={self.mixer}, area={self.area}"
    def run_task1(self):
        self.os.add_process(self.fsm.add)
        self.os.add_process(self.fsm.check, 0, 1)
    def add(self):
        self.os.add_process(self.fsm.add)
    def rmv(self):
        self.os.add_process(self.fsm.remove)
    def test(self):
        print("a")

class miniTaskList:
    def __init__(self) -> None:
        self.mini_task_list = []
        self.os = OS()
    def is_empty(self):
        return len(self.mini_task_list) == 0
    def add(self, minitask: miniTask):
        self.mini_task_list.append(minitask)
    def remove_first(self):
        if not self.is_empty():
            del self.mini_task_list[0]
    def __str__(self) -> str:
        string = ""
        for minitask in self.mini_task_list:
            string += str(minitask) + '\n'
        return string
    def __getitem__(self, index):
        return self.mini_task_list[index]
    def test(self):
        print("haha")
    def run_task(self):
        if not self.is_empty():
            if self.mini_task_list[0].flag == WAITING:
                self.mini_task_list[0].flag = RUNNING
                self.os.add_process(self.mini_task_list[0].add)
            elif self.mini_task_list[0].flag == DONE:
                if(self.mini_task_list[0].cycle_num == 0):
                    self.remove_first()
                else:
                    self.mini_task_list[0].flag = WAITING
                    self.mini_task_list.append(self.mini_task_list.pop(0))
                self.os.add_process(self.mini_task_list[0].rmv)
        else:
            print("No Tasks to Run")

# from my_task import *
# import time
# os = OS()
# task1 = Task("1", 5, [10, 35, 10], "2", "18:30")
# task3 = Task("3", 5, [20, 35, 10], "2", "19:00")
# task4 = Task("4", 5, [20, 35, 10], "2", "01:35")
# task2 = Task("2", 5, [20, 35, 10], "3", "18:03")
# task_list = Task_List()
# task_list.add(task1)
# task_list.add(task2)
# task_list.add(task3)
# task_list.add(task4)
# mini_task1 = miniTask(task1)
# mini_task2 = miniTask(task2)
# mini_task3 = miniTask(task3)
# mini_task4 = miniTask(task4)
# mini_task_list = miniTaskList()
# mini_task_list.add(miniTask(task1))
# mini_task_list.add(miniTask(task2))
# mini_task_list.add(miniTask(task3))
# mini_task_list.add(miniTask(task4))
# print(task_list)
# print(mini_task_list)
# os.add_process(mini_task_list.run_task,0,1)
# print(mini_task_list)
# while True:
#     os.dispatch_process()
#     time.sleep(0.1)