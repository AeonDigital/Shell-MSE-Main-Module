#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]




#
# @desc
# Adiciona um cabeçalho.
#
# @param string $1
# Título que será escrito no cabeçalho.
#
# @param string $2
# Subtítulo que será adicionado abaixo do título.
mse_misc_setHeader() {
  # Não cor
  local mseNColor="\e[0m"
  # Cor de texto
  local mseTColor="\e[1;49;34m"
  local mseTColor2="\e[1;2;49;34m"
  # Cor do logo
  local mseLColor="\e[1;49;90m"


  local mseResult=""
  mseResult+="${mseLColor}   #   ${mseNColor}\n"
  mseResult+="${mseLColor} # #   ${mseNColor} ${mseTColor}$1${mseNColor}\n"
  mseResult+="${mseLColor} #   # ${mseNColor} ${mseTColor2}$2${mseNColor}\n"
  mseResult+="--------------------------------------------------------------------------------"

  echo -e "${mseResult}"
}
MSE_GLOBAL_CMD["set header"]="mse_misc_setHeader"
