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
# Stores the response typed by the user in response to the prompt.
declare -g MSE_PROMPT_RESULT=""