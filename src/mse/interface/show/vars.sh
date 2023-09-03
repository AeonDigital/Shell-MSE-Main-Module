#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Name of the theme to be used in the "interface" functions.
declare -g MSE_MESSAGE_THEME_NAME="mse_interface_theme_default"

#
# Stores the settings of the last display of a message using any of the
# "interface" functions.
declare -gA MSE_MESSAGE_THEME_CONFIG

#
# Stores the settings of the last display of a progressbar using any of the
# "interface" functions.
declare -gA MSE_PROGRESSBAR_THEME_CONFIG

#
# Stores the settings of the last display of a prompt using any of the
# "interface" functions.
declare -gA MSE_PROMPT_THEME_CONFIG

#
# Stores the user's typed response to a prompt command.
declare -g MSE_PROMPT_RESULT=""

#
# Stores the process id of the spinner so that you can terminate it later.
declare -g MSE_SPINNER_PID=""

#
# Default spinner template
declare -ga MSE_SPINNER_DEFAULT=(" / " " - " " \\ " " | ")

#
# Spinner template 'come and go'
declare -ga MSE_SPINNER_COMEANDGO=(" •      " "  •     " "   •    " "    •   " "     •  " "      • " "     •  " "    •   " "   •    " "  •     ")

#
# Spinner template 'stick star'
declare -ga MSE_SPINNER_STICK_STAR=(" ┤ " " ┘ " " ┴ " " └ " " ├ " " ┌ " " ┬ " " ┐ ")

#
# Spinner template 'thinking'
declare -ga MSE_SPINNER_THINKING=(".     " "..    " "...   " "....  " "..... ")