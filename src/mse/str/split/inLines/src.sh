#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_str_split_inLines() {
  mseLastFunctionVariablesReset


  if [ "${1}" != "" ]; then
    local mseOriginalString=$(mse_str_trim "${1}")
    local mseMaxLineLength="${2}"

    local mseCheck=$(mse_is_int "${mseMaxLineLength}")
    if [ "${mseCheck}" == "0" ] || [ "${mseCheck}" -lt "1" ]; then
      mseMaxLineLength="${COLUMNS}"
    fi

    mse_str_split " " "${mseOriginalString}"

    local mseWord=""
    local mseTmpWordLength="0"
    local mseTmpLineLength="0"
    local mseTmpLineSpaces="0"
    local mseTmpStrLine=""

    declare -a mseTmpSplitArrayResult=()
    declare -a mseTmpArrayLineWords=()

    #
    # A alteração do "LC_CTYPE" abaixo
    # resolve a contagem de caracteres multibyte/UTF8
    local oLC_CTYPE="$LC_CTYPE"
    LC_CTYPE=""

    for mseWord in "${MSE_LAST_FUNCTION_RETURN[@]}"; do
      mseTmpWordLength=${#mseWord}
      mseTmpLineSpaces="${#mseTmpArrayLineWords[@]}"
      ((mseTmpLineSpaces = mseTmpLineSpaces - 1))

      if ((mseTmpLineLength + mseTmpWordLength + mseTmpLineSpaces >= mseMaxLineLength)); then
        mseTmpStrLine=$(mse_str_join " " "mseTmpArrayLineWords")
        mseTmpSplitArrayResult+=("${mseTmpStrLine}")

        mseTmpArrayLineWords=()
        mseTmpLineLength="0"
      fi

      mseTmpArrayLineWords+=("${mseWord}")
      ((mseTmpLineLength = mseTmpLineLength + mseTmpWordLength))
    done

    LC_CTYPE="${oLC_CTYPE}"


    if [ "${#mseTmpArrayLineWords[@]}" -gt 0 ]; then
      mseTmpStrLine=$(mse_str_join " " "mseTmpArrayLineWords")
      mseTmpSplitArrayResult+=("${mseTmpStrLine}")
    fi

    unset MSE_LAST_FUNCTION_RETURN
    declare -ga MSE_LAST_FUNCTION_RETURN=("${mseTmpSplitArrayResult[@]}")
  fi

  return ${MSE_LAST_FUNCTION_ERR_CODE}
}