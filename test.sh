#!/usr/bin/env bash

# #Background
# for clbg in {40..47} {100..107} 49 ; do
#     #Foreground
#     for clfg in {30..37} {90..97} 39 ; do
#         #Formatting
#         for attr in 0 1 2 4 5 7 ; do
#             #Print the result
#             echo -en "\e[${attr};${clbg};${clfg}m ^[${attr};${clbg};${clfg}m \e[0m"
#         done
#         echo #Newline
#     done
# done


# for fgbg in 38 48 ; do # Foreground / Background
#     for color in {0..255} ; do # Colors
#         # Display the color
#         printf "\e[${fgbg};5;%sm  %3s  \e[0m" $color $color
#         # Display 6 colors per lines
#         if [ $((($color + 1) % 6)) == 4 ] ; then
#             echo # New line
#         fi
#     done
#     echo # New line
# done


. src/init.sh
# clear
# ls -la
# ls -la
# mse_inter_setCursorPosition top 10 l
# mse_inter_clearLine
# printf "teste"
# mse_inter_setCursorPosition bottom 1 l
# mse_inter_setCursorPosition right 0 r
# mse_inter_clearLine
# printf "##"
# mse_inter_setCursorPosition bottom 5
# mse_inter_setCursorPosition left 15
# mse_inter_clearLine r

mse_inter_showProgressBar "" "" "" "" ""   "" "" "" "" ""  "" "" "" "" ""
mse_inter_setProgressBar "0"
sleep 0.5
mse_inter_setProgressBar "1"
sleep 0.5
mse_inter_setProgressBar "2"
sleep 0.5
mse_inter_setProgressBar "3"
sleep 0.5
mse_inter_setProgressBar "4"
sleep 0.5
mse_inter_setProgressBar "5"
sleep 0.5
mse_inter_setProgressBar "10"
sleep 0.5
mse_inter_setProgressBar "15"
sleep 0.5
mse_inter_setProgressBar "20"
sleep 0.5
mse_inter_setProgressBar "25"
sleep 0.5
mse_inter_setProgressBar "50"
sleep 0.5
mse_inter_setProgressBar "75"
sleep 0.5
mse_inter_setProgressBar "100"
sleep 0.5
#  [ ################################################## ] (100%)
