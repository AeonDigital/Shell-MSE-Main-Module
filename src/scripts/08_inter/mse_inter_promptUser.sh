#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Mostra uma mensagem para o usuário e permite que ele ofereça uma resposta.
#
# O resultado selecionado/digitado pelo usuário ficará definido na variável
# global 'MSE_GLOBAL_PROMPT_RESULT'.
#
# @param string $1
# Tom de mensagem de prompt.
# Se não for definido usará o tipo "ordinary"
#
#   Mensagens de Prompt
#
#   - friendly  | fr  : Amigável. Questão sem muita importância.
#   - ordinary  | or  : Comum. Questão padrão.
#   - caution   | ca  : Cuidado. Questão que exige atenção do usuário ou que
#                       tenha potencial de alguma alteração permanente.
#   - important | im  : Importante. Questão com potencial de causar alteração
#                       permanente no processamento do script ou no próprio PC
#
# @param string $2
# Código da mensagem.
# Se não for definido, usará o caracter "?".
#
# @param string $3
# Título da mensagem.
# Use para orientar o usuário sobre a resposta requerida.
#
# @param string $4
# Nome de um array unidimensional em que estão as frases que devem
# ser usadas para montar o corpo da mensagem.
#
# @param string $5
# Informe o tipo de valor que é esperado como resposta do prompt.
# Se nenhum valor for informado, usará o tipo 'bool'.
#
# Os tipos válidos são:
# - bool  : espera uma resposta booleana [ sim|não ]
# - list  : espera uma resposta baseada em uma lista pré-definida.
# - value : aceita qualquer resposta como válida.
#
# @param string $6
# Legendas de valores aceitáveis. Usado para o tipo 'list'.
# Indique o nome de um array unidimensional em que estão os valores que servem
# de referencia para o usuário selecionar uma opção válida.
# A comparação se dará de forma case insensitive.
#
# @param string $7
# Valores reais aceitáveis. Usado para o tipo 'list'.
# Indique o nome de um array unidimensional em que estão os valores reais
# correspondentes a cada legenda informada acima.
# Internamente,
#
# O valor selecionado irá ficar armazenado na variável global
# 'MSE_GLOBAL_PROMPT_RESULT'.
#
# @param string $8
# Opcional.
# Nome do tema usado para renderizar a mensagem a ser mostrada na tela.
# Se nenhuma for indicada, usará o tema padrão definido na variável global
# 'MSE_GLOBAL_THEME_NAME'.
#
# @return
# Printa na tela as informações desejadas conforme configuração passada.
#
# @example
#   mseArr=("Selecione o estado pela sigla")
#   mseArrLabels=(rs sc pr)
#   mseArrValues=("Rio Grande do Sul" "Santa Catarina" "Paraná")
#   mse_inter_promptUser "" "" "Qual o seu estado?" "mseArr" "list" "mseArrLabels" "mseArrValues"
#
#   printf "${MSE_GLOBAL_PROMPT_RESULT}"
mse_inter_promptUser() {

  MSE_GLOBAL_LASTERR=""
  MSE_GLOBAL_PROMPT_RESULT=""


  #
  # Apenas se todos os parametros foram passados
  if [ $# -lt 5 ]; then
    local mseArgs="$#"
    local mseLost
    ((mseLost=5-mseArgs))

    MSE_GLOBAL_LASTERR=$(mse_str_replacePlaceHolder "${lbl_err_lostParameters}" "LOST" "${mseLost}")
    return 1
  else

    declare -A mseArgs
    mseArgs["MessageType"]="${1}"
    mseArgs["MessageFormat"]="DEFAULTFORMAT"
    mseArgs["TitleType"]="3"
    mseArgs["TitleCode"]="${2}"
    mseArgs["TitleText"]="${3}"
    mseArgs["BodyMessageArrayName"]="${4}"

    declare -a mseTmpLines=()
    declare -n mseBodyMessageArrayName


    #
    # Verifica o tipo da mensagem
    if [ "${1}" == "" ]; then
      mseArgs["MessageType"]="or"
    fi

    #
    # Verifica o código da mensagem
    if [ "${2}" == "" ]; then
      mseArgs["TitleCode"]="?"
    fi

    #
    # Verifica a mensagem
    if [ "${3}" == "" ]; then
      mseArgs["TitleText"]="?"
    fi

    #
    # Mostrará o corpo da mensagem caso existam informações no array indicado
    if [ "${4}" == "" ]; then
      mseArgs["MessageFormat"]="TITLE"
    else
      #
      # Verifica se o nome do array passado é válido
      if [[ ! "$(declare -p ${4} 2> /dev/null)" =~ "declare -a" ]]; then
        MSE_GLOBAL_LASTERR=$(mse_str_replacePlaceHolder "${lbl_err_paramA_MustBeAnArray}" "PARAM_A" "BodyMessageArrayName")
        return 1
      else
        mseBodyMessageArrayName="${4}"
      fi
    fi



    #
    # Verifica o tipo do prompt
    local msePromptValueType="bool"
    declare -n msePromptLabelArrayName
    declare -n msePromptValueArrayName
    case "${5}" in
      bool | list | value)
        msePromptValueType="${5}"

        if [ "${5}" == "bool" ]; then
          msePromptLabelArrayName="lbl_inter_prompt_boolLabels"
          msePromptValueArrayName="lbl_inter_prompt_boolValues"
        elif [ "${5}" == "list" ]; then
          mseArgs["MessageFormat"]="DEFAULTFORMAT"

          if [ "${4}" == "" ]; then
            mseArgs["BodyMessageArrayName"]="mseTmpLines"
            mseBodyMessageArrayName="mseTmpLines"
          fi
        fi
      ;;
    esac



    #
    # Sendo um prompt do tipo 'list', verifica se existem
    # informações definidas nos arrays de chave/valor
    if [ "${msePromptValueType}" == "list" ]; then
      if [ "${6}" == "" ] || [[ ! "$(declare -p ${6} 2> /dev/null)" =~ "declare -a" ]]; then
        MSE_GLOBAL_LASTERR=$(mse_str_replacePlaceHolder "${lbl_err_paramA_MustBeAnArray}" "PARAM_A" "PromptLabelArrayName")
        return 1
      elif [ "${7}" == "" ] || [[ ! "$(declare -p ${7} 2> /dev/null)" =~ "declare -a" ]]; then
        MSE_GLOBAL_LASTERR=$(mse_str_replacePlaceHolder "${lbl_err_paramA_MustBeAnArray}" "PARAM_A" "PromptValueArrayName")
        return 1
      else
        msePromptLabelArrayName="${6}"
        msePromptValueArrayName="${7}"

        if [ "${#msePromptLabelArrayName[@]}" == 0 ]; then
          MSE_GLOBAL_LASTERR=$(mse_str_replacePlaceHolder "${lbl_err_paramA_IsAnEmptyArray}" "PARAM_A" "PromptLabelArrayName")
          return 1
        elif [ "${#msePromptValueArrayName[@]}" == 0 ]; then
          MSE_GLOBAL_LASTERR=$(mse_str_replacePlaceHolder "${lbl_err_paramA_IsAnEmptyArray}" "PARAM_A" "PromptValueArrayName")
          return 1
        elif [ "${#msePromptLabelArrayName[@]}" != "${#msePromptValueArrayName[@]}" ]; then
          MSE_GLOBAL_LASTERR=$(mse_str_replacePlaceHolder "${lbl_err_paramA_BothArraysMustHaveSameNumberOfElements}" "PARAM_A" "PromptLabelArrayName" "PARAM_B" "PromptValueArrayName")
          return 1
        fi
      fi
    fi



    #
    # Monta as informações de opções válidas para o usuário
    local mseIndex
    local mseLabel
    local mseValue
    local mseStrValidOptions
    if [ "${msePromptValueType}" == "bool" ] || [ "${msePromptValueType}" == "list" ]; then

      for mseIndex in "${!msePromptLabelArrayName[@]}"; do
        mseLabel="${msePromptLabelArrayName[$mseIndex]}"

        if [ "$mseValue" != "${msePromptValueArrayName[$mseIndex]}" ]; then
          mseValue="${msePromptValueArrayName[$mseIndex]}"

          if [ "$mseStrValidOptions" != "" ]; then
            mseStrValidOptions="${mseStrValidOptions} | "
          fi
        else
          if [ "$mseStrValidOptions" != "" ]; then
            mseStrValidOptions="${mseStrValidOptions}/"
          fi
        fi

        mseStrValidOptions="${mseStrValidOptions}${mseLabel}"
      done

      mseBodyMessageArrayName+=("[ ${mseStrValidOptions} ] : ")
    fi



    #
    # Identifica o tema a ser usado
    local mseTheme="${MSE_GLOBAL_THEME_NAME}"
    if [ "${8}" != "" ]; then
      mseTheme="${8}"
    fi



    local msePromptUserMessage
    local msePromptUserValue
    msePromptUserMessage=$(mse_inter_showMessage "${mseArgs[MessageType]}" "${mseArgs[MessageFormat]}" "" "" "" "${mseArgs[TitleType]}" "" "" "" "" "" "${mseArgs[TitleCode]}::${mseArgs[TitleText]}" "" "" "" "" "" "" "" "" "" "" "" "" "${mseArgs[BodyMessageArrayName]}" "" "" "" "" "" "${mseTheme}" || echo "${MSE_GLOBAL_PROMPT_RESULT}")
    while [ "${MSE_GLOBAL_PROMPT_RESULT}" == "" ]; do
      #
      # Se está chegando aqui novamente significa que o valor digitado é inválido
      # mostra uma mensagem de erro para o usuário
      if [ "${msePromptUserValue}" != "" ]; then
        local mseErrMsg=$(mse_str_replacePlaceHolder "${lbl_inter_prompt_invalidValue}" "VALUE" "${msePromptUserValue}")
        mse_inter_errorAlert "X" "${mseErrMsg}"
      fi

      #
      # Mostra a mensagem e permite ao usuário digitar uma resposta
      read -r -p "${msePromptUserMessage}" msePromptUserValue

      #
      # Valida o valor digitado
      if [ "${msePromptValueType}" == "bool" ] || [ "${msePromptValueType}" == "list" ]; then
        for mseIndex in "${!msePromptLabelArrayName[@]}"; do
          mseLabel="${msePromptLabelArrayName[$mseIndex]}"
          mseValue="${msePromptValueArrayName[$mseIndex]}"

          if [ "${msePromptUserValue^^}" == "${mseLabel^^}" ] || [ "${msePromptUserValue^^}" == "${mseValue^^}" ]; then
            MSE_GLOBAL_PROMPT_RESULT="${mseValue}"
          fi
        done
      else
        MSE_GLOBAL_PROMPT_RESULT="${msePromptUserValue}"
      fi
    done

    #
    # Remove a linha de opções do array alvo
    if [ "${msePromptValueType}" == "bool" ] || [ "${msePromptValueType}" == "list" ]; then
      unset 'mseBodyMessageArrayName[-1]'
    fi

    printf "\n"
  fi
}





#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_inter_promptUser_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=8
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="MessageType :: r :: list"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0_labels"]="friendly, ordinary, caution, important"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0_values"]="fr, or, ca, im"
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
