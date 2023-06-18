#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# This file is responsible for performing environment checks and starting
# the module itself.


# GLOBAL CONTROL VARIABLES

#
# [bool] MSE_GLOBAL_CAN_ACTIVATE
# Indicates whether MSE modules should be started.
if [ -z ${MSE_GLOBAL_CAN_ACTIVATE+x} ]; then
  declare -g MSE_GLOBAL_CAN_ACTIVATE="1"
fi

#
# [bool] MSE_GLOBAL_IS_LOADED
# Indicates when all "myShellEnv" modules (excepts UTEST) are loaded.
if [ -z ${MSE_GLOBAL_IS_LOADED+x} ]; then
  declare -g MSE_GLOBAL_IS_LOADED="0"
fi

#
# [string] MSE_GLOBAL_MODULES_USE_LOCALE
# Indicates the default locale to be used by modules.
# By default, it will use "en-us"
if [ -z ${MSE_GLOBAL_MODULES_USE_LOCALE+x} ]; then
  declare -g MSE_GLOBAL_MODULES_USE_LOCALE="en-us"
fi

#
# [string] MSE_GLOBAL_MAIN_PATH
# stores the main path where the project is installed.
unset MSE_GLOBAL_MAIN_PATH
declare -g MSE_GLOBAL_MAIN_PATH=$(dirname $(dirname $(readlink -f "${BASH_SOURCE}")))





#
# Loads all components of the target module.
#
# @param string $1
# Full path to the root directory of the target module.
myShellEnvRegisterModuleComponents() {
  local mseReturn=0
  local mseAlertMsg=""

  if [ "$#" -lt "1" ] || [ "${1}" == "" ]; then
      mseReturn=1

      mseAlertMsg+="## Attention\n"
      mseAlertMsg+="   No directory specified.\n\n"
      mseAlertMsg+="   No action was taken."
  else
    if [ ! -d "${1}" ]; then
      mseReturn=1

      mseAlertMsg+="## Attention\n"
      mseAlertMsg+="   The specified directory does not exist.\n"
      mseAlertMsg+="   Dir: \"${1}\"\n\n"
      mseAlertMsg+="   No action was taken."
    else

      local moduleSH="${1}/src/module.sh"
      if [ ! -f "${moduleSH}" ]; then
        mseReturn=1

        mseAlertMsg+="## Attention\n"
        mseAlertMsg+="   \"module.sh\" file not found for target module.\n"
        mseAlertMsg+="   Expected location: \"${moduleSH}\"\n\n"
        mseAlertMsg+="   No action was taken."
      else
        . "${moduleSH}"

        local mseFunctionFileFullDir
        local mseAssetFunctionsDir
        local mseSubFunctionFileFullPath

        local mseTargetFunctions=$(find "${1}/src/functions" -type f -name "src.sh")
        for fileFunction in "${mseTargetFunctions}"; do
          . "${fileFunction}"

          mseFunctionFileFullDir=$(dirname "${fileFunction}")
          mseAssetFunctionsDir="${mseFunctionFileFullDir}/assets/functions/"
          if [ -d "${mseAssetFunctionsDir}" ]; then
            readarray -d '' mseSelectedAssetFunctionsScriptFiles < <(find "${mseAssetFunctionsDir}" -type f -name "*.sh" -print0)
            for mseSubFunctionFileFullPath in "${mseSelectedAssetFunctionsScriptFiles[@]}"; do
              . "${mseSubFunctionFileFullPath}"
            done
          fi
        done
      fi
    fi
  fi


  if [ "${mseAlertMsg}" != "" ]; then
    printf "${mseAlertMsg}\n"
  fi

  return ${mseReturn}
}



#
# Start "myShellEnv".
myShellEnvStart() {
  local mseReturn=1

  if [ "${MSE_GLOBAL_IS_LOADED}" == "1" ]; then
    mseReturn=0
  else
    myShellEnvRegisterModuleComponents "${MSE_GLOBAL_MAIN_PATH}"
    if [ $? == 0 ]; then
      mseReturn=0
      MSE_GLOBAL_IS_LOADED="1"
    fi
  fi

  return ${mseReturn}
}