#!/bin/bash

# case $var in

#   opt1) commands ;;
#   opt2) commands ;;

# esac

ACTION=$1

case $ACTION in

    start)
        echo "Starting abc services"
        ;;
    stop)
        echo "Stoping abc services"
        ;;
    *)
        echo -e "\e[31m Valid options are either start or stop \e[0m"

esac


