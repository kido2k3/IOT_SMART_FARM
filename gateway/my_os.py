class Process:
    def __init__(self, func, delay, period) -> None:
        self.func = func
        self.delay = delay
        self.period = period
    def __str__(self) -> str:
        return f"{self.func.__name__} {self.delay} {self.period}"
        

class OS:
    wait_queue = list()
    def is_empty(self):
        return (len(self.wait_queue) == 0)
    def add_process(self, func, delay, period):
        process = Process(func, delay, period)
        if self.is_empty():
            self.wait_queue.append(process)
            return
        for i in range(0, len(self.wait_queue)):
            if self.wait_queue[i].delay <= process.delay:
                process.delay -= self.wait_queue[i].delay
                if i == len(self.wait_queue) - 1:
                    self.wait_queue.append(process)
            else:
                self.wait_queue[i].delay -= process.delay
                self.wait_queue.insert(i, process)
                return
    def dispatch_process(self):
        if self.is_empty():
            print("there is no process in queue")
            return
        while self.wait_queue[0].delay == 0:
            self.wait_queue[0].func()
            if self.wait_queue[0].period != 0:
                func = self.wait_queue[0].func
                delay = self.wait_queue[0].period
                period = self.wait_queue[0].period
                self.add_process(func, delay, period)
                self.wait_queue.pop(0)
        self.wait_queue[0].delay -= 1

    def __str__(self) -> str:
        string = str()
        for process in self.wait_queue:
            string += (str(process) + '\n')
        return string
    
# for testing
import time
def printA():
    print("A")
def printB():
    print("B")
def printC():
    print("C")
def printD():
    print("D")
queue = OS()
queue.add_process(printA, 3,3)
queue.add_process(printB, 4,2)
cnt = 0
print(queue)
while True:
    print("#", cnt)
    queue.dispatch_process()
    time.sleep(1)
    cnt += 1