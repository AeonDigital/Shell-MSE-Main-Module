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
# Por padrão a comparação é feita em case sensitive.
# Indica "1" se a comparação deve ser feita em case insensitive
# Use "0" para comparação case sensitive (padrão, diferencia "a" de "A").
# Use "1" para comparação case insensitive.
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
  local mseUsePromptCaseInsensitive="${6}"



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
    ;;
  esac


  #
  # Ajusta o case de comparação
  if [ "${mseUsePromptCaseInsensitive}" == "" ] || ([ "${mseUsePromptCaseInsensitive}" != "0" ] && [ "${mseUsePromptCaseInsensitive}" != "1" ]); then
    mseUsePromptCaseInsensitive="0"
  fi



  #
  # Processa a coleção de valores e legendas válidas
  local msePromptKey
  local msePromptLabel
  declare -A mseTmpAllowedUserAssocEntries
  if [ "${mseUsePromptAssocValues}" != "" ]; then
    declare -n mseTmpAllowedAssocEntries="${mseUsePromptAssocValues}"

    for msePromptKey in "${!mseTmpAllowedAssocEntries[@]}"; do
      if [ "${mseUsePromptCaseInsensitive}" == "0" ]; then
        mseTmpAllowedUserAssocEntries["${msePromptKey}"]="${msePromptKey}"
      else
        mseTmpAllowedUserAssocEntries["${msePromptKey^^}"]="${msePromptKey}"
      fi

      mse_str_split "::" "${mseTmpAllowedAssocEntries[${msePromptKey}]}" "1"
      if [ "${#MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}" -gt "0" ]; then
        for msePromptLabel in "${MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}"; do
          if [ "${mseUsePromptCaseInsensitive}" == "0" ]; then
            mseTmpAllowedUserAssocEntries["${msePromptLabel}"]="${msePromptKey}"
          else
            mseTmpAllowedUserAssocEntries["${msePromptLabel^^}"]="${msePromptKey}"
          fi
        done
      fi

    done
  fi




  #
  # Monta o array associativo contendo as configurações extras para o prompt
  unset mseExtraConfigAssocArrayName
  declare -A mseExtraConfigAssocArrayName
  mseExtraConfigAssocArrayName["prompt_expected_value_type"]="${mseUsePromptValueType}"
  mseExtraConfigAssocArrayName["prompt_allowed_assoc_values"]="${mseUsePromptAssocValues}"

  unset mseUsePromptBodyLines
  declare -a mseUsePromptBodyLines=()



  #
  # Processa o corpo da mensagem
  local msePromptUserMessage
  local msePromptUserValue
  local msePromptUserValueCompare
  #msePromptUserMessage=$(mse_inter_showMessage "${mseUsePromptMetaAssoc}" "${mseUsePromptMetaType}" "prompt" "${mseUsePromptTitleString}" "mseUsePromptBodyLines" "mseExtraConfigAssocArrayName")

  mse_inter_showMessage "${mseUsePromptMetaAssoc}" "${mseUsePromptMetaType}" "prompt" "${mseUsePromptTitleString}" "mseUsePromptBodyLines" "mseExtraConfigAssocArrayName"

  #
  # Espera do usuário uma resposta válida
  # while [ "${MSE_GLOBAL_PROMPT_RESULT}" == "" ]; do
  #   #
  #   # Se está chegando aqui novamente significa que o valor digitado é inválido
  #   # mostra uma mensagem de erro para o usuário
  #   if [ "${msePromptUserValue}" != "" ]; then
  #     local mseErrMsg=$(mse_str_replacePlaceHolder "${lbl_inter_prompt_invalidValue}" "VALUE" "${msePromptUserValue}")
  #     mse_inter_showError "X::${mseErrMsg}"
  #   fi

  #   #
  #   # Mostra a mensagem e permite ao usuário digitar uma resposta
  #   read -r -p "${msePromptUserMessage}" msePromptUserValue


  #   #
  #   # Ajusta o case conforme o tipo de comparação que deve ser feito
  #   msePromptUserValueCompare="${msePromptUserValue}"
  #   if [ "${mseUsePromptCaseInsensitive}" == "1" ]; then
  #     msePromptUserValueCompare="${msePromptUserValue^^}"
  #   fi


  #   #
  #   # Valida o valor digitado
  #   if [ "${mseUsePromptValueType}" == "bool" ] || [ "${mseUsePromptValueType}" == "list" ]; then
  #     for msePromptKey in "${!mseTmpAllowedUserAssocEntries[@]}"; do
  #       echo "==${msePromptUserValueCompare} == ${msePromptKey}=="
  #       if [ "${msePromptUserValueCompare}" == "${msePromptKey}" ]; then
  #         MSE_GLOBAL_PROMPT_RESULT="${mseTmpAllowedUserAssocEntries[${msePromptKey}]}"
  #       fi
  #     done
  #   else
  #     MSE_GLOBAL_PROMPT_RESULT="${msePromptUserValue}"
  #   fi
  # done








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
