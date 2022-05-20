#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Apaga totalmente o conteúdo da linha onde o cursor está atualmente.
#
# @link
# Conheça outros códigos de controle de terminal neste local:
# http://www.climagic.org/mirrors/VT100_Escape_Codes.html
mse_inter_clearLine() {
  printf "\e[2K\r"
}
