#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Efetua um split na string passada em um array onde cada linha terá no máximo
# o número de caracteres informados.
# As palavras identificadas serão mantidas sem serem separadas entre as linhas.
#
# @param string $1
# String original
#
# @param int $2
# Número máximo de caracteres por linha.
# Se não for definido, ou, se inválido, usará o valor atual da variável
# "$COLUMNS".
#
# @return
# Preenche o array global 'MSE_GLOBAL_MODULE_SPLIT_RESULT' com o resultado
# do 'split' feito.
mse_str_splitInLines() {
  local mseOriginalString
  local mseMaxLineLength

  if [ $# -ge 2 ]; then
    mseOriginalString=$(mse_str_trim "${1}")

    if [ "${mseOriginalString}" != "" ]; then
      local mseCheck=$(mse_check_isInteger "${2}")
      if [ "${mseCheck}" == "0" ] || [ "${mseCheck}" -lt "1" ]; then
        mseMaxLineLength="${COLUMNS}"
      else
        mseMaxLineLength="${2}"
      fi


      #
      # Separa a string original em suas palavras
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

      for mseWord in "${MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}"; do
        mseTmpWordLength=${#mseWord}
        mseTmpLineSpaces="${#mseTmpArrayLineWords[@]}"
        ((mseTmpLineSpaces = mseTmpLineSpaces - 1))

        #
        # Quando atingir o limite máximo de caracteres por linha..
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

      unset MSE_GLOBAL_MODULE_SPLIT_RESULT
      declare -ga MSE_GLOBAL_MODULE_SPLIT_RESULT
      MSE_GLOBAL_MODULE_SPLIT_RESULT=("${mseTmpSplitArrayResult[@]}")
    fi
  fi
}
MSE_GLOBAL_CMD["str splitInLines"]="mse_str_splitInLines"




#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
test_mse_str_splitInLines_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=2
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="OriginalString :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="MaxLineLength :: o :: int"
}
