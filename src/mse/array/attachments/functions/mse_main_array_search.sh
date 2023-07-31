#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


# Identifies whether the indicated value exists in the target array.
#
# @param string $1
# Value being researched.
#
# @param string $2
# Name of the array where the search is to be made.
#
# @param bool $3
# Indicates whether the check should be done in "insensitive case"
#   - Omit or indicate "0" for "case sensitive" (default)
#   - Indicate "1" for "case insensitive"
#
# @param bool $4
# Indicate whether you want the comparison to be made by ignoring glyphs.
# In this case the tested values will be converted to ASCII
#   - Omit or indicate "0" to make a comparison using the actual value
#   - Enter "1" to ignore the glyphs in the comparison
#
# @param bool $5
# Indicate whether the values of the passed array should be treated as a sub
# array of values.
#   - omit or enter "0" so that the comparison is made using the full value
#     of each item (default)
#   - Enter "1" to perform the sub-value check.
#
# @param bool $6
# Expected return type.
#   - Omit or indicate "0", return only "1" or "0", indicating the presence or
#     absence of the element in the target array.
#   - Enter "1" to return the index or key name of the identified element. If
#     nothing is found, it returns an empty string "".
#
# @return
# Varies by $6 parameter
# If the $6 parameter is omitted or "0", it returns:
#   - '1' if 'true' : element found in array
#   - '0' if 'false' : element not found in array
#
# If the $6 parameter is "1"
#   - Returns the index or key name of the element if it is found.
#   - Returns "" if the element does not exist.
#
# If more than one value in the target array is compatible with the check, the
# information for the first found is returned.
mse_main_array_search() {
  local mseSearchValue="${1}"
  declare -n arrayName="${2}"
  local mseArrayLength="${#arrayName[@]}"

  local mseCaseSensitive=1
  local mseIgnoreGlyphs=0
  local mseCheckSubValues=0
  local mseReturnIndex=0

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

  if [ "$#" -ge "6" ] && [ "${6}" == "1" ]; then
    mseReturnIndex=1
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



  if [ "${mseReturnIndex}" == "1" ]; then
    printf "%s" "${mseResultIndex}"
  else
    printf "%s" "${mseResultBool}"
  fi
}