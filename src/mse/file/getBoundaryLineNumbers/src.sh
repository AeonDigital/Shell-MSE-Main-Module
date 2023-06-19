#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_file_getBoundaryLineNumbers() {
  mseLastFunctionVariablesReset
  local mseReturn=""


  if [ $# -ge 5 ] && [ -f "${1}" ]; then
    local msePathToFile="${1}"
    local mseCommentChar="${2}"
    local mseConfigFile="${3}"
    local mseSectionStart="${4}"
    local mseSectionEnd="${5}"
    local mseRemoveLastEmptyLines="${6}"

    local mseFirstLine
    local mseFirstLineNumber=""

    local mseLastLine
    local mseLastLineNumber=""

    local mseRawLines


    if [ "${mseSectionStart}" == "" ]; then
      mseFirstLineNumber="1"
      mseLastLineNumber=$(mse_file_countLines "${msePathToFile}")
    else
      unset mseReadOptionsBLN
      declare -A mseReadOptionsBLN
      mse_file_prepareRead "mseReadOptionsBLN"



      if [ "${mseConfigFile}" == "1" ]; then
        mseReadOptionsBLN["block_start_check"]="mse_file_read_checkSection_start"
        mseReadOptionsBLN["block_start_check_args"]="${mseSectionStart}"
        mseReadOptionsBLN["block_start_check_args_sep"]=","
        mseReadOptionsBLN["block_start_get_first_line"]="1"

        mseReadOptionsBLN["block_end_check"]="mse_file_read_checkSection_end"
      else
        mseReadOptionsBLN["block_start_check"]="mse_file_read_checkArbitratySection_start"
        mseReadOptionsBLN["block_start_check_args"]="${mseSectionStart}"
        mseReadOptionsBLN["block_start_check_args_sep"]=""
        mseReadOptionsBLN["block_start_get_first_line"]="1"

        mseReadOptionsBLN["block_end_check"]="mse_file_read_checkArbitratySection_end"
        mseReadOptionsBLN["block_end_check_args"]="${mseSectionEnd}"
        mseReadOptionsBLN["block_end_check_args_sep"]=""
        mseReadOptionsBLN["block_end_get_last_line"]="1"
      fi



      mseRawLines=$(mse_file_read "${msePathToFile}" "mseReadOptionsBLN" 0 1)



      if [ "${mseRemoveLastEmptyLines}" == "1" ]; then
        declare -a mseNewRawLines=()
        local mseLineRaw=""


        IFS=$'\n'
        while read mseLineRaw || [ -n "${mseLineRaw}" ]; do
          mseNewRawLines+=("${mseLineRaw}")
        done <<< "${mseRawLines}"
        IFS=$' \t\n'


        local mseLength="${#mseNewRawLines[@]}"
        local mseREG='^[0-9]+[#]$'

        local mseI
        local mseLastInvalidLineIndex
        ((mseLastInvalidLineIndex=mseLength-1))

        for ((mseI=mseLastInvalidLineIndex; mseI>=0; mseI--)); do
          if [[ ! "${mseNewRawLines[$mseI]}" =~ $mseREG ]]; then
            ((mseLastInvalidLineIndex=mseI+1))
            break
          fi
        done

        mseRawLines=$(printf "%s\n" "${mseNewRawLines[@]:0:$mseLastInvalidLineIndex}")
      fi



      if [ "${mseRawLines}" != "" ]; then
        mseFirstLine="${mseRawLines%%[[:cntrl:]]*}"
        mseFirstLineNumber="${mseFirstLine%${mseCommentChar}*}"
        mseFirstLineNumber="${mseFirstLineNumber%*#}"

        mseLastLine="${mseRawLines##*[[:cntrl:]]}"
        mseLastLineNumber="${mseLastLine%${mseCommentChar}*}"
        mseLastLineNumber="${mseLastLineNumber%*#}"
      fi
    fi
  fi



  if [ "${mseFirstLineNumber}" != "" ] && [ "${mseLastLineNumber}" != "" ]; then
    mseReturn="${mseFirstLineNumber} ${mseLastLineNumber}"
  fi



  mseLastFunctionVariablesSet "${mseReturn}" 0 ""
  printf "%s" "${MSE_LAST_FUNCTION_RETURN}"
  return ${MSE_LAST_FUNCTION_ERR_CODE}
}