#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Move o cursor 1 linha para cima e de volta ao início da linha.
#
# @link
# Conheça outros códigos de controle de terminal neste local:
# http://www.climagic.org/mirrors/VT100_Escape_Codes.html
mse_inter_toTopLine() {
  printf "\e[1A\r"
}
