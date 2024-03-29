#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Atualiza os módulos instalados pareando-os com os respectivos repositórios.
mse_mmod_mng_updateAll() {

  mse_inter_showAlert "i" "MSE::${lbl_update_updateStart}"

  local mseHOME=$([ ! -z "${XDG_MAIN_HOME}" ] && echo "${XDG_MAIN_HOME}" || echo "${HOME}")
  local mseInstallationPath="${mseHOME}/apps/myShellEnv"

  git -C "${mseInstallationPath}" pull
  git -C "${mseInstallationPath}" submodule update --remote

  # comita as alterações
  git -C "${mseInstallationPath}" add .
  git -C "${mseInstallationPath}" commit -m "Updated modules and submodules"

  local mseCode=$#
  if [ "${mseCode}" == 0 ]; then
    mse_inter_showAlert "s" "MSE::${lbl_update_updateSuccess}"
  else
    local mseErrMsg=$(mse_str_replacePlaceHolder "${lbl_update_updateFail}" "ERRCODE" "${mseCode}")
    mse_inter_showAlert "f" "MSE::${mseErrMsg}"
  fi

  return $mseCode
}
MSE_GLOBAL_CMD["mng updateAll"]="mse_mmod_mng_updateAll"
