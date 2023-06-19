#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_main_array_search() {
  local mseSearchValue="${1}"
  declare -n arrayName="${2}"
  local mseArrayLength="${#arrayName[@]}"

  local mseCaseSensitive=1
  local mseReturnIndex=0


  if [ "$#" -ge "3" ] && [ "${3}" == "0" ]; then
    mseCaseSensitive=0
  fi

  if [ "$#" -ge "4" ] && [ "${4}" == "1" ]; then
    mseReturnIndex=1
  fi


  local isAssoc=$(mse_is_assoc "${2}")


  local i
  local mseResultIndex=""
  local mseResultBool=0

  if [ "${isAssoc}" == "0" ]; then
    if [ "${mseCaseSensitive}" == "1" ]; then
      for ((i=0; i<mseArrayLength; i++)); do
        if [ "${arrayName[$i]}" == "${mseSearchValue}" ]; then
          mseResultIndex="$i"
          mseResultBool="1"
          break
        fi
      done
    elif [ "${mseCaseSensitive}" == "0" ]; then
      for ((i=0; i<mseArrayLength; i++)); do
        if [ "${arrayName[$i]^^}" == "${mseSearchValue^^}" ]; then
          mseResultIndex="$i"
          mseResultBool="1"
          break
        fi
      done
    fi
  else
    if [ "${mseCaseSensitive}" == "1" ]; then
      for key in "${!arrayName[@]}"; do
        if [ "${arrayName[$key]}" == "${mseSearchValue}" ]; then
          mseResultIndex="$key"
          mseResultBool="1"
          break
        fi
      done
    elif [ "${mseCaseSensitive}" == "0" ]; then
      for key in "${!arrayName[@]}"; do
        if [ "${arrayName[$key]^^}" == "${mseSearchValue^^}" ]; then
          mseResultIndex="$key"
          mseResultBool="1"
          break
        fi
      done
    fi
  fi



  if [ "${mseReturnIndex}" == "1" ]; then
    printf "%s" "${mseResultIndex}"
  else
    printf "%s" "${mseResultBool}"
  fi
}
