Uname
=====

> Print out system information.

##Goal

Your goal is to modify uname.c to print out more system information.  
Your program's output must match the following format.  

```
System name: Linux
Host name: newCS
OS Release: 3.13.0-36-generic
OS Version: #63-Ubuntu SMP Wed Sep 3 21:30:07 UTC 2014
CPU Type: x86_64
```

( The output for your system is generated with the `uname` command. See [test.sh](test.sh). )

##Testing

To test if your code meets the output requirements, use the `test.sh` script.

```
./test.sh uname.c
SUCCESS: Output is the same!
```

##uname()

Find information on `uname()` in section 2 of the man pages.

`man -S2 uname`
