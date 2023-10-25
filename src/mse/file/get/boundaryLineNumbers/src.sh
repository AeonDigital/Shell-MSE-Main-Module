#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_file_get_boundaryLineNumbers() {
  local mseReturn=""


  if [ "$#" -ge "5" ] && [ -f "${1}" ]; then
    local mseTarget="${1}"
    local mseCommentChar="${2}"
    local mseIsConfigFile="${3}"
    local mseStartSection="${4}"
    local mseEndSection="${5}"
    local mseIgnoreTrailingEmptyLines="${6}"

    local mseFirstLine
    local mseFirstLineNumber=""

    local mseLastLine
    local mseLastLineNumber=""

    local mseRawLines


    if [ "${mseStartSection}" == "" ]; then
      mseFirstLineNumber="1"
      mseLastLineNumber=$(mse_file_count_lines "${mseTarget}")
    else
      unset mseReadOptionsBLN
      declare -A mseReadOptionsBLN
      mse_prepare_file_read "mseReadOptionsBLN"



      if [ "${mseIsConfigFile}" == "1" ]; then
        mseReadOptionsBLN["block_start_check"]="mse_file_read_checkSection_start"
        mseReadOptionsBLN["block_start_check_args"]="${mseStartSection}"
        mseReadOptionsBLN["block_start_check_args_sep"]=","
        mseReadOptionsBLN["block_start_get_first_line"]="1"

        mseReadOptionsBLN["block_end_check"]="mse_file_read_checkSection_end"
      else
        mseReadOptionsBLN["block_start_check"]="mse_file_read_checkArbitratySection_start"
        mseReadOptionsBLN["block_start_check_args"]="${mseStartSection}"
        mseReadOptionsBLN["block_start_check_args_sep"]=""
        mseReadOptionsBLN["block_start_get_first_line"]="1"

        mseReadOptionsBLN["block_end_check"]="mse_file_read_checkArbitratySection_end"
        mseReadOptionsBLN["block_end_check_args"]="${mseEndSection}"
        mseReadOptionsBLN["block_end_check_args_sep"]=""
        mseReadOptionsBLN["block_end_get_last_line"]="1"
      fi



      mseRawLines=$(mse_file_read "${mseTarget}" "mseReadOptionsBLN" 0 1)



      if [ "${mseIgnoreTrailingEmptyLines}" == "1" ]; then
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


        local mseL=""
        declare -a mseArrSelectedLines=()

        for mseL in "${mseNewRawLines[@]:0:$mseLastInvalidLineIndex}"; do
          mseArrSelectedLines+=("${mseL}")
        done

        mseRawLines=$(mse_array_print_inLines "mseArrSelectedLines")
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


    if [ "${mseFirstLineNumber}" != "" ] && [ "${mseLastLineNumber}" != "" ]; then
      mseReturn="${mseFirstLineNumber} ${mseLastLineNumber}"
    fi
  fi


  echo -n "${mseReturn}"
}