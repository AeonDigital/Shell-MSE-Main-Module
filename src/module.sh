#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Starts this MSE module.
. "${BASH_SOURCE%/*}/mseLoader.sh"
. "${BASH_SOURCE%/*}/mseConst.sh"





#
# Launches the resources made available by this module
# for your shell session.
loadMyShellEnvModule() {
  local mseReturn="1"

  if [ "${MSE_GLOBAL_IS_LOADED}" == "1" ]; then
    mseReturn="0"
  else
    if [ "${MSE_GLOBAL_IS_TO_ACTIVATE}" == "1" ]; then
      readonly MSE_GLOBAL_IS_TO_ACTIVATE
      readonly MSE_GLOBAL_MODULES_USE_LOCALE

      local mseThisDir=$(getRealPathToCurrentDirectory)

      declare -a mseArrModuleSrcDir=()
      declare -a mseArrModuleAttachments=()

      retrieveModuleComponentsInDirectory "${mseThisDir}/attach" "mseArrModuleSrcDir" "mseArrModuleAttachments" "1"
      if [ "$?" == "0" ]; then
        retrieveModuleComponentsInDirectory "${mseThisDir}/mse" "mseArrModuleSrcDir" "mseArrModuleAttachments" "1"
        if [ "$?" == "0" ]; then
          mseReturn="0"
          MSE_GLOBAL_IS_LOADED="1"
          readonly MSE_GLOBAL_IS_LOADED


          local mseSrcDir
          local mseSrcFile
          local msePartialPath
          for mseSrcDir in "${mseArrModuleSrcDir[@]}"; do
            msePartialPath="${mseSrcDir/${mseThisDir}\//}"
            mseFunctionName="${msePartialPath//\//_}"

            if [[ "${mseFunctionName}" == attach_* ]]; then
              mseFunctionName="${mseFunctionName/attach_/mse_}"
            fi
            if [[ "${mseFunctionName}" == *__main ]]; then
              mseFunctionName="${mseFunctionName/__main/}"
            fi

            if [ -f "${mseSrcDir}/src.sh" ] && [ -f "${mseSrcDir}/attachments/man/${MSE_GLOBAL_MODULES_USE_LOCALE}.md" ]; then
              MSE_GLOBAL_FUNCTIONS_TO_MANUALS[${mseFunctionName}]="${mseSrcDir}/attachments/man/${MSE_GLOBAL_MODULES_USE_LOCALE}.md"
            fi
          done
        fi
      fi
    fi
  fi

  return "${mseReturn}"
}
#
# Runs the battery of defined unit tests.
#
# @param string $1
# Name of function that will be tested singly.
#
# @param bool $2
# Stop tests on the first fail.
execMyShellEnvUnitTests() {
  if [ ! -d "${MSE_GLOBAL_UTEST_MAIN_PATH}/src" ]; then
    unset mseAlertMsg
    local mseAlertMsg=""

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

    echo -en "${mseAlertMsg}"
  else
    local mseThisDir=$(getRealPathToCurrentDirectory)

    declare -a mseArrModuleSrcDir=()
    declare -a mseArrModuleAttachments=()

    retrieveModuleComponentsInDirectory "${mseThisDir}/attach" "mseArrModuleSrcDir" "mseArrModuleAttachments" "0"
    if [ "$?" == "0" ]; then
      retrieveModuleComponentsInDirectory "${mseThisDir}/mse" "mseArrModuleSrcDir" "mseArrModuleAttachments" "0"
      if [ "$?" == "0" ]; then
        . "${MSE_GLOBAL_UTEST_MAIN_PATH}/src/module.sh"

        MSE_UTEST_PATH_TO_DEPENDENCIES=("${mseArrModuleAttachments[@]}")

        local mseSrcDir
        local mseSrcFile
        local msePartialPath
        for mseSrcDir in "${mseArrModuleSrcDir[@]}"; do
          msePartialPath="${mseSrcDir/${mseThisDir}\//}"
          mseFunctionName="${msePartialPath//\//_}"

          if [[ "${mseFunctionName}" == attach_* ]]; then
            mseFunctionName="${mseFunctionName/attach_/mse_}"
          fi
          if [[ "${mseFunctionName}" == *__main ]]; then
            mseFunctionName="${mseFunctionName/__main/}"
          fi

          if [ -f "${mseSrcDir}/test.sh" ]; then
            MSE_UTEST_FUNCTIONS_TO_SRC[${mseFunctionName}]="${mseSrcDir}/src.sh"
            MSE_UTEST_FUNCTIONS_TO_TEST[${mseFunctionName}]="${mseSrcDir}/test.sh"

            if [ -f "${mseSrcDir}/src.sh" ] && [ -f "${mseSrcDir}/attachments/man/${MSE_GLOBAL_MODULES_USE_LOCALE}.md" ]; then
              MSE_GLOBAL_FUNCTIONS_TO_MANUALS[${mseFunctionName}]="${mseSrcDir}/attachments/man/${MSE_GLOBAL_MODULES_USE_LOCALE}.md"
            fi
          fi
        done

        mse_utest_execute "${1}" "${2}"
      fi
    fi
  fi
}





case "${1,,}" in
  "" | "ini" | "start")
    loadMyShellEnvModule
  ;;
  "test" | "tests" | "utest" | "utests")
    execMyShellEnvUnitTests "${2}" "${3}"
  ;;
  *)
    unset mseAlertMsg
    mseAlertMsg=""

    mseAlertMsg+="\n"
    mseAlertMsg+="##  Attention\n"
    mseAlertMsg+="    Invalid arguments.\n"
    mseAlertMsg+="\n"
    mseAlertMsg+="    - string \$1\n"
    mseAlertMsg+="      Select one of the following options:\n"
    mseAlertMsg+="      - \"\" | \"ini\" | \"start\"\n"
    mseAlertMsg+="        Load the MSE components to this shell session.\n"
    mseAlertMsg+="      - \"test\" | \"tests\" | \"utest\" | \"utests\"\n"
    mseAlertMsg+="        Runs the unit tests.\n"
    mseAlertMsg+="\n"
    mseAlertMsg+="    - string \$2 [ Only for unit tests. ]\n"
    mseAlertMsg+="      Name of function that will be tested singly.\n"
    mseAlertMsg+="      If left blank, all tests will run.\n"
    mseAlertMsg+="\n"
    mseAlertMsg+="    - string \$3 [ Only for unit tests. ]\n"
    mseAlertMsg+="      Stop tests on the first fail."
    mseAlertMsg+="\n"

    echo -en "${mseAlertMsg}"
  ;;
esac