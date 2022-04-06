import psutil
from datetime import datetime

now = datetime.now()
dt_string = now.strftime("%d/%m/%Y %H:%M:%S")

def checkIfProcessRunning(processName):
    '''
    Check if there is any running process that contains the given name processName.
    '''
    #Iterate over the all the running process
    for proc in psutil.process_iter():
        try:
            # Check if process name contains the given name string.
            if processName.lower() in proc.name().lower():
                return True
        except (psutil.NoSuchProcess, psutil.AccessDenied, psutil.ZombieProcess):
            pass
    return False

if checkIfProcessRunning('code'):
    print('Yes a VS Code process was running; ' + dt_string)
else:
    print('No VS Code process was running; ' + dt_string)

if checkIfProcessRunning('explorer'):
    print('Yes a Explorer process was running; ' + dt_string)
else:
    print('No Explorer process was running; ' + dt_string)
