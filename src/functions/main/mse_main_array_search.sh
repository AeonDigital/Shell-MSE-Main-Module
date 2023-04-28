#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_main_array_search() {
  local mseSearchValue="${1}"
  declare -n arrayName="${2}"
  local mseArrayLength="${#arrayName[@]}"

  local mseCaseInsensitive
  local mseReturnIndex


  mseCaseInsensitive=0
  if [ "$#" -ge "3" ] && [ "$3" == "1" ]; then
    mseCaseInsensitive=1
  fi

  mseReturnIndex=0
  if [ "$#" -ge "4" ] && [ "$4" == "1" ]; then
    mseReturnIndex=1
  fi


  local isAssoc=$(mse_is_assoc "${2}")


  local i
  local mseResultIndex=""
  local mseResultBool=0

  if [ "${isAssoc}" == "0" ]; then
    if [ "${mseCaseInsensitive}" == "0" ]; then
      for ((i=0; i<mseArrayLength; i++)); do
        if [ "${arrayName[$i]}" == "${mseSearchValue}" ]; then
          mseResultIndex="$i"
          mseResultBool="1"
          break
        fi
      done
    elif [ "${mseCaseInsensitive}" == "1" ]; then
      for ((i=0; i<mseArrayLength; i++)); do
        if [ "${arrayName[$i]^^}" == "${mseSearchValue^^}" ]; then
          mseResultIndex="$i"
          mseResultBool="1"
          break
        fi
      done
    fi
  else
    if [ "${mseCaseInsensitive}" == "0" ]; then
      for key in "${!arrayName[@]}"; do
        if [ "${arrayName[$key]}" == "${mseSearchValue}" ]; then
          mseResultIndex="$key"
          mseResultBool="1"
          break
        fi
      done
    elif [ "${mseCaseInsensitive}" == "1" ]; then
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
