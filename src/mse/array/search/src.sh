#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_array_search() {
  mseLastFunctionVariablesReset

  local mseSearchValue="${1}"
  declare -n arrayName="${2}"
  local mseArrayLength="${#arrayName[@]}"

  local mseCaseSensitive=1
  local mseIgnoreGlyphs=0
  local mseCheckSubValues=0
  local mseReturnType="b"

  local isAssoc=0
  if [[ "$(declare -p ${2} 2> /dev/null)" == "declare -A"* ]]; then
    isAssoc=1
  fi


  if [ "$#" -ge "3" ] && [ "${3}" == "0" ]; then
    mseCaseSensitive=0
    mseSearchValue="${mseSearchValue^^}"
  fi

  if [ "$#" -ge "4" ] && [ "${4}" == "1" ]; then
    mseIgnoreGlyphs=1
    mseSearchValue=$(printf "${mseSearchValue}" | iconv -f 'UTF8' -t 'ASCII//TRANSLIT')
  fi

  if [ "$#" -ge "5" ] && [ "${5}" == "1" ]; then
    mseCheckSubValues=1
  fi

  if [ "$#" -ge "6" ] && [ "${6}" == "i" ]; then
    mseReturnType="${6}"
  fi





  local i
  local j
  local mseResultIndex=""
  local mseResultBool="0"
  local mseCompareValue=""


  if [ "${isAssoc}" == "0" ]; then

    for ((i=0; i<mseArrayLength; i++)); do
      mseCompareValue="${arrayName[$i]}"

      if [ "${mseCaseSensitive}" == "0" ]; then
        mseCompareValue="${mseCompareValue^^}"
      fi

      if [ "${mseIgnoreGlyphs}" == "1" ]; then
        mseCompareValue=$(printf "${mseCompareValue}" | iconv -f 'UTF8' -t 'ASCII//TRANSLIT')
      fi


      unset mseTmpArray
      declare -a mseTmpArray=("${mseCompareValue}")
      local mseTmpArrayLength=0

      if [ "${mseCheckSubValues}" == "1" ]; then
        IFS=$'\n' mseTmpArray=($(xargs -n1 <<< "${mseCompareValue}"))
      fi
      mseTmpArrayLength="${#mseTmpArray[@]}"


      for ((j=0; j<mseTmpArrayLength; j++)); do
        if [ "${mseSearchValue}" == "${mseTmpArray[$j]}" ]; then
          mseResultIndex="${i}"
          mseResultBool="1"
        fi
      done
    done

  else

    for key in "${!arrayName[@]}"; do
      mseCompareValue="${arrayName[$key]}"

      if [ "${mseCaseSensitive}" == "0" ]; then
        mseCompareValue="${mseCompareValue^^}"
      fi

      if [ "${mseIgnoreGlyphs}" == "1" ]; then
        mseCompareValue=$(printf "${mseCompareValue}" | iconv -f 'UTF8' -t 'ASCII//TRANSLIT')
      fi


      unset mseTmpArray
      declare -a mseTmpArray=("${mseCompareValue}")
      local mseTmpArrayLength=0

      if [ "${mseCheckSubValues}" == "1" ]; then
        IFS=$'\n' mseTmpArray=($(xargs -n1 <<< "${mseCompareValue}"))
      fi
      mseTmpArrayLength="${#mseTmpArray[@]}"


      for ((j=0; j<mseTmpArrayLength; j++)); do
        if [ "${mseSearchValue}" == "${mseTmpArray[$j]}" ]; then
          mseResultIndex="${key}"
          mseResultBool="1"
        fi
      done
    done
  fi



  local mseReturn
  if [ "${mseReturnType}" == "b" ]; then
    mseReturn=$(printf "%s" "${mseResultBool}")
  else
    mseReturn=$(printf "%s" "${mseResultIndex}")
  fi

  mseLastFunctionVariablesSet "${mseReturn}" 0 ""
  printf "%s" "${MSE_LAST_FUNCTION_RETURN}"
  return ${MSE_LAST_FUNCTION_ERR_CODE}
}