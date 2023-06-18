#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Runs the unit tests for this module.



#
# [string] MSE_GLOBAL_MAIN_PATH
# stores the main path where the project is installed.
unset MSE_GLOBAL_MAIN_PATH
declare -g MSE_GLOBAL_MAIN_PATH=$(dirname $(dirname $(readlink -f "${BASH_SOURCE}")))

#
# [string] MSE_GLOBAL_UTEST_MAIN_PATH
# stores the main path to the root directory of the unit test
# module.
unset MSE_GLOBAL_UTEST_MAIN_PATH
declare -g MSE_GLOBAL_UTEST_MAIN_PATH="${MSE_GLOBAL_MAIN_PATH}/Shell-MSE-UnitTest"





if [ ! -d "${MSE_GLOBAL_UTEST_MAIN_PATH}/src" ]; then
  unset mseAlertMsg
  declare -g mseAlertMsg=""
  mseAlertMsg+="\n"
  mseAlertMsg+="## Attention\n"
  mseAlertMsg+="   Could not run tests because module \"Shell-MSE-UnitTest\" was not found.\n"
  mseAlertMsg+="   Use the following commands to add and configure it:\n"
  mseAlertMsg+="   - git submodule add https://github.com/AeonDigital/Shell-MSE-UnitTest.git \n"
  mseAlertMsg+="   - git submodule set-branch --branch main -- ./Shell-MSE-UnitTest \n"
  mseAlertMsg+="   - git submodule update --remote \n"
  mseAlertMsg+="\n"
  mseAlertMsg+="   If the module \"Shell-MSE-UnitTest\" is already part of the current repository you can\n"
  mseAlertMsg+="   start it using the following commands:\n"
  mseAlertMsg+="   - git submodule init \n"
  mseAlertMsg+="   - git submodule update --remote \n"
  mseAlertMsg+="\n"

  printf "${mseAlertMsg}"
else
  #
  # Load unit test module
  . "${MSE_GLOBAL_UTEST_MAIN_PATH}/src/module.sh"



  #
  # Assets
  MSE_MD_UTEST_PATH_TO_ASSETS+=("${MSE_GLOBAL_MAIN_PATH}/src/module.sh")
  MSE_MD_UTEST_PATH_TO_ASSETS+=("${MSE_GLOBAL_MAIN_PATH}/src/functions/main/mse_main_array_search.sh")


  #
  # Register functions scripts
  utestRegisterFunctionScripts() {
    local mseFunctionName
    local mseFunctionFileFullDir
    local mseFunctionFilePath
    local mseFunctionFileFullPath
    local mseAssetFunctionsDir
    local mseSubFunctionFileFullPath

    local msePathToFunctionsDir="${MSE_GLOBAL_MAIN_PATH}/src/functions/"
    readarray -d '' mseSelectedFunctionsScriptFiles < <(find "${msePathToFunctionsDir}" -type f -name "src.sh" -print0)

    if [ "${mseSelectedFunctionsScriptFiles}" != "" ] && [ "${#mseSelectedFunctionsScriptFiles[@]}" != "0" ]; then
      for mseFunctionFileFullPath in "${mseSelectedFunctionsScriptFiles[@]}"; do
        mseFunctionFileFullDir=$(dirname "${mseFunctionFileFullPath}")
        mseFunctionFilePath="${mseFunctionFileFullDir/${msePathToFunctionsDir}/}"
        mseFunctionName="${mseFunctionFilePath//\//_}"

        if [[ "${mseFunctionName}" == *__main ]]; then
          mseFunctionName="${mseFunctionName/__main/}"
        fi

        MSE_MD_UTEST_FUNCTIONS_TO_SRC[${mseFunctionName}]="${mseFunctionFileFullPath}"


        mseAssetFunctionsDir="${mseFunctionFileFullDir}/assets/functions/"
        if [ -d "${mseAssetFunctionsDir}" ]; then
          readarray -d '' mseSelectedAssetFunctionsScriptFiles < <(find "${mseAssetFunctionsDir}" -type f -name "*.sh" -print0)
          for mseSubFunctionFileFullPath in "${mseSelectedAssetFunctionsScriptFiles[@]}"; do
            MSE_MD_UTEST_PATH_TO_ASSETS+=("${mseSubFunctionFileFullPath}")
          done
        fi
      done
    fi
  }


  #
  # Register tests scripts
  utestRegisterTestsScripts() {
    local mseFunctionName
    local mseFunctionFilePath
    local mseFunctionFileFullPath
    local msePathToFunctionsDir="${MSE_GLOBAL_MAIN_PATH}/src/functions/"
    readarray -d '' mseSelectedFunctionsScriptFiles < <(find "${msePathToFunctionsDir}" -type f -name "test.sh" -print0)

    if [ "${mseSelectedFunctionsScriptFiles}" != "" ] && [ "${#mseSelectedFunctionsScriptFiles[@]}" != "0" ]; then
      for mseFunctionFileFullPath in "${mseSelectedFunctionsScriptFiles[@]}"; do
        mseFunctionFilePath=$(dirname "${mseFunctionFileFullPath}")
        mseFunctionFilePath="${mseFunctionFilePath/${msePathToFunctionsDir}/}"
        mseFunctionName="${mseFunctionFilePath//\//_}"

        if [[ "${mseFunctionName}" == *__main ]]; then
          mseFunctionName="${mseFunctionName/__main/}"
        fi

        MSE_MD_UTEST_FUNCTIONS_TO_TEST[${mseFunctionName}]="${mseFunctionFileFullPath}"
      done
    fi
  }



  utestRegisterFunctionScripts
  utestRegisterTestsScripts

  mse_md_utest_execute "${1}"
fi