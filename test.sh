#!/bin/bash
#This script takes a single parameter, the path to your uname.c code.
#Note that compiling will fail if any warnings are present.

#Check command line arguments
if [ "$#" -ne 1 ]; then
    echo "Error: $0 takes one argument, the C code to compile."
    return 1;
fi

#Remove old executable
rm testUname 2> /dev/null

#Compile C code, fail on warnings
gcc -Wall -Wextra -Werror -Wfatal-errors $1 -o testUname
gcc_result=$? #save gcc exit status
if [ $gcc_result -ne 0 ]; then
    echo "ERROR: GCC failed to compile without warnings!"
    exit 1;
fi

#Generate test data
echo "System name: $(uname -s)"  > UnameOutput.txt
echo "Host name: $(uname -n)"   >> UnameOutput.txt
echo "OS Release: $(uname -r)"  >> UnameOutput.txt
echo "OS Version: $(uname -v)"  >> UnameOutput.txt
echo "CPU Type: $(uname -m)"    >> UnameOutput.txt

#Compare output of code to generated test data
diff --brief <(./testUname) UnameOutput.txt >/dev/null
comp_value=$?  #save diff exit status

#Evaluate if code passes or fails.
if [ $comp_value -eq 1 ]
then
    echo "WARNING: Output is different!"
    exit 1;
else
    echo "SUCCESS: Output is the same!"
    exit 0;
fi
