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
        echo "Valid options are either start or stop"

esac