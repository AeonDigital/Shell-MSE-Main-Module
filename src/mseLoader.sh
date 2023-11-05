#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Provides functions required to launch MSE-compatible modules.



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
# Full path to the directory from which the search will be done.
#
# @param string $2
# Name of the array to be populated.
#
# @param string $3
# Type of file that is the target of this query.
# Use 'src', 'const', 'vars', 'functions', 'labels', 'man' or 'test'
#
# @return void
getFullPathToComponentFiles() {
  local mseTargetDirectory="${1}"
  local mseTargetArrayName="${2}"
  local mseTargetType="${3}"

  declare -n mseSelectedFilePaths="${mseTargetArrayName}"
  declare -a mseTmpFilePaths=()

  case "${mseTargetType}" in
    "src")
      readarray -d '' mseTmpFilePaths < <(find "${mseTargetDirectory}" -type f -path "*/src.sh" -print0)
    ;;
    "const")
      readarray -d '' mseTmpFilePaths < <(find "${mseTargetDirectory}" -type f -path "*/const.sh" -print0)
    ;;
    "vars")
      readarray -d '' mseTmpFilePaths < <(find "${mseTargetDirectory}" -type f -path "*/vars.sh" -print0)
    ;;
    "functions")
      readarray -d '' mseTmpFilePaths < <(find "${mseTargetDirectory}" -type f -path "*/functions/*.sh" -not -name "src.sh" -and -not -name "const.sh" -and -not -name "vars.sh" -and -not -name "test.sh" -not -wholename "*/labels/*" -print0)
    ;;
    "labels")
      readarray -d '' mseTmpFilePaths < <(find "${mseTargetDirectory}" -type f -path "*/labels/${MSE_GLOBAL_MODULES_USE_LOCALE}.sh" -print0)
    ;;
    "man")
      readarray -d '' mseTmpFilePaths < <(find "${mseTargetDirectory}" -type f -path "*/man/${MSE_GLOBAL_MODULES_USE_LOCALE}.md" -print0)
    ;;
    "test")
      readarray -d '' mseTmpFilePaths < <(find "${mseTargetDirectory}" -type f -path "*/test.sh" -print0)
    ;;
  esac

  local msePathFile
  for msePathFile in "${mseTmpFilePaths[@]}"; do
    mseSelectedFilePaths+=("${msePathFile}")
  done
}





#
# Scans the target directory for MSE function components.
#
# Populate the indicated arrays with the information pertinent to
# each type of data.
#
# @param string $1
# Full path to the directory of a component or module.
#
# @param string $2
# Name of the 'src' array to be populated.
#
# This array will be populated with the path of the directory in which there
# is an 'src.sh' file referring to a function provided by the module.
#
# @param string $3
# Name of the 'attachments' array to be populated.
#
# @param bool $4
# Set to '1' to load components immediately.
#
# @return void
retrieveModuleComponentsInDirectory() {
  local mseReturn="0"
  local mseMessage=""
  local mseTargetDirectory="${1}"
  declare -n mseArrTmpModuleSrc="${2}"
  declare -n mseArrTmpModuleAttachments="${3}"
  local mseLoadNow="${4}"


  if [ ! -d "${mseTargetDirectory}" ]; then
    mseReturn="1"
    mseMessage="Target component directory does not exists [ "${mseTargetDirectory}" ]"
  else
    # Retrieve attachments
    getFullPathToComponentFiles "${mseTargetDirectory}" "mseArrTmpModuleAttachments" "const"
    getFullPathToComponentFiles "${mseTargetDirectory}" "mseArrTmpModuleAttachments" "vars"
    getFullPathToComponentFiles "${mseTargetDirectory}" "mseArrTmpModuleAttachments" "functions"
    getFullPathToComponentFiles "${mseTargetDirectory}" "mseArrTmpModuleAttachments" "labels"

    # Retrieve src
    unset mseTmpArrSrc
    declare -a mseTmpArrSrc=()
    getFullPathToComponentFiles "${mseTargetDirectory}" "mseTmpArrSrc" "src"

    local mseI
    local mseFile

    for mseI in "${!mseTmpArrSrc[@]}"; do
      mseFile="${mseTmpArrSrc[${mseI}]}"
      mseArrTmpModuleSrc+=("${mseFile%/*}")
    done


    if [ "${mseLoadNow}" == "1" ]; then
      local mseAttachFile
      for mseAttachFile in "${mseArrTmpModuleAttachments[@]}"; do
        . "${mseAttachFile}"
      done

      local mseSrcDir
      for mseSrcDir in "${mseArrTmpModuleSrc[@]}"; do
        . "${mseSrcDir}/src.sh"
      done
    fi
  fi


  if [ "${mseMessage}" != "" ]; then
    echo -e "${mseMessage}"
  fi

  return "${mseReturn}"
}