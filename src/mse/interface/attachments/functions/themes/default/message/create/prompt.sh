#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Monta toda a parte do corpo do prompt conforme as configurações
# definidas e o tema utilizado.
#
# @param string $1
# Nome do array associativo que traz as configurações para a apresentação da
# mensagem.
#
# @param string $2
# Opcional.
# Nome de um array associativo trazendo configurações não previstas
# inicialmente. Usado para expandir temas.
#
# @return
# Printa o resultado conforme as configurações passadas.
mse_interface_theme_default_message_create_prompt() {
  declare -n mseTmpThemeArrCreatePrompt="${1}"
  declare -n mseTmpThemePromptConfig="${2}"


  local msePromptExpectedValueType="${mseTmpThemePromptConfig[prompt_expected_value_type]}"
  local msePromptAllowedAssocValues="${mseTmpThemePromptConfig[prompt_allowed_assoc_values]}"


  if [ "${mseTmpThemeArrCreatePrompt[body_show]}" == "1" ] && ([ "${msePromptExpectedValueType}" == "bool" ] || [ "${msePromptExpectedValueType}" == "list" ]); then
    unset mseTmpPromptAssocValues
    unset mseTmpPromptBodyLines

    declare -n mseTmpPromptAssocValues="${msePromptAllowedAssocValues}"
    declare -a mseTmpPromptBodyLines=()

    #
    # Ordena as chaves alfabeticamente
    IFS=$'\n'
    unset mseTmpPromptSortedKeys
    declare -a mseTmpPromptSortedKeys=($(sort <<< "${!mseTmpPromptAssocValues[*]}"))
    IFS=$' \t\n'


    #
    # Identifica todos os valores válidos e monta as linhas
    # de dados que devem ser apresentadas para o usuário como guias de valores
    # válidos a serem escolhidos.
    local mseIndex
    local mseKey
    local mseTmpKeyLabels
    local mseTmpOptionLine

    local mseTmpLineLength
    local mseTmpMaxOptionLength=1

    for mseIndex in "${!mseTmpPromptSortedKeys[@]}"; do
      mseKey="${mseTmpPromptSortedKeys[${mseIndex}]}"

      mse_str_split "::" "${mseTmpPromptAssocValues[${mseKey}]}" "1"
      if [ "${#MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}" == "0" ]; then
        MSE_GLOBAL_MODULE_SPLIT_RESULT+=("${mseKey}")
      fi
      mseTmpKeyLabels=$(mse_str_join " / " "MSE_GLOBAL_MODULE_SPLIT_RESULT")

      mseTmpOptionLine="${mseKey} : [${mseTmpKeyLabels}]"
      mseTmpPromptBodyLines+=("${mseTmpOptionLine}")

      #
      # Incrementa os contadores de linhas
      mseTmpLineLength=$(wc -m <<< $mseTmpOptionLine)

      if [ "${mseTmpLineLength}" -gt "${mseTmpMaxOptionLength}" ]; then
        mseTmpMaxOptionLength="${mseTmpLineLength}"
      fi
    done



    #
    # Monta as linhas expositivas de opções de forma a focarem agradáveis de ler
    # e fáceis de serem distinguidas
    local mseMaxOptionsPerLine
    local mseTmpOptionPadLength=0
    local mseTmpOptionPadString=""
    ((mseMaxOptionsPerLine = 120 / mseTmpMaxOptionLength))

    unset mseTmpBigLine
    declare -a mseTmpBigLine=()
    declare -n mseTmpPromptBodyLinesArray="${mseTmpThemeArrCreatePrompt[body_lines]}"

    for mseTmpOptionLine in "${mseTmpPromptBodyLines[@]}"; do
      mseTmpLineLength=$(wc -m <<< $mseTmpOptionLine)
      ((mseTmpOptionPadLength = mseTmpMaxOptionLength - mseTmpLineLength))

      mseTmpOptionPadString=$(printf "%-${mseTmpOptionPadLength}s" "")
      mseTmpBigLine+=("${mseTmpOptionLine}${mseTmpOptionPadString}")

      local mseMod=$(expr ${#mseTmpBigLine[@]} % ${mseMaxOptionsPerLine}) || true
      if [ "${mseMod}" == "0" ]; then
        mseTmpPromptBodyLinesArray+=("$(mse_str_join "  |  " "mseTmpBigLine")")

        unset mseTmpBigLine
        declare -a mseTmpBigLine=()
      fi
    done


    if [ "${#mseTmpBigLine[@]}" -gt "0" ]; then
      mseTmpPromptBodyLinesArray+=("$(mse_str_join "  |  " "mseTmpBigLine")")
    fi


    #
    # Inicia a leitura na próxima linha
    mseTmpPromptBodyLinesArray+=("")
  else
    mseTmpThemeArrCreatePrompt[body_lines]=""
  fi
}