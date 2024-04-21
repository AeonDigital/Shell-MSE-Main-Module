#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_str_split_inLines() {
  declare -n mseTargetArray="${1}"
  mseTargetArray=()

  if [ "$#" -ge "2" ]; then
    local mseOriginalString=$(mse_normalize_string "${2}")
    local mseMaxLineLength="${3}"
    local mseIsParagraph=$(mse_get_default "${4}" "0" "0 1")
    local mseLineRaw=""


    if [ "${mseIsParagraph}" == "1" ]; then
      local n=$'\n'
      mseOriginalString="${mseOriginalString//$n/ }"
    fi


    # If there is no defined line limit
    if [ $(mse_is_int "${mseMaxLineLength}") == "0" ] || [ "${mseMaxLineLength}" -le "-1" ]; then

      IFS=$'\n'
      while read -r mseLineRaw || [ -n "${mseLineRaw}" ]; do
        mseTargetArray+=("${mseLineRaw}")
      done <<< "${mseOriginalString}"
      IFS=$' \t\n'

    else

      if [ "${mseMaxLineLength}" == "0" ]; then
        mseMaxLineLength="${COLUMNS}"
      fi


      # split the original string into lines using the n character '\n' as a delimiter
      declare -a mseInnerArray=()
      local mseInnerLine=""

      IFS=$'\n'
      while read -r mseLineRaw || [ -n "${mseLineRaw}" ]; do
        mse_str_split_inLines_checkLine "mseInnerArray" "${mseLineRaw}" "${mseMaxLineLength}"

        for mseInnerLine in "${mseInnerArray[@]}"; do
          mseTargetArray+=("${mseInnerLine}")
        done
      done <<< "${mseOriginalString}"
      IFS=$' \t\n'

    fi
  fi
}



mse_str_split_inLines_checkLine() {
  declare -n mseTargetInnerArray="${1}"
  mseTargetInnerArray=()

  local mseTargetInnerLineOriginalString="${2}"
  local mseTargetInnerLineMaxLineLength="${3}"


  declare -a mseTargetInnerArrLineWords=()
  mse_str_split "mseTargetInnerArrLineWords" " " "${mseTargetInnerLineOriginalString}"


  local mseTmpAtualWord=""
  local mseTmpAtualWordLength="0"

  local mseTmpAtualLine=""
  local mseTmpAtualLineLength="0"
  local mseTmpAtualLineWordsLength="0"
  local mseTmpAtualLineSpacesLength="0"
  local mseTmpAtualLineInsertSpace="0"


  declare -a mseTmpArrayLineWords=()

  #
  # A alteração do "LC_CTYPE" abaixo
  # resolve a contagem de caracteres multibyte/UTF8
  local oLC_CTYPE="$LC_CTYPE"
  LC_CTYPE=""


  for mseTmpAtualWord in "${mseTargetInnerArrLineWords[@]}"; do
    mseTmpAtualWordLength="${#mseTmpAtualWord}"

    # dump the line in array before break the limit
    if ((mseTmpAtualLineLength + mseTmpAtualLineInsertSpace + mseTmpAtualWordLength > mseTargetInnerLineMaxLineLength)); then
      mseTmpAtualLine=$(mse_str_join " " "mseTmpArrayLineWords")
      mseTargetInnerArray+=("${mseTmpAtualLine}")

      mseTmpAtualLine=""
      mseTmpAtualLineLength="0"
      mseTmpAtualLineWordsLength="0"
      mseTmpAtualLineSpacesLength="0"
      mseTmpAtualLineInsertSpace="0"

      mseTmpArrayLineWords=()
    fi


    mseTmpArrayLineWords+=("${mseTmpAtualWord}")
    mseTmpAtualLineSpacesLength="${#mseTmpArrayLineWords[@]}"

    ((mseTmpAtualLineSpacesLength--))
    ((mseTmpAtualLineWordsLength += mseTmpAtualWordLength))
    ((mseTmpAtualLineLength = mseTmpAtualLineWordsLength + mseTmpAtualLineSpacesLength))

    mseTmpAtualLineInsertSpace="1"
  done

  LC_CTYPE="${oLC_CTYPE}"


  if [ "${#mseTmpArrayLineWords[@]}" -gt "0" ]; then
    mseTmpAtualLine=$(mse_str_join " " "mseTmpArrayLineWords")
    mseTargetInnerArray+=("${mseTmpAtualLine}")
  fi
}