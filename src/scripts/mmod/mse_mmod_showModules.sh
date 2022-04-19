#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Escreve na tela os nomes dos módulos carregados.
mse_mmod_showModules() {

  local mseModI=0
  local mseModLength=${#MSE_GLOBAL_MODULES_NAMES[@]}

  for (( mseModI=0; mseModI<${mseModLength}; mseModI++ ));
  do
    printf "${MSE_GLOBAL_MODULES_NAMES[$mseModI]}\n"
  done
}
