#!/bin/bash

# Demo on if & if-else 

a="abcd" 

if  [ "$a" == "abc" ]; then 
    echo -e "\e[32m Both of the are equal \e[0m"
    exit 0
else 
     echo -e "\e[31m Both of them are not equal \e[0m"
     exit 1
fi 

# Demo on not equals string operator
if  [ "$b" != "abc" ]; then 
     echo -e "\e[31m Both of the are not equal \e[0m"
     exit 2
fi 

if [ -z $b ] ; then 
    echo "variable b is empty"
fi  
