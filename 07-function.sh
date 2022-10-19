#!/bin/bash

#declaring a function

sample() {
    echo "I am a function named sample"
}

#calling function sample

#sample

#sample
#sample

stat() {
    echo "Load average on the system is $(uptime | awk -F : '{print $NF}' | awk -F , '{print $1}')"
    echo "Number of user signed in is : $(who |wc -l)"
    echo "Stat is completed"
}

stat