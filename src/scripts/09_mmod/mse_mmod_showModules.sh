#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Exibe o nome dos módulos atualmente carregados em uma lista.
mse_mmod_showModules() {
  printf "%s\n" "${MSE_GLOBAL_MODULES[@]}"
}
