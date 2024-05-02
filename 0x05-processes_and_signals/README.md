# Processes and signals

## PID

- A PID is a unique identification number assigned to each process when it is created.
- Processes are executing instances of programs.
- The process "init" always has a PID of 1 and is the ancestor of all other processes.
- PIDs are non-negative integers, and very large PIDs don't necessarily mean there are that many processes.
- PIDs are not immediately reused to prevent errors.
- The default maximum value of PIDs is 32,767, which limits the number of simultaneous processes on a system.
- The "pid_max" file in Linux specifies the value at which PIDs wrap around, with a default of 32,768.
- The maximum number of processes on a system is limited by the amount of available physical memory (RAM).

#### `ps` Command

The `ps` command provides various options to filter and customize the output. Here are some basic examples:

- To display the PIDs and process names of all processes owned by the current user:
  ```bash
  ps -u $USER -o pid,cmd
  ```
  output
  ```
  PID   CMD
  1234  bash
  5678  python3 script.py
  ```

- To show detailed information about a specific process using its PID:
  ```bash
  ps -p <PID> -o pid,ppid,user,%cpu,%mem,cmd
  ```
  Replace `<PID>` with the actual PID of the process you want to inspect.
  ```
  PID  PPID USER     %CPU %MEM CMD
  5678  4321 user     0.2  1.5   python3 script.py
  ```

- To sort the processes based on CPU usage:
  ```bash
  ps -e --sort=-%cpu -o pid,cmd,%cpu
  ```
  ```
  PID CMD        %CPU
  5678 python3    10.5
  1234 bash        2.3
  ```

#### `pstree` Command

The `pstree` command can be further customized to control the level of detail and formatting. Here are a few examples:

- To display the process tree with the full command-line arguments:
  ```bash
  pstree -p
  ```
  ```
  init(1)─┬─systemd(1001)─┬─gnome-terminal-(1234)───bash(5678)───python3(9101)
        │               ├─evolution(2345)
        │               ├─gnome-shell(3456)
        │               └─...
  ```

- To limit the depth of the process tree to a specific level:
  ```bash
  pstree -l 3
  ```
  This will display the process tree up to 3 levels deep.

#### `top` Command

The `top` command provides interactive real-time information about processes. Here are some additional options and examples:

- To sort the processes based on memory usage:
  ```bash
  top -o %MEM
  ```
  ```
  PID   CMD        %MEM
  5678  python3    10.5
  1234  bash        2.3
  ```

- To display a specific number of processes in the top output:
  ```bash
  top -n 10
  ```
  This will show the top 10 processes based on resource usage.

- To highlight the processes owned by a specific user:
  ```bash
  top -u <username>
  ```
  Replace `<username>` with the actual username of the user you want to monitor.

#### `pidof` Command

The `pidof` command can be used in various scenarios to retrieve PIDs. Here are some examples:

- To check if a specific program is running:
  ```bash
  if pidof <program_name> >/dev/null; then echo "Program is running"; else echo "Program is not running"; fi
  ```
  Replace `<program_name>` with the name of the program you want to check.

- To terminate a program using `pidof` and `kill` together:
  ```bash
  kill $(pidof <program_name>)
  ```
  Replace `<program_name>` with the name of the program you want to terminate.

#### `kill` Command

The `kill` command supports different signals to control the termination behavior. Here are a few examples:

- To terminate a process by sending the TERM signal (the default signal):
  ```bash
  kill <PID>
  ```

- To forcefully terminate a process by sending the KILL signal:
  ```bash
  kill -9 <PID>
  ```
  This is useful when a process is unresponsive to the TERM signal.

- To gracefully terminate a process by sending the INT signal (similar to pressing Ctrl+C):
  ```bash
  kill -2 <PID>
  ```
#### proc file
- The `/proc` filesystem contains kernel data that represents information about processes in real-time.
- The `/proc` directory contains numbered directories, with each directory corresponding to a PID (Process Identification Number) currently running on the system.
- The `cat` command can be used to read the contents of files within the `/proc` directory.
- The `cmdline` file within a specific PID directory contains the command name, options, and arguments used to start the process.
- Accessing files within the `/proc` directory may require administrative privileges. The `su` command can be used to switch to the root (administrative) account to read these files.
- The `status` file within a PID directory provides more detailed information about the process it represents. For example, the `status` file for PID 1 (/proc/1/status) contains extensive information about the `init` process.

## Environment List

There are two ways in which we can access a process environment:

1. Through the global variable ‘extern char **extern‘

2. Through the third argument to the main() function ‘char *envp[]’

- ISO C specifies that the main() function to be written with only two arguments.

#### example
```c
#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>

extern char **environ;

int main(int argc, char *argv[])
{
  int count = 0;

  printf("\n");
  while(environ[count] != NULL)
  {
    printf("[%s] :: ", environ[count]);
    count++;
  }

  char *val = getenv("USER");
  printf("\n\nCurrent value of environment variable USER is [%s]\n",val);

  if(setenv("USER","Arora",1))
  {
    printf("\n setenv() failed\n");
    return 1;
  }

  printf("\n Successfully Added a new value to existing environment variable USER\n");

  val = getenv("USER");
  printf("\nNew value of environment variable USER is [%s]\n",val);

  while(1)
  {
    sleep(2);
  }
  return 0;
}
```

## What are Linux signals?

signal is an event generated by the UNIX and Linux systems in response to some condition. Upon receipt of a signal, a process may take action.

A signal is just like an interrupt; when it is generated at the user level, a call is made to the kernel of the OS, which then acts accordingly.

There are two types of signals:

- Maskable: signals which can be changed or ignored by the user (e.g., Ctrl+C).

- Non-Maskable: signals which cannot be changed or ignored by the user. These typically occur when the user is signaled for non-recoverable hardware errors.

#### Setup man Page for Signals

First install man-db package to install man pages. For this purpose use the following command:
```bash
apt-get install man-db
```
To get a complete table with a summary of the meaning of each signal, use the following command:
```bash
man 7 signal
```

#### Table for Signals

| Signal  | Description                                                                           |
|---------|---------------------------------------------------------------------------------------|
| SIGHUP  | Hangup signal. It is typically sent to a process when its controlling terminal is closed or the session leader terminates.                                     |
| SIGINT  | Interrupt signal. It is sent to a process by the terminal driver when the user presses the interrupt key (usually Ctrl+C).                                  |
| SIGQUIT | Quit signal. It is similar to SIGINT but is typically triggered by the user pressing the quit key (usually Ctrl+\), causing the process to generate a core dump. |
| SIGFPE  | Floating-point exception signal. It is raised when a floating-point arithmetic exception occurs, such as division by zero or an invalid operation.                |
| SIGKILL | Kill signal. It is used to forcefully terminate a process. Unlike other signals, the process cannot catch or ignore SIGKILL.                                 |
| SIGTERM | Termination signal. It is a general-purpose signal used to request the termination of a process. It allows the process to perform cleanup operations before exiting. |
| SIGALRM | Alarm signal. It is typically used to schedule a process to receive a signal after a specified amount of time has passed.                                      |

## More About Process Management
### Types of Processes in Linux

- Foreground Processes
depend on the user for input
also referred to as interactive processes

- Background Processes
run independently of the user
referred to as non-interactive or automatic processes

### Process States in Linux

Process States:

- Running
A process in running state means that it is running or it’s ready to run.

- Sleeping
The process is in a sleeping state when it is waiting for a resource to be available.
    - Interruptible sleep
    - Uninterruptible sleep
      A process in Interruptible sleep will wakeup to handle signals, whereas a process in Uninterruptible sleep will not.
      
- Stopped
A process enters a stopped state when it receives a stop signal.

- Zombie
state is when a process is dead but the entry for the process is still present in the table.

## More Commands

### ps

The `ps` command is used to display information about currently running processes. It provides a snapshot of the processes running on the system at the time the command is executed. It can show various details such as process IDs (PIDs), CPU and memory usage, process hierarchy, and more.

Example: Display the PIDs and process names of all processes owned by the current user.
```
$ ps -u $USER -o pid,cmd
```

### pgrep

The `pgrep` command is used to search for processes based on their names or other attributes and retrieve their PIDs. It allows you to find processes by specifying a pattern or criteria, making it useful for automating process-related tasks or obtaining information about specific processes.

Example: Find the PID of a process named "apache2".
```
$ pgrep apache2
```

### pkill

The `pkill` command is used to send signals to processes based on their names or other attributes. It allows you to terminate or manipulate multiple processes at once by specifying a pattern or criteria. By default, `pkill` sends the SIGTERM signal, but you can specify a different signal if needed.

Example: Terminate all processes with the name "python3".
```
$ pkill python3
```

### kill

The `kill` command is used to send signals to processes. It can be used to terminate or manipulate individual processes by specifying their PIDs. By default, `kill` sends the SIGTERM signal, but you can specify a different signal if needed.

Example: Send the SIGKILL signal to terminate a process with PID 1234.
```
$ kill -9 1234
```

### exit

The `exit` command is used to exit the current shell or terminate a script. It is commonly used to gracefully end a shell session or to indicate the end of a script execution.

Example: Exit the current shell session.
```
$ exit
```

### trap

The `trap` command is used to specify actions to be taken when a signal is received. It allows you to define signal handlers that control how a script or shell session responds to specific signals.

Example: Define a trap that executes a cleanup function when the script receives the SIGINT signal (Ctrl+C).
```bash
#!/bin/bash

cleanup() {
    echo "Performing cleanup..."
    # Cleanup actions here
}

trap cleanup SIGINT

# Rest of the script
# ...
```
