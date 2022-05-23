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

mse_inter_progressBar "#" "50" "0"
sleep 1
mse_inter_progressBar "#" "50" "1"
sleep 1
mse_inter_progressBar "#" "50" "2"
sleep 1
mse_inter_progressBar "#" "50" "3"
sleep 1
mse_inter_progressBar "#" "50" "4"
sleep 1
mse_inter_progressBar "#" "50" "5"
sleep 1
mse_inter_progressBar "#" "50" "10"
sleep 1
mse_inter_progressBar "#" "50" "15"
sleep 1
mse_inter_progressBar "#" "50" "20"
sleep 1
mse_inter_progressBar "#" "50" "25"
sleep 1
mse_inter_progressBar "#" "50" "50"
sleep 1
mse_inter_progressBar "#" "50" "75"
sleep 1
mse_inter_progressBar "#" "50" "100"
sleep 1

