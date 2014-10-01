#!/bin/bash
#This script takes a single parameter, the path to your uname.c code.
#Note that compiling will fail if any warnings are present.

#Define message output types
TEST="$(tput setaf 4)TEST:$(tput sgr 0)"
ERROR="$(tput setaf 1)ERROR:$(tput sgr 0)"
SUCCESS="$(tput setaf 2)SUCCESS:$(tput sgr 0)"


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
    echo "${ERROR} GCC failed to compile without warnings!"
    exit 1;
else
    echo "${TEST} GCC compiled without warnings. Good."
fi

#Generate test data
echo "${TEST} Here is the generated system data to match:"
echo "System name: $(uname -s)" | tee    systemUnameOutput.txt
echo "Host name: $(uname -n)"   | tee -a systemUnameOutput.txt
echo "OS Release: $(uname -r)"  | tee -a systemUnameOutput.txt
echo "OS Version: $(uname -v)"  | tee -a systemUnameOutput.txt
echo "CPU Type: $(uname -m)"    | tee -a systemUnameOutput.txt

#Log code's output
echo "${TEST} Here is the output of your code, $1:"
./testUname | tee testUnameOutput.txt

#Compare output of code to generated test data
diff --brief testUnameOutput.txt systemUnameOutput.txt >/dev/null
comp_value=$?  #save diff exit status

#Evaluate if code passes or fails.
if [ $comp_value -eq 1 ]
then
    echo "${ERROR} Output is different!"
    exit 1;
else
    echo "${SUCCESS} Output is the same!"
    exit 0;
fi
