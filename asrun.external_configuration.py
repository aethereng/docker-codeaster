parameters = {
    "ASTER_VERSION": "unstable",
    "IFDEF": "LINUX64",
    "MPIRUN": "mpirun -np %(mpi_nbcpu)s --hostfile %(mpi_hostfile)s %(program)s",
    "DEBUGGER_COMMAND": "/usr/bin/gdb --command=@D @E",
    "DEBUGGER_COMMAND_POST": "/usr/bin/gdb -batch --command=@D @E @C",
    "NODE": "localhost",
    "PS_COMMAND_CPU": "/bin/ps -e --width=512 -ocputime -ocommand",
    "PS_COMMAND_PID": "/bin/ps -e --width=512 -opid -ocommand",
    "TERMINAL": "/usr/bin/xterm",
}
