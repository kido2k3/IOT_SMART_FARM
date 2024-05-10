import time
import my_os 
import my_task
import my_fsm
if True:
    my_os.operation_system.add_process(my_task.check_waiting_task, 0, 5)
    my_os.operation_system.add_process(my_task.check_running_task, 0, 1)
    # 1 time / 5 seconds
    my_os.operation_system.add_process(my_fsm.get_humidity, 0, 500)
    my_os.operation_system.add_process(my_fsm.get_temperature, 0, 500)
    

while True:
    my_os.operation_system.dispatch_process()
    time.sleep(0.1)
