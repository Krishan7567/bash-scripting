# verify the script is been executed as root user

USERID=$(id -u)

LOGFILE=/tmp/$component.log

# User validation; check whether the user is root user or not:

if [ $USERID -ne 0 ] ; then
    echo -e "\e[31m you must run the script as a root user or sudo previledge \e[0m"
    exit 1
fi



stat() {
    if [ $? -eq 0 ]; then
        echo -e "\e[32m Success \e[0m"
    else
        echo -e "\e[31m Failure \e[0m"
    fi    
}