#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Stores the settings of the last display of a message using any of the
# "interface" functions.
declare -gA MSE_GLOBAL_SHOW_MESSAGE_CONFIG

#
# Color settings for the theme currently being used with the "interface"
# functions.
declare -gA MSE_GLOBAL_MAIN_THEME_COLORS

#
# Name of the theme to be used in the "interface" functions.
declare -g MSE_GLOBAL_THEME_NAME="mse_interface_theme_default"