#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]



# FAZER A FUNÇÃO 'PREPARE' PARA ESTA ... ADAPTAR E PERMITIR QUE O TEMA GERE AS
# PECULIARIDADES DA AMOSTRAGEM.



#
# @desc
# Mostra uma mensagem para o usuário e permite que ele ofereça uma resposta.
#
# O resultado selecionado/digitado pelo usuário ficará definido na variável
# global 'MSE_GLOBAL_PROMPT_RESULT'.
#
#
# @param string $1
# Nome do array associativo que traz as configurações para a apresentação da
# mensagem.
# Se "" ou inválido, será iniciado o array associativo
# "MSE_GLOBAL_SHOW_PROMPT_CONFIG" usando o tema padrão e este será usado para
# a formatação da mensagem.
#
#
# @param string $2
# Tipo de mensagem.
#
# [[ Mensagens de Prompt ]]
#
#   - friendly  | fr  : Amigável. Questão sem muita importância.
#   - ordinary  | or  : Comum. Questão padrão.
#   - caution   | ca  : Cuidado. Questão que exige atenção do usuário ou que
#                       tenha potencial de alguma alteração permanente.
#   - important | im  : Importante. Questão com potencial de causar alteração
#                       permanente no processamento do script ou no próprio PC
#
#
# @param string $3
# Título da mensagem.
#
#
# @param string $4
# Informe o tipo de valor que é esperado como resposta do prompt.
# Se nenhum valor for informado, ou, se informado um valor inválido,
# usará o tipo 'value'.
#
# Os tipos válidos são:
#   - bool  : espera uma resposta booleana [ sim|não ]
#   - list  : espera uma resposta baseada em uma lista pré-definida.
#   - value : aceita qualquer resposta como válida.
#
#
# @param string $5
# Nome de um array associativo. Usado para o tipo de retorno 'list'.
#   - key   : Valores que serão efetivamente definidos pela ação do usuário.
#   - value : Coleção de strings que podem ser usadas para representar este
#             valor. Use "::" para separar cada valor.
#
# O valor selecionado ficará armazenado na variável global
# 'MSE_GLOBAL_PROMPT_RESULT'.
#
# Se o valor deste parametro for inválido o prompt será convertido para o
# tipo 'value'.
#
#
# @param bool $6
# Indica se a comparação deve ser feita em case insensitive.
# Use "0" para não (padrão, diferencia "a" de "A").
# Use "1" para sim.
#
#
# @return
# Printa na tela a mensagem indicada conforme configuração passada.
mse_inter_showPrompt() {
  MSE_GLOBAL_PROMPT_RESULT=""

  local mseUsePromptMetaAssoc="${1}"
  local mseUsePromptMetaType="${2}"
  local mseUsePromptTitleString="${3}"
  local mseUsePromptValueType="${4}"
  local mseUsePromptAssocValues="${5}"

  unset mseUsePromptBodyLines
  declare -a mseUsePromptBodyLines=()

  #
  # Verifica se o nome do array associativo passado é válido
  # Não sendo, seleciona o array global
  if [ "${mseUsePromptMetaAssoc}" == "" ] || [[ ! "$(declare -p ${mseUsePromptMetaAssoc} 2> /dev/null)" =~ "declare -A" ]]; then
    mseUsePromptMetaAssoc="MSE_GLOBAL_SHOW_PROMPT_CONFIG"
  fi


  #
  # Verifica se há um tipo passado e se ele é válido
  unset mseAllowedPromptMetaTypes
  declare -a mseAllowedPromptMetaTypes=("none" "friendly" "fr" "ordinary" "or" "caution" "ca" "important" "im")
  if [[ ! "${mseAllowedPromptMetaTypes[*]}" =~ "${mseUsePromptMetaType}" ]]; then
    mseUsePromptMetaType="ordinary"
  fi


  #
  # Se não há um título definido, usa o padrão "?"
  if [ "${mseUsePromptTitleString}" == "" ]; then
    mseUsePromptTitleString="?"
  fi


  #
  # Conforme o tipo de valor esperado
  case "${mseUsePromptValueType}" in
    bool)
      mseUsePromptAssocValues="lbl_inter_showPrompt_BoolValues"
    ;;

    list)
      if [[ ! "$(declare -p ${mseUsePromptAssocValues} 2> /dev/null)" =~ "declare -A" ]]; then
        mseUsePromptValueType="value"
        mseUsePromptAssocValues=""
      fi
    ;;

    *)
      mseUsePromptValueType="value"
      mseUsePromptAssocValues=""

      unset mseUsePromptBodyLines
      mseUsePromptBodyLines=""
    ;;
  esac


## PARECE QUE ISTO, AGORA, TEM QUE IR PARA O "THEME"
  #
  # Monta as informações de opções válidas para o usuário
  if [ "${mseUsePromptValueType}" == "bool" ] || [ "${mseUsePromptValueType}" == "list" ]; then
    unset mseTmpPromptAssocValues
    unset mseTmpPromptBodyLines

    declare -n mseTmpPromptAssocValues="${mseUsePromptAssocValues}"
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
    local mseTmpMaxOptionLength=0

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



    local mseMaxOptionsPerLine
    local mseTmpOptionPadLength=0
    local mseTmpOptionPadString=""
    ((mseMaxOptionsPerLine = 120 / mseTmpMaxOptionLength))

    unset mseTmpBigLine
    declare -a mseTmpBigLine=()

    for mseTmpOptionLine in "${mseTmpPromptBodyLines[@]}"; do
      mseTmpLineLength=$(wc -m <<< $mseTmpOptionLine)
      ((mseTmpOptionPadLength = mseTmpMaxOptionLength - mseTmpLineLength))

      mseTmpOptionPadString=$(printf "%-${mseTmpOptionPadLength}s" "")
      mseTmpBigLine+=("${mseTmpOptionLine}${mseTmpOptionPadString}")

      local mseMod=$(expr ${#mseTmpBigLine[@]} % ${mseMaxOptionsPerLine}) || true
      if [ "${mseMod}" == "0" ]; then
        mseUsePromptBodyLines+=("$(mse_str_join "  |  " "mseTmpBigLine")")

        unset mseTmpBigLine
        declare -a mseTmpBigLine=()
      fi
    done


    if [ "${#mseTmpBigLine[@]}" -gt "0" ]; then
      mseUsePromptBodyLines+=("$(mse_str_join "  |  " "mseTmpBigLine")")
    fi
  fi




  #
  # Monta o corpo da mensagem
  mse_inter_showMessage "${mseUsePromptMetaAssoc}" "${mseUsePromptMetaType}" "prompt" "${mseUsePromptTitleString}" "mseUsePromptBodyLines"










  # #
  # # Identifica o tema a ser usado
  # local mseTheme="${MSE_GLOBAL_THEME_NAME}"
  # if [ "${8}" != "" ]; then
  #   mseTheme="${8}"
  # fi



  # local msePromptUserMessage
  # local msePromptUserValue
  # msePromptUserMessage=$(mse_inter_showMessage "${mseArgs[MessageType]}" "${mseArgs[MessageFormat]}" "" "" "" "${mseArgs[TitleType]}" "" "" "" "" "" "${mseArgs[TitleCode]}::${mseArgs[TitleText]}" "" "" "" "" "" "" "" "" "" "" "" "" "${mseArgs[BodyMessageArrayName]}" "" "" "" "" "" "${mseTheme}" || echo "${MSE_GLOBAL_PROMPT_RESULT}")
  # while [ "${MSE_GLOBAL_PROMPT_RESULT}" == "" ]; do
  #   #
  #   # Se está chegando aqui novamente significa que o valor digitado é inválido
  #   # mostra uma mensagem de erro para o usuário
  #   if [ "${msePromptUserValue}" != "" ]; then
  #     local mseErrMsg=$(mse_str_replacePlaceHolder "${lbl_inter_prompt_invalidValue}" "VALUE" "${msePromptUserValue}")
  #     mse_inter_showError "X" "${mseErrMsg}"
  #   fi

  #   #
  #   # Mostra a mensagem e permite ao usuário digitar uma resposta
  #   read -r -p "${msePromptUserMessage}" msePromptUserValue

  #   #
  #   # Valida o valor digitado
  #   if [ "${msePromptValueType}" == "bool" ] || [ "${msePromptValueType}" == "list" ]; then
  #     for mseIndex in "${!msePromptLabelArrayName[@]}"; do
  #       mseLabel="${msePromptLabelArrayName[$mseIndex]}"
  #       mseValue="${msePromptValueArrayName[$mseIndex]}"

  #       if [ "${msePromptUserValue^^}" == "${mseLabel^^}" ] || [ "${msePromptUserValue^^}" == "${mseValue^^}" ]; then
  #         MSE_GLOBAL_PROMPT_RESULT="${mseValue}"
  #       fi
  #     done
  #   else
  #     MSE_GLOBAL_PROMPT_RESULT="${msePromptUserValue}"
  #   fi
  # done

  # #
  # # Remove a linha de opções do array alvo
  # if [ "${msePromptValueType}" == "bool" ] || [ "${msePromptValueType}" == "list" ]; then
  #   unset 'mseBodyMessageArrayName[-1]'
  # fi

  # printf "\n"
}





#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_inter_promptUser_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=8
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="MessageType :: r :: list"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0_labels"]="ordinary, friendly, caution, important"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0_values"]="or, fr, ca, im"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="TitleCode :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="TitleText :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_3"]="BodyMessageArrayName :: r :: arrayName"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_4"]="PromptValueType :: r :: list"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_4_labels"]="bool, list, value"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_4_values"]="bool, list, value"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_5"]="PromptLabelArrayName :: r :: arrayName"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_6"]="PromptValueArrayName :: r :: arrayName"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_7"]="Theme :: o :: functionName"
}
