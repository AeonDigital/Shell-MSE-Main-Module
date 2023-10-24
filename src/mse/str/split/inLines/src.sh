#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_str_split_inLines() {
  declare -n mseTargetArray="${1}"
  mseTargetArray=()

  if [ "$#" -ge "2" ]; then
    local mseOriginalString=$(mse_str_trim "${2}")
    local mseMaxLineLength="${3}"


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


      declare -a mseArrSplit=()
      mse_str_split "mseArrSplit" " " "${mseOriginalString}"

      local mseWord=""
      local mseTmpWordLength="0"
      local mseTmpLineLength="0"
      local mseTmpLineSpaces="0"
      local mseTmpStrLine=""

      declare -a mseTmpArrayLineWords=()

      #
      # A alteração do "LC_CTYPE" abaixo
      # resolve a contagem de caracteres multibyte/UTF8
      local oLC_CTYPE="$LC_CTYPE"
      LC_CTYPE=""

      for mseWord in "${mseArrSplit[@]}"; do
        mseTmpWordLength=${#mseWord}
        mseTmpLineSpaces="${#mseTmpArrayLineWords[@]}"
        ((mseTmpLineSpaces = mseTmpLineSpaces - 1))

        if ((mseTmpLineLength + mseTmpWordLength + mseTmpLineSpaces >= mseMaxLineLength)); then
          mseTmpStrLine=$(mse_str_join " " "mseTmpArrayLineWords")
          mseTargetArray+=("${mseTmpStrLine}")

          mseTmpArrayLineWords=()
          mseTmpLineLength="0"
        fi

        mseTmpArrayLineWords+=("${mseWord}")
        ((mseTmpLineLength = mseTmpLineLength + mseTmpWordLength))
      done

      LC_CTYPE="${oLC_CTYPE}"


      if [ "${#mseTmpArrayLineWords[@]}" -gt "0" ]; then
        mseTmpStrLine=$(mse_str_join " " "mseTmpArrayLineWords")
        mseTargetArray+=("${mseTmpStrLine}")
      fi
    fi
  fi
}