from my_parameters import *


class Task:
    def __init__(self, id: str, cycle_num: int, mixer: list, area: str, start_time: str) -> None:
        if len(mixer) == 3:
            self.id = id
            self.cycle_num = cycle_num
            self.mixer = mixer
            self.area = area
            self.start_time = start_time
        else:
            print("invalid mixer")

    def __str__(self) -> str:
        return f"Task {self.id}, {self.cycle_num} cycles, {self.mixer}(mixer1, 2, 3), area {self.area}, {self.start_time}"


class Task_List:
    task_list = list()

    def is_empty(self):
        return len(self.task_list) == 0

    def add(self, task: Task):
        if self.is_empty():
            self.task_list.append(task)
            return
        for i in range(0, len(self.task_list)):
            if self.task_list[i].start_time > task.start_time:
                self.task_list.insert(i, task)
                return
            if i == len(self.task_list) - 1:
                self.task_list.append(task)

    def __str__(self) -> str:
        string = str()
        for task in self.task_list:
            string += (str(task)+'\n')
        return string


waiting = Task_List()
running = Task_List()
status = WAITING


def check_waiting_task():
    # check the time of tasks in waiting list
    # if there is any in waiting list need to be run, remove that away the list, add that in running
    global waiting, running
    pass


def check_running_task():
    global running, status
# check running list is empty or not.
# If running list is not empty, run task index = 0, decrease cycle, remove and
# re-add that task if cycle is not equal 0

    pass


# for testing
# from datetime import datetime
# now = datetime.now()
# current_time = now.strftime("%H:%M")
# print("Current Time =", current_time, type(current_time))

# task1 = Task("1", 5, [20, 35, 10], "2", "18:30")
# task3 = Task("3", 5, [20, 35, 10], "2", "19:00")
# task4 = Task("4", 5, [20, 35, 10], "2", "01:35")
# task2 = Task("2", 5, [20, 35, 10], "3", "18:03")
# task_list = Task_List()
# task_list.add(task1)
# task_list.add(task2)
# task_list.add(task3)
# task_list.add(task4)
# print(task_list)
