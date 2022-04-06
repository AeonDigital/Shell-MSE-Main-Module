#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Mostra uma mensagem para o usuário e permite que ele
# ofereça uma resposta.
#
# O resultado selecionado pelo usuário ficará definido na variável
# ${MSE_GLOBAL_MODULE_PROMPT_RESULT}.
#
# Quando usar os tipos 'bool' e 'list', defina as chaves de valores
# sempre em minúsculas.
#
# @param string $1
# Tipo de valor que é esperado como resposta do prompt.
# Se nenhum valor for informado, usará o tipo 'bool'.
#
# Os tipos válidos são:
# - bool  : espera uma resposta booleana [ sim|não ]
# - list  : espera uma resposta baseada em uma lista pré-definida.
# - value : aceita qualquer resposta como válida.
#
#
# Para usar o tipo 'list' é necessário preencher as variáveis
# ${MSE_GLOBAL_MODULE_PROMPT_LIST_OPTIONS_LABELS} e ${MSE_GLOBAL_MODULE_PROMPT_LIST_OPTIONS_VALUES}
# com as chaves/valores que são aceitos para a mesma.
#
# Em "LABELS" armazene as 'keys' que são as strings que o usuário pode
# digitar. Já em "VALUES" deve existir um valor correspondente à posição de
# cada "key" previamente definida.
# O valor selecionado irá ficar armazenado na variável
# ${MSE_GLOBAL_MODULE_PROMPT_RESULT}
#
# @example
#   MSE_GLOBAL_MODULE_PROMPT_MSG=()
#   MSE_GLOBAL_MODULE_PROMPT_MSG[0]=$(printf "ATENÇÃO!")
#   MSE_GLOBAL_MODULE_PROMPT_MSG[1]=$(printf "Deseja prosseguir?")
#
#   mse_mmod_promptUser
#   if [ "$MSE_GLOBAL_MODULE_PROMPT_RESULT" == "1" ]; then
#     printf "Escolhido Sim"
#   else
#     printf "Escolhido Não"
#   fi
#
#
#
#   MSE_GLOBAL_MODULE_PROMPT_LIST_OPTIONS_LABELS=(
#     "arch" "ubuntu" "debian"
#   )
#   MSE_GLOBAL_MODULE_PROMPT_LIST_OPTIONS_VALUES=(
#     "Arch" "Ubuntu" "Debian"
#   )
#
#   MSE_GLOBAL_MODULE_PROMPT_MSG=()
#   MSE_GLOBAL_MODULE_PROMPT_MSG[0]=$(printf "ATENÇÃO!")
#   MSE_GLOBAL_MODULE_PROMPT_MSG[1]=$(printf "Selecione sua distribuição preferida:")
#
#   mse_mmod_promptUser "list"
#   printf "Você escolheu a opção: $MSE_GLOBAL_MODULE_PROMPT_RESULT"
mse_mmod_promptUser() {
  MSE_GLOBAL_MODULE_PROMPT_RESULT=""

  #
  # Se não há uma mensagem a ser mostrada para o usuário
  if [ ${#MSE_GLOBAL_MODULE_PROMPT_MSG[@]} == 0 ] && [ ${#MSE_GLOBAL_MODULE_GENERAL_MSG[@]} == 0 ]; then
    mse_mmod_errorAlert "${FUNCNAME[0]}" "${lbl_genericError_emptyArray} MSE_GLOBAL_MODULE_PROMPT_MSG"
  else
    local mseType
    local mseIndex
    local mseKey
    local mseValue
    local msePromptOptions
    local msePromptReadLineMessage
    local msePromptValue
    local mseMsg

    #
    # Verifica o tipo de prompt
    mseType="bool"
    if [ $# == 1 ] && [ "$1" != "" ]; then
      mseType="$1"
    fi


    if [ "$mseType" != "bool" ] && [ "$mseType" != "list" ] && [ "$mseType" != "value" ]; then
      mse_mmod_errorAlert "${FUNCNAME[0]}" "${lbl_genericError_invalidType} ${mseType}"
    else
      #
      # Prepara a mensagem principal
      if [ ${#MSE_GLOBAL_MODULE_PROMPT_MSG[@]} == 0 ]; then
        MSE_GLOBAL_MODULE_PROMPT_MSG=("${MSE_GLOBAL_MODULE_GENERAL_MSG[@]}")
      fi



      mseKey=""
      mseValue=""
      msePromptOptions=""
      msePromptReadLineMessage=""
      if [ "$mseType" == "bool" ]; then
        for mseIndex in "${!lbl_generic_boolPromptLabels[@]}"; do
          mseKey="${lbl_generic_boolPromptLabels[$mseIndex]}"

          if [ "$mseValue" != "${lbl_generic_boolPromptValues[$mseIndex]}" ]; then
            mseValue="${lbl_generic_boolPromptValues[$mseIndex]}"

            if [ "$msePromptOptions" != "" ]; then
              msePromptOptions="${msePromptOptions} | "
            fi
          else
            if [ "$msePromptOptions" != "" ]; then
              msePromptOptions="${msePromptOptions}/"
            fi
          fi

          msePromptOptions="${msePromptOptions}${mseKey}"
          msePromptReadLineMessage="${MSE_GLOBAL_MODULE_PROMPT_INDENT}[ ${msePromptOptions} ] : "
        done

      elif [ "$mseType" == "list" ]; then

        for mseIndex in "${!MSE_GLOBAL_MODULE_PROMPT_LIST_OPTIONS_LABELS[@]}"; do
          mseKey="${MSE_GLOBAL_MODULE_PROMPT_LIST_OPTIONS_LABELS[$mseIndex]}"

          if [ "$mseValue" != "${MSE_GLOBAL_MODULE_PROMPT_LIST_OPTIONS_VALUES[$mseIndex]}" ]; then
            mseValue="${MSE_GLOBAL_MODULE_PROMPT_LIST_OPTIONS_VALUES[$mseIndex]}"

            if [ "$msePromptOptions" != "" ]; then
              msePromptOptions="${msePromptOptions} | "
            fi
          else
            if [ "$msePromptOptions" != "" ]; then
              msePromptOptions="${msePromptOptions}/"
            fi
          fi

          msePromptOptions="${msePromptOptions}${mseKey}"
          msePromptReadLineMessage="${MSE_GLOBAL_MODULE_PROMPT_INDENT}[ ${msePromptOptions} ] : "
        done

      else
        msePromptReadLineMessage="${MSE_GLOBAL_MODULE_PROMPT_INDENT}: "
      fi



      if [ "$msePromptOptions" == "" ] && [ "$mseType" == "bool" ]; then
        mse_mmod_errorAlert "${FUNCNAME[0]}" "${lbl_genericError_emptyListOfBooleanOptions}"
      elif [ "$msePromptOptions" == "" ] && [ "$mseType" == "list" ]; then
        mse_mmod_errorAlert "${FUNCNAME[0]}" "${lbl_genericError_emptyListOfOptions}"
      else

        #
        # Efetua um loop recebendo valores do usuário até que seja digitado algum válido.
        msePromptValue=""
        while [ "$MSE_GLOBAL_MODULE_PROMPT_RESULT" == "" ]; do
          if [ $MSE_GLOBAL_MODULE_PROMPT_TEST == 0 ]; then
            if [ "$msePromptValue" != "" ]; then
              printf "${MSE_GLOBAL_MODULE_PROMPT_INDENT}${lbl_genericError_invalidValue}. ${lbl_genericError_expectedOnly} [ ${msePromptOptions} ]: \"$msePromptValue\" \n"
            fi

            for mseMsg in "${MSE_GLOBAL_MODULE_PROMPT_MSG[@]}"; do
              printf "${MSE_GLOBAL_MODULE_ALERT_INDENT}${mseMsg}\n"
            done
          fi

          #
          # Permite que o usuário digite sua resposta
          read -p "${msePromptReadLineMessage}" msePromptValue

          #
          # Verifica se o valor digitado corresponde a algum dos valores válidos.
          if [ "$mseType" == "bool" ]; then
            msePromptValue=$(printf "$msePromptValue" | awk '{print tolower($0)}')

            for mseIndex in "${!lbl_generic_boolPromptLabels[@]}"; do
              mseKey="${lbl_generic_boolPromptLabels[$mseIndex]}"
              if [ "$mseKey" == "$msePromptValue" ]; then
                MSE_GLOBAL_MODULE_PROMPT_RESULT=${lbl_generic_boolPromptValues[$mseIndex]}
              fi
            done
          elif [ "$mseType" == "list" ]; then
            msePromptValue=$(printf "$msePromptValue" | awk '{print tolower($0)}')

            for mseIndex in "${!MSE_GLOBAL_MODULE_PROMPT_LIST_OPTIONS_LABELS[@]}"; do
              mseKey="${MSE_GLOBAL_MODULE_PROMPT_LIST_OPTIONS_LABELS[$mseIndex]}"
              if [ "$mseKey" == "$msePromptValue" ]; then
                MSE_GLOBAL_MODULE_PROMPT_RESULT=${MSE_GLOBAL_MODULE_PROMPT_LIST_OPTIONS_VALUES[$mseIndex]}
              fi
            done
          else
              MSE_GLOBAL_MODULE_PROMPT_RESULT=$msePromptValue
              break
          fi
        done

      fi


      MSE_GLOBAL_MODULE_PROMPT_MSG=()
      MSE_GLOBAL_MODULE_GENERAL_MSG=()

      if [ $MSE_GLOBAL_MODULE_PROMPT_TEST == 1 ]; then
        printf "${MSE_GLOBAL_MODULE_PROMPT_RESULT}\n"
      fi
    fi
  fi
}
