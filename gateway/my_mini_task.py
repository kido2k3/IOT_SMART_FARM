from my_fsm import *
from my_os import operation_system
from collections import deque
from my_parameters import *

id = 0
class miniTask:
    def __init__(self, task, command) -> None:
        global id
        self.id = id
        id+= 1
        self.cycle_num = task.cycle_num
        self.mixer = task.mixer
        self.area = task.area
        self.status = WAITING
        self.fsm = FSM(my_fsm, self, command)
    def __str__(self) -> str:
        return f"miniTask id={self.id}, cycle_num={self.cycle_num}, mixer={self.mixer}, area={self.area}, status={self.status}"
    def run_task1(self):
        global operation_system
        print("Start mini task id: ",self.id)
        operation_system.add_process(self.fsm.add)
        operation_system.add_process(self.fsm.check, 0, 1)

class miniTaskList:
    def __init__(self) -> None:
        self.mini_task_list = deque()  # Sử dụng deque thay cho list

    def is_empty(self):
        return len(self.mini_task_list) == 0

    def add(self, task: miniTask):
        self.mini_task_list.append(task)

    def remove_first(self):
        if self.is_empty() == False:
            self.mini_task_list.popleft()  # Loại bỏ phần tử đầu tiên của deque

    def __str__(self) -> str:
        string = str()
        for task in self.mini_task_list:
            string += (str(task) + '\n')
        return string

    def run_task(self):
        global operation_system
        if self.is_empty() == False:
            if self.mini_task_list[0].status == WAITING:
                print("Task id: ", self.mini_task_list[0].id)
                print("Task cycle: ", self.mini_task_list[0].cycle_num)
                self.mini_task_list[0].status = RUNNING
                operation_system.add_process(self.mini_task_list[0].fsm.add)
            elif self.mini_task_list[0].status == DONE:
                operation_system.add_process(self.mini_task_list[0].fsm.rmv)
                print("Task id: ", self.mini_task_list[0].id)
                print("Task cycle: ", self.mini_task_list[0].cycle_num)
                if self.mini_task_list[0].cycle_num == 0:
                    self.mini_task_list.popleft()
                else:
                    self.mini_task_list[0].status = WAITING
                    self.mini_task_list.rotate(-1)
        else:
            print("task list empty")

#create new file to test

# from time import sleep
# from my_mini_task import *
# from my_fsm import *
# from my_task import Task
# from my_mini_task import *
# from my_os import operation_system
# from my_fsm import command

# minilist = miniTaskList()
# task1 = Task("1", 2, [20, 35, 10], "2", "18:30")
# task2 = Task("1", 1, [20, 35, 10], "3", "18:30")
# childTask = miniTask(task1, command)
# childTask1 = miniTask(task2, command)
# minilist.add(childTask)
# minilist.add(childTask1)
# print(minilist)
# operation_system.add_process(minilist.run_task, 0, 1)

# def task_run():
#     pass

# while True:
#     operation_system.dispatch_process()
#     sleep(0.1)