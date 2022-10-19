#!/bin/bash

# case $var in

#   opt1) commands ;;
#   opt2) commands ;;

# esac

ACTION=$1

case $ACTION in

    start)
        echo "Starting abc services"
        exit 0
        ;;
        
    stop)
        echo "Stoping abc services"
        exit 1
        ;;
        
    *)
        echo -e "\e[31m Valid options are either start or stop \e[0m"
        exit 2
esac


