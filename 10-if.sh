#!/bin/bash

# Demo on if & if-else 

a="abcd" 

if  [ "$a" == "abc" ]; then 
    echo -e "\e[32m Both of the are equal \e[0m"
else 
     echo -e "\e[31m Both of them are not equal \e[0m"
fi 
