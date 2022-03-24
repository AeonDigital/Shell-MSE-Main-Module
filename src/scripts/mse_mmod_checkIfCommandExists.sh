#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# A partir de um comando que executa um programa, identifica
# se o mesmo está disponível para uso.
#
# @param string $1
# Comando que será usado para testar a disponibilidade do programa
# É recomendado o uso de algum comando de baixo impacto como os
# típicos '-v | --version'
mse_mmod_checkIfCommandExists() {
  $1 &> /dev/null
  if [ $? == 0 ]; then printf "1"; else printf "0"; fi
}
