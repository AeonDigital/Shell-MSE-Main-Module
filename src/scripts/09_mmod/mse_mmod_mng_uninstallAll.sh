#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Remove totalmente o myShellEnv e todos os módulos atualmente instalados.
mse_mmod_mng_uninstallAll() {

  local mseCode=0
  mse_inter_showAlert "i" "MSE::${lbl_uninstall_uninstallStart}"
  mse_inter_showPrompt "" "ca" "MSE::${lbl_generic_confirmActionToProceed}" "bool" "lbl_uninstall_uninstallPromptMessage"

  if [ "${MSE_GLOBAL_PROMPT_RESULT}" == "0" ]; then
    mse_inter_showAlert "i" "MSE::${lbl_generic_actionAbortedByTheUser}"
  else
    local mseHOME=$([ ! -z "${XDG_MAIN_HOME}" ] && echo "${XDG_MAIN_HOME}" || echo "${HOME}")
    local mseInstallationPath="${mseHOME}/apps/myShellEnv"

    rm -rf "${mseInstallationPath}"
    if [ $? != 0 ]; then
      mse_inter_showAlert "e" "MSE::${lbl_uninstall_uninstallErrorRemoveDir}" "lbl_generic_scriptInterruptedError"
      mseCode=1
    else
      local mseAtualShell="${SHELL##*/}"
      local mseAtualShellRCPath="${HOME}/.${mseAtualShell,,}rc"

      #
      # Se o arquivo 'rc' do respectivo shell existir...
      # remove o trecho que efetua a leitura do MSE
      if [ -f "${mseAtualShellRCPath}" ]; then
        local mseTargetLines=$(mse_file_boundaryLineNumbers "${mseAtualShellRCPath}" "#" "0" "# [[INI-MYSHELLENV]]" "# [[END-MYSHELLENV]]")
        if [ "${mseTargetLines}" != "" ]; then
          declare -a mseArr=()
          local mseResult=$(mse_file_write "${mseAtualShellRCPath}" "mseArr" "delete" "${mseTargetLines}")
        fi
      fi


      if [ "${mseCode}" == "0" ]; then
        mse_inter_showAlert "s" "MSE::${lbl_uninstall_uninstallSuccess}"
      fi
    fi
  fi

  return $mseCode
}
MSE_GLOBAL_CMD["mng uninstallAll"]="mse_mmod_mng_uninstallAll"
