#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Atualiza os módulos instalados pareando-os com os respectivos repositórios.
mse_mmod_update() {
  local mseInstallationPath="${HOME}/.config/myShellEnv"

  git --git-dir="${mseInstallationPath}" pull
}
