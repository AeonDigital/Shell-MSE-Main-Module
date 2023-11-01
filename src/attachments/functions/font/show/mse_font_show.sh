#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Lists the fonts (.psf) that can be used for your terminal.
#
# @return string
# List of unique fonts sorted in ascending order
mse_font_show() {
  find /usr /etc -name "*.psf*" 2> /dev/null | sort | uniq | less
}