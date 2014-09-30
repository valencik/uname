#!/bin/bash

gcc -Wall $1 -o testUname

./genTest.sh > UnameOutput.txt

diff --brief <(./testUname) UnameOutput.txt >/dev/null
comp_value=$?  #Look at diff exit status

if [ $comp_value -eq 1 ]
then
    echo "WARNING: Output is different!"
    exit 1;
else
    echo "SUCCESS: Output is the same!"
    exit 0;
fi
