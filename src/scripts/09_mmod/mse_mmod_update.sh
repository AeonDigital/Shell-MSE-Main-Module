#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Atualiza os módulos instalados pareando-os com os respectivos repositórios.
mse_mmod_update() {
  mse_inter_alertUser "i" "MSE" "${lbl_update_updateStart}"

  local mseInstallationPath="${HOME}/.config/myShellEnv"
  git -C "${mseInstallationPath}" pull

  local mseCode=$#
  if [ "${mseCode}" == 0 ]; then
    mse_inter_alertUser "s" "MSE" "${lbl_update_updateSuccess}"
  else
    local mseErrMsg=$(mse_str_replacePlaceHolder "${lbl_update_updateFail}" "ERRCODE" "${mseCode}")
    mse_inter_alertUser "f" "MSE" "${mseErrMsg}"
  fi

  return $mseCode
}