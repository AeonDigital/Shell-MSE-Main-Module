#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Assembles a bullet according to the information passed.
#
# @param string $1
# Message type.
#
# @param string $2
# String to use.
#
# @param string $3
# Code of the color to use.
#
# @param string $4
# Alternate color code to use.
#
# @param bool $5
# Indicates whether to use the indicated colorization.
# Use "0" for no.
# Use "1" for yes.
#
# @return
# Prints the result according to the settings passed.
mse_interface_theme_default_message_create_bullet() {
  mse_interface_theme_default_message_create_separator "${1}" "${2}" "${3}" "${4}" "${5}"
}