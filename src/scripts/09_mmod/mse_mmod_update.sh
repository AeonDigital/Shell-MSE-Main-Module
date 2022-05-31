#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Atualiza os módulos instalados pareando-os com os respectivos repositórios.
mse_mmod_update() {
  local mseInstallationPath="${HOME}/.config/myShellEnv"


  git -C "${mseInstallationPath}" pull
  local mseCode=$#
  if [ "${mseCode}" == 0 ]; then
    mse_inter_alertUser "s" "MSE" "All repositories has been updated"
  else
    mse_inter_alertUser "f" "MSE" "An unexpected failure occurred and the repositories could not be updated [ ${mseCode} ]"
  fi
}
