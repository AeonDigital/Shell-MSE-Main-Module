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

      declare -a mseArrModuleSrc=()
      declare -a mseArrModuleAttachments=()

      retrieveModuleComponents "${mseThisDir}" "mseArrModuleSrc" "mseArrModuleAttachments"
      if [ "$?" == "0" ]; then
        local mseAttachFile
        for mseAttachFile in "${mseArrModuleAttachments[@]}"; do
          . "${mseAttachFile}"
        done

        local mseSrcDir
        for mseSrcDir in "${mseArrModuleSrc[@]}"; do
          . "${mseSrcDir}/src.sh"
        done

        mseReturn="0"
        MSE_GLOBAL_IS_LOADED="1"
        readonly MSE_GLOBAL_IS_LOADED
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

    echo -n "${mseAlertMsg}"
  else
    local mseThisDir=$(getRealPathToCurrentDirectory)

    declare -a mseArrModuleSrc=()
    declare -a mseArrModuleAttachments=()

    retrieveModuleComponents "${mseThisDir}" "mseArrModuleSrc" "mseArrModuleAttachments"
    echo "iniciando testes"
    #. "${MSE_GLOBAL_UTEST_MAIN_PATH}/src/module.sh"
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

    echo -e "${mseAlertMsg}"
  ;;
esac