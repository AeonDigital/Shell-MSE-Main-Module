#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_array_search() {
  local mseSearchValue="${1}"
  declare -n arrayName="${2}"
  local mseArrayLength="${#arrayName[@]}"

  local mseCaseSensitive=$(mse_getDefault "${3}" "1" "0 1")
  local mseIgnoreGlyphs=$(mse_getDefault "${4}" "0" "0 1")
  local mseCheckSubValues=$(mse_getDefault "${5}" "0" "0 1")
  local mseReturnType=$(mse_getDefault "${6}" "b" "b i")

  if [ "${mseCaseSensitive}" == "0" ]; then
    mseSearchValue="${mseSearchValue^^}"
  fi

  if [ "${mseIgnoreGlyphs}" == "1" ]; then
    mseSearchValue=$(mse_str_remove_glyphs "${mseSearchValue}")
  fi


  local i
  local j
  local mseResultIndex=""
  local mseResultBool="0"
  local mseCompareValue=""



  if [ $(mse_is_assoc "${2}") == "0" ]; then

    for ((i=0; i<mseArrayLength; i++)); do
      mseCompareValue="${arrayName[${i}]}"

      if [ "${mseCaseSensitive}" == "0" ]; then
        mseCompareValue="${mseCompareValue^^}"
      fi

      if [ "${mseIgnoreGlyphs}" == "1" ]; then
        mseCompareValue=$(mse_str_remove_glyphs "${mseCompareValue}")
      fi


      unset mseTmpArray
      declare -a mseTmpArray=("${mseCompareValue}")
      local mseTmpArrayLength="0"

      if [ "${mseCheckSubValues}" == "1" ]; then
        mse_str_convert_toArray "mseTmpArray" "${mseCompareValue}"
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
        mseCompareValue=$(mse_str_remove_glyphs "${mseCompareValue}")
      fi


      unset mseTmpArray
      declare -a mseTmpArray=("${mseCompareValue}")
      local mseTmpArrayLength="0"

      if [ "${mseCheckSubValues}" == "1" ]; then
        mse_str_convert_toArray "mseTmpArray" "${mseCompareValue}"
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



  if [ "${mseReturnType}" == "b" ]; then
    echo -n "${mseResultBool}"
  else
    echo -n "${mseResultIndex}"
  fi
}