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
