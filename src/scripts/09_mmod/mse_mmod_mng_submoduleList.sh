#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Lista os submódulos atualmente instalados e os que estão aptos a serem
# instalados.
mse_mmod_mng_submoduleList() {
  local mseRawTable
  local mseInstalled
  local mseEnabled


  for mseKey in "${!MSE_GLOBAL_SUBMODULES_REPOSITORIES[@]}"; do
    mseInstalled=$(mse_check_hasKeyInAssocArray "${mseKey}" "MSE_AVAILABLE_MODULES")
    mseEnabled="0"

    if [ "${mseInstalled}" == "1" ] && [ "${MSE_AVAILABLE_MODULES[${mseKey}]}" == "1" ]; then
      mseEnabled="1"
    fi

    mseRawTable+="${mseKey}:${mseInstalled}:${mseEnabled}\n"
  done


  printf "\n"
  mseRawTable=$(printf "Submodule:Installed:Enabled\n${mseRawTable}")
  column -e -s ":" -t <<< "${mseRawTable}"
  printf "\n"
}
MSE_GLOBAL_CMD["mng submodule list"]="mse_mmod_mng_submoduleList"
