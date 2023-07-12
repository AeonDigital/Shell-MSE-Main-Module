#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Assembles a separator according to the information passed.
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
mse_interface_theme_default_message_create_separator() {
  if [ "${2}" != "" ]; then
    local mseReturn=""

    if [ "${5}" == "1" ]; then
      mseReturn+="${3}"
    fi

    mseReturn+="${2}"
    if [ "${5}" == "1" ]; then
      mseReturn+="${mseNONE}"
    fi

    printf "${mseReturn}"
  fi
}