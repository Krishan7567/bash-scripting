#!/bin/bash



# ````
# Colors are of 2 types `FOREGROUND` & `BACKGROUND` Color.
# Colors       Foreground          Background

# Red               31                  41
# Green             32                  42
# Yellow            33                  43
# Blue              34                  44
# Magenta           35                  45
# Cyan              36                  46
# ```

# Syntax : echo -e "\e[COLORCODEm  Your Text \e[0m"
# Syntax for backGround  
# echo -e "\e[COLORCODEm  Your Text \e[0m"

echo -e "\e[41;33m I am printing yellow \e[0m"
echo -e "\e[45;34m I am printing blue \e[0m"
echo -e "\e[36m I am printing cyan \e[0m"
echo -e "\e[32m I am printing green \e[0m"
