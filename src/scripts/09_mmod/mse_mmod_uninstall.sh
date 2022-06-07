#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Remove totalmente o myShellEnv e todos os módulos atualmente instalados.
mse_mmod_uninstall() {
  local mseCode=0
  mse_inter_alertUser "i" "MSE" "${lbl_uninstall_uninstallStart}"

  mse_inter_promptUser "" "" "${lbl_generic_confirmActionToProceed}" "lbl_uninstall_uninstallPromptMessage" "bool"

  if [ "${MSE_GLOBAL_PROMPT_RESULT}" == "0" ]; then
    mse_inter_alertUser "i" "MSE" "${lbl_generic_actionAbortedByTheUser}"
  else

    rm -rf "${HOME}/.config/myShellEnv"
    if [ $? != 0 ]; then
      mse_inter_alertUser "e" "MSE" "${lbl_uninstall_uninstallErrorRemoveDir}" "lbl_generic_scriptInterruptedError"
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
          declare -a mseArr
          local mseResult=$(mse_file_write "${mseAtualShellRCPath}" "mseArr" "delete" "${mseTargetLines}")
        fi
      fi


      if [ "${mseCode}" == "0" ]; then
        mse_inter_alertUser "s" "MSE" "${lbl_uninstall_uninstallSuccess}"
      fi
    fi
  fi

  return $mseCode
}
MSE_GLOBAL_CMD["uninstall"]="mse_mmod_uninstall"
