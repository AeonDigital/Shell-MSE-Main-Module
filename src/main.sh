#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Returns the full path of the script in which this function was evoked.
# Uses the current values of PWD and BASH_SOURCE variables.
#
# @return string
# Real path to the current script.
getRealPathToCurrentScript() {
  local mseRealPath="${PWD}"
  local mseTmpSource="${BASH_SOURCE}"
  if [ "${mseTmpSource:0:2}" == "./" ]; then mseTmpSource="${mseTmpSource:2}"; fi
  if [ "${mseTmpSource:0:1}" == "/" ]; then mseTmpSource="${mseTmpSource:1}"; fi

  local msePart=""
  while [ "${mseTmpSource}" != "" ]; do
    msePart="${mseTmpSource%%/*}"

    if [ "${msePart}" == ".." ]; then
      mseRealPath="${mseRealPath%/*}"
    else
      mseRealPath+="/${msePart}"
    fi

    if [[ "${mseTmpSource}" == *"/"* ]]; then
      mseTmpSource="${mseTmpSource#*/}"
    else
      mseTmpSource=""
    fi
  done

  if [ -f ${mseRealPath} ] || [ -d ${mseRealPath} ]; then
    echo -n "${mseRealPath}"
  else
    echo -n ""
  fi
}
#
# Returns the full path to the directory where this script is running.
# Uses the current values of PWD and BASH_SOURCE variables.
#
# @return string
# Full path to the current script directory.
getRealPathToCurrentDirectory() {
  local mseThisRealPathToCurrentScript=$(getRealPathToCurrentScript)
  echo "${mseThisRealPathToCurrentScript%/*}"
}
#
# Populates the indicated array with the full paths to the target files.
#
# @param string $1
# Name of the array to be populated.
#
# @param string $2
# Full path to the base directory from which the search will be done.
#
# @param string $3
# Type of file that is the target of this query.
# Use 'const', 'vars', 'functions', 'labels', 'src' or 'tests'
#
# @return void
getFullPathToComponentFiles() {
  declare -n mseSelectedFilePaths="${1}"
  local mseTargetDirectory="${2}"
  local mseTargetType="${3}"

  declare -a mseTmpFilePaths=()

  case "${mseTargetType}" in
    "const")
      readarray -d '' mseTmpFilePaths < <(find "${mseTargetDirectory}" -type f -path "*/const.sh" -print0)
    ;;
    "vars")
      readarray -d '' mseTmpFilePaths < <(find "${mseTargetDirectory}" -type f -path "*/vars.sh" -print0)
    ;;
    "functions")
      readarray -d '' mseTmpFilePaths < <(find "${mseTargetDirectory}" -type f -path "*/functions/*.sh" -not -name "const.sh" -and -not -name "vars.sh" -and -not -name "src.sh" -and -not -name "test.sh" -not -wholename "*/labels/*" -print0)
    ;;
    "labels")
      readarray -d '' mseTmpFilePaths < <(find "${mseTargetDirectory}" -type f -path "*/labels/${MSE_GLOBAL_MODULES_USE_LOCALE}.sh" -print0)
    ;;
    "src")
      readarray -d '' mseTmpFilePaths < <(find "${mseTargetDirectory}" -type f -path "*/src.sh" -print0)
    ;;
    "tests")
      readarray -d '' mseTmpFilePaths < <(find "${mseTargetDirectory}" -type f -path "*/tests.sh" -print0)
    ;;
  esac

  local msePathFile
  for msePathFile in "${mseTmpFilePaths[@]}"; do
    mseSelectedFilePaths+=("${msePathFile}")
  done
}
#
# Loads the scripts that are part of the attachments
#
# @param string $1
# Path to the base directory of a component and that should contain a
# subdirectory called 'attachments'.
#
# @return void
loadMyShellEnvComponentAttachments() {
  local mseReturn="1"
  local mseAlertMsg=""
  local mseTargetDirectory="${1}/attachments"


  if [ ! -d "${mseTargetDirectory}" ]; then
    mseAlertMsg+="## Attention\n"
    mseAlertMsg+="   The specified directory does not exist.\n"
    mseAlertMsg+="   Dir: \"${1}\"\n\n"
    mseAlertMsg+="   No action was taken."
  else
    declare -a mseTargetAttachmentsFilePath=()
    getFullPathToComponentFiles "mseTargetAttachmentsFilePath" "${mseTargetDirectory}" "const"
    getFullPathToComponentFiles "mseTargetAttachmentsFilePath" "${mseTargetDirectory}" "vars"
    getFullPathToComponentFiles "mseTargetAttachmentsFilePath" "${mseTargetDirectory}" "functions"
    getFullPathToComponentFiles "mseTargetAttachmentsFilePath" "${mseTargetDirectory}" "labels"

    local msePathFile
    for msePathFile in "${mseTargetAttachmentsFilePath[@]}"; do
      . "${msePathFile}"
    done

    mseReturn="0"
  fi

  if [ "${mseAlertMsg}" != "" ]; then
    echo -e "${mseAlertMsg}"
  fi

  return "${mseReturn}"
}
#
# Loads the components of the module
#
# @param string $1
# Path to the module's base directory.
#
# @return void
loadMyShellEnvModule() {
  local mseReturn="1"
  local mseAlertMsg=""
  local mseTargetDirectory="${1}"


  if [ ! -d "${mseTargetDirectory}" ]; then
    mseAlertMsg+="## Attention\n"
    mseAlertMsg+="   The specified directory does not exist.\n"
    mseAlertMsg+="   Dir: \"${1}\"\n\n"
    mseAlertMsg+="   No action was taken."
  else
    declare -a mseTargetComponentsFilePath=()
    getFullPathToComponentFiles "mseTargetComponentsFilePath" "${mseTargetDirectory}" "src"

    local msePathFile
    for msePathFile in "${mseTargetComponentsFilePath[@]}"; do
      loadMyShellEnvComponentAttachments "${msePathFile%/*}"
      . "${msePathFile}"
    done

    mseReturn="0"
  fi

  if [ "${mseAlertMsg}" != "" ]; then
    echo -e "${mseAlertMsg}"
  fi

  return "${mseReturn}"
}
#
# Load this module
myShellEnvStart() {
  local mseReturn="1"

  if [ "${MSE_GLOBAL_IS_LOADED}" == "1" ]; then
    mseReturn="0"
  else
    local mseThisDir=$(getRealPathToCurrentDirectory)
    . "${mseThisDir}/const.sh"

    if [ "${MSE_GLOBAL_IS_TO_ACTIVATE}" == "1" ]; then
      readonly MSE_GLOBAL_IS_TO_ACTIVATE
      readonly MSE_GLOBAL_MODULES_USE_LOCALE

      loadMyShellEnvComponentAttachments "${MSE_MAIN_PATH}/src"

      if [ "$?" == "0" ]; then
        loadMyShellEnvModule "${MSE_MAIN_PATH}/src/mse"

        if [ "$?" == "0" ]; then
          mseReturn="0"
          MSE_GLOBAL_IS_LOADED="1"
          readonly MSE_GLOBAL_IS_LOADED
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
executeUnitTests() {
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

    echo -n "${mseAlertMsg}"
  else
    . unittests.sh
  fi
}




case "${1,,}" in
  "")
    myShellEnvStart
  ;;
  utests)
    executeUnitTests "${2}" "${3}"
  ;;
esac