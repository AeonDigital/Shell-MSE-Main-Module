#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Efetua a validação dos argumentos de uma função conforme as regras
# especificadas nas regras indicadas.
#
# @param string $1
# Nome do array associativo contendo as regras que servirão para testar os
# argumentos passados.
#
# @param string $2
# Nome do array unidimencional contendo cada um dos parametros que serão
# testados.
#
# @param bool $3
# Opcional.
# Omita, informe "" ou "0" para que a validação ocorra naturalmente.
# Informe "1" para que o algoritmo saiba que está validando suas próprias
# entradas.
#
# @return
# '1' se todos os parametros estiverem corretos.
# Mensagem de erro encontrada (referente ao primeiro erro de validação).
mse_exec_validateParams() {
  local mseReturn
  mseReturn=1


  if [ $# -le 2 ] || [ "$3" != "1" ]; then
    #
    # Efetua a validação dos argumentos recebidos nesta própria função
    declare -a mseCheckData=("$@")
    declare -A mseCheckParams
    mseCheckParams["count"]="3"
    mseCheckParams["param_0"]="ValidateRules :: r :: assocName :: :: count"
    mseCheckParams["param_1"]="ValidateData :: r :: arrayName"
    mseReturn=$(mse_exec_validateParams "mseCheckParams" "mseCheckData" "1")
  fi


  #
  # Tendo recebido as informações mínimas necessárias para efetuar a validação
  # dos parametros indicados...
  if [ "$mseReturn" == 1 ]; then
    mse_mmod_loadLocaleLabels $(dirname "${BASH_SOURCE[0]}")

    local mseCurrentParam
    local mseCurrentParamIsSet

    declare -n mseRawParamRules
    local mseRawParamRulesName
    local mseRawParamRulesLength
    local mseRawCurrentParamRule
    local mseRawCurrentParamRuleKey
    local mseRawCurrentParamRuleValues

    declare -n mseRawParamData
    local mseRawParamDataLength
    local mseRawCurrentParamDataValue



    local mseParamL
    local mseParamI
    local mseParamCk

    local mseParamLabel
    local mseParamRequired
    local mseParamType
    local mseParamDefault
    local mseParamMaxLength
    local mseParamMin
    local mseParamMax
    local mseParamCreate
    local mseParamAssocKeys
    local mseParamListLabels
    local mseParamListValues
    local mseParamFunctionName


    local mseTmpMsg




    mseCurrentParam=0

    mseRawParamRules="$1"
    mseRawParamRulesName="$1"
    mseRawParamRulesLength="${mseRawParamRules[count]}"
    mseRawCurrentParamRule=""

    mseRawParamData="$2"
    mseRawParamDataLength="${#mseRawParamData[@]}"



    #
    # Para cada regra de argumento existente...
    for ((mseCurrentParam=0; mseCurrentParam<mseRawParamRulesLength; mseCurrentParam++)); do
      if [ "${mseReturn}" == 1 ]; then
        mseCurrentParamIsSet=0
        mseRawCurrentParamDataValue=""


        #
        # Apenas se há alguma regra descrita para este parametro
        mseRawCurrentParamRuleKey="param_${mseCurrentParam}"
        if [ ! -z "${mseRawParamRules[$mseRawCurrentParamRuleKey]+x}" ] && [ "${mseRawParamRules[$mseRawCurrentParamRuleKey]}" != "" ]; then

          mseRawCurrentParamRule="${mseRawParamRules[$mseRawCurrentParamRuleKey]}"
          mse_str_split "::" "${mseRawCurrentParamRule}"
          mseRawCurrentParamRuleValues=("${MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}")
          #
          # Apenas se a regra encontrada possui os 3 itens mínimos
          if [ "${#mseRawCurrentParamRuleValues[@]}" -lt 3 ]; then
            mseReturn=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_mainMessage}" "MSG" "${mseRawCurrentParamRule}")
          else
            #
            # Promove um 'trim' em todos os parametros
            mseParamL="${#mseRawCurrentParamRuleValues[@]}"
            for ((mseParamI=0; mseParamI<mseParamL; mseParamI++)); do
              mseRawCurrentParamRuleValues[$mseParamI]=$(mse_str_trim "${mseRawCurrentParamRuleValues[$mseParamI]}")
            done


            mseParamLabel="${mseRawCurrentParamRuleValues[0]}"
            mseParamRequired="${mseRawCurrentParamRuleValues[1]}"
            mseParamType="${mseRawCurrentParamRuleValues[2]}"


            #
            # Valida o nome do campo
            if [ "$mseParamLabel" == "" ]; then
              mseTmpMsg=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_fieldA_CannotBeEmpty}" "FIELDNAME_A" "Label")
              mseReturn=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_mainMessage}" "MSG" "${mseTmpMsg}")
            fi
            #
            # Valida a configuração de obrigatoriedade do campo
            if [ "${mseReturn}" == 1 ]; then
              if [ "$mseParamRequired" == "" ]; then
                mseTmpMsg=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_fieldA_CannotBeEmpty}" "FIELDNAME_A" "Required")
                mseReturn=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_mainMessage}" "MSG" "${mseTmpMsg}")
              else
                case "$mseParamRequired" in
                  optional | opt | o | 0)
                    mseParamRequired=0
                  ;;
                  required | req | r | 1)
                    mseParamRequired=1
                  ;;
                  *)
                    mseTmpMsg=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_fieldA_HasAnInvalidValue}" "FIELDNAME_A" "Required")
                    mseReturn=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_mainMessage}" "MSG" "${mseTmpMsg}")
                  ;;
                esac
              fi
            fi
            #
            # Valida a configuração de tipo do campo
            if [ "${mseReturn}" == 1 ]; then
              if [ "$mseParamType" == "" ]; then
                mseTmpMsg=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_fieldA_CannotBeEmpty}" "FIELDNAME_A" "Type")
                mseReturn=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_mainMessage}" "MSG" "${mseTmpMsg}")
              else
                mseParamDefault=""
                mseParamFunctionName=""

                if [ "${#mseRawCurrentParamRuleValues[@]}" -ge 4 ]; then
                  case "$mseParamType" in
                    bool | string | char | charDecimal | charHex | charOctal | int | fileName | dirName | functionName | arrayName | assocName | list)
                      mseParamDefault="${mseRawCurrentParamRuleValues[3]}"
                    ;;
                    validateFN)
                      mseParamFunctionName="${mseRawCurrentParamRuleValues[3]}"
                      mseParamCk=$(mse_check_isFunctionExists "$mseParamFunctionName")
                      if [ $mseParamCk == 0 ]; then
                        mseTmpMsg=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_fieldA_PointsToNonExistentFunction}" "FIELDNAME_A" "ValidateFunction")
                        mseReturn=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_mainMessage}" "MSG" "${mseTmpMsg}")
                      fi
                    ;;
                    *)
                      mseTmpMsg=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_fieldA_HasAnInvalidValue}" "FIELDNAME_A" "Type")
                      mseReturn=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_mainMessage}" "MSG" "${mseTmpMsg}")
                    ;;
                  esac
                fi
              fi
            fi





            #
            # Não havendo erros até aqui
            # começa a recolher as configurações condicionais a cada tipo de valor
            if [ "${mseReturn}" == 1 ]; then
              mseParamMaxLength=""
              mseParamMin=""
              mseParamMax=""
              mseParamCreate=""
              mseParamAssocKeys=""
              mseParamListLabels=""
              mseParamListValues=""


              case "$mseParamType" in
                string)
                  if [ $mseParamL -ge 5 ]; then
                    mseParamMaxLength="${mseRawCurrentParamRuleValues[4]}"

                    mseParamCk=$(mse_check_isInteger "$mseParamMaxLength")
                    if [ $mseParamCk == 0 ]; then
                      mseTmpMsg=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_fieldA_MustBeAnInteger}" "FIELDNAME_A" "MaxLength")
                      mseReturn=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_mainMessage}" "MSG" "${mseTmpMsg}")
                    else
                      if [ $mseParamMaxLength -lt 1 ]; then
                        mseTmpMsg=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_fieldA_MustBeGreaterThanZero}" "FIELDNAME_A" "MaxLength")
                        mseReturn=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_mainMessage}" "MSG" "${mseTmpMsg}")
                      fi
                    fi
                  fi
                ;;
                int | arrayName)
                  if [ $mseParamL -ge 5 ]; then
                    mseParamMin="${mseRawCurrentParamRuleValues[4]}"

                    mseParamCk=$(mse_check_isInteger "$mseParamMin")
                    if [ $mseParamCk == 0 ]; then
                      mseTmpMsg=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_fieldA_MustBeAnInteger}" "FIELDNAME_A" "Min")
                      mseReturn=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_mainMessage}" "MSG" "${mseTmpMsg}")
                    fi
                  fi

                  if [ "${mseReturn}" == 1 ] && [ $mseParamL -ge 6 ]; then
                    mseParamMax="${mseRawCurrentParamRuleValues[5]}"

                    mseParamCk=$(mse_check_isInteger "$mseParamMax")
                    if [ $mseParamCk == 0 ]; then
                      mseTmpMsg=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_fieldA_MustBeAnInteger}" "FIELDNAME_A" "Max")
                      mseReturn=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_mainMessage}" "MSG" "${mseTmpMsg}")
                    fi
                  fi

                  if [ "$mseReturn" == 1 ]; then
                    if [ "$mseParamMin" != "" ] && [ "$mseParamMax" != "" ] && [ "$mseParamMin" -gt "$mseParamMax" ]; then
                      mseTmpMsg=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_fieldA_IsGreaterThan_FieldB}" "FIELDNAME_A" "Min" "FIELDNAME_B" "Max")
                      mseReturn=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_mainMessage}" "MSG" "${mseTmpMsg}")
                    fi
                  fi

                  if [ "$mseReturn" == 1 ] && [ "$mseParamType" == "arrayName" ]; then
                    if [ "$mseParamMin" != "" ] && [ "$mseParamMin" -lt 0 ]; then
                      mseTmpMsg=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_forTypeA_FieldA_MustBeGreaterOrEqualsToZero}" "TYPE_A" "arrayName" "FIELDNAME_A" "Min")
                      mseReturn=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_mainMessage}" "MSG" "${mseTmpMsg}")
                    elif [ "$mseParamMax" != "" ] && [ "$mseParamMax" -lt 1 ]; then
                      mseTmpMsg=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_forTypeA_FieldA_MustBeGreaterOrEqualsToOne}" "TYPE_A" "arrayName" "FIELDNAME_A" "Max")
                      mseReturn=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_mainMessage}" "MSG" "${mseTmpMsg}")
                    fi
                  fi
                ;;
                fileName | dirName)
                  mseParamCreate="0"

                  if [ $mseParamL -ge 5 ]; then
                    case "${mseRawCurrentParamRuleValues[4]}" in
                      create | yes | y | 1)
                        mseParamCreate=1
                      ;;
                      nocreate | no | n | 0)
                        mseParamCreate=0
                      ;;
                      *)
                        mseTmpMsg=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_fieldA_HasAnInvalidOption}" "FIELDNAME_A" "${mseParamType}")
                        mseReturn=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_mainMessage}" "MSG" "${mseTmpMsg}")
                      ;;
                    esac
                  fi
                ;;
                assocName)
                  mseParamAssocKeys=()

                  if [ $mseParamL -ge 5 ] && [ "${mseRawCurrentParamRuleValues[4]}" != "" ]; then
                    local mseI
                    local mseL
                    mse_str_split "," "${mseRawCurrentParamRuleValues[4]}"
                    mseParamAssocKeys=("${MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}")

                    #
                    # Promove um 'trim' em todos os parametros
                    mseL="${#mseParamAssocKeys[@]}"
                    for ((mseI=0; mseI<mseL; mseI++)); do
                      mseParamAssocKeys[$mseI]=$(mse_str_trim "${mseParamAssocKeys[$mseI]}")
                    done
                  fi
                ;;
                list)
                  local mseParamTmpList

                  #
                  # Verifica e valida a coleção de legendas válidas
                  mseParamCk=$(mse_check_hasKeyInAssocArray "${mseRawCurrentParamRuleKey}_labels" "${mseRawParamRulesName}")
                  if [ $mseParamCk == 0 ]; then
                    mseTmpMsg=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_fieldA_LostThe_A_Collection}" "FIELDNAME_A" "List" "A" "label")
                    mseReturn=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_mainMessage}" "MSG" "${mseTmpMsg}")
                  else
                    mseParamTmpList="${mseRawParamRules[${mseRawCurrentParamRuleKey}_labels]}"
                    if [ "$mseParamTmpList" == "" ]; then
                      mseTmpMsg=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_fieldA_HasAnEmpty_A_Collection}" "FIELDNAME_A" "List" "A" "label")
                      mseReturn=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_mainMessage}" "MSG" "${mseTmpMsg}")
                    else
                      mse_str_split "," "${mseParamTmpList}"
                      mseParamListLabels=("${MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}")

                      #
                      # Promove um 'trim' em todos os parametros
                      mseL="${#mseParamListLabels[@]}"
                      for ((mseI=0; mseI<mseL; mseI++)); do
                        mseParamListLabels[$mseI]=$(mse_str_trim "${mseParamListLabels[$mseI]}")
                      done
                    fi
                  fi

                  #
                  # Verifica e valida a coleção de valores válidos
                  if [ "${mseReturn}" == 1 ]; then
                    mseParamCk=$(mse_check_hasKeyInAssocArray "${mseRawCurrentParamRuleKey}_values" "${mseRawParamRulesName}")
                    if [ $mseParamCk == 0 ]; then
                      mseTmpMsg=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_fieldA_LostThe_A_Collection}" "FIELDNAME_A" "List" "A" "value")
                      mseReturn=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_mainMessage}" "MSG" "${mseTmpMsg}")
                    else
                      mseParamTmpList="${mseRawParamRules[${mseRawCurrentParamRuleKey}_values]}"
                      if [ "$mseParamTmpList" == "" ]; then
                        mseTmpMsg=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_fieldA_HasAnEmpty_A_Collection}" "FIELDNAME_A" "List" "A" "value")
                        mseReturn=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_mainMessage}" "MSG" "${mseTmpMsg}")
                      else
                        mse_str_split "," "${mseParamTmpList}"
                        mseParamListValues=("${MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}")

                        #
                        # Promove um 'trim' em todos os parametros
                        mseL="${#mseParamListValues[@]}"
                        for ((mseI=0; mseI<mseL; mseI++)); do
                          mseParamListValues[$mseI]=$(mse_str_trim "${mseParamListValues[$mseI]}")
                        done
                      fi
                    fi
                  fi

                  #
                  # Verifica se o número de legendas e valores está correto
                  if [ "${mseReturn}" == 1 ] && [ ${#mseParamListLabels[@]} != ${#mseParamListValues[@]} ]; then
                    mseTmpMsg=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_fieldA_HasAnIncorrectCorrelationBetween_A_and_B}" "FIELDNAME_A" "List" "A" "labels" "B" "values")
                    mseReturn=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_mainMessage}" "MSG" "${mseTmpMsg}")
                  fi
                ;;
              esac
            fi





            if [ "${mseReturn}" == 1 ]; then

              #
              # Identifica se o parametro atual está setado.
              if [ "$mseCurrentParam" -lt "$mseRawParamDataLength" ]; then
                mseCurrentParamIsSet=1
                mseRawCurrentParamDataValue="${mseRawParamData[$mseCurrentParam]}"
              fi

              #
              # Assume o valor padrão caso exista um definido
              if [ $mseCurrentParamIsSet == 0 ] && [ "${mseParamDefault}" != "" ]; then
                mseCurrentParamIsSet=1
                mseRawCurrentParamDataValue="${mseParamDefault}"
              fi

              #
              # Se o parametro é obrigatório mas não está definido
              if [ $mseParamRequired == 1 ] && [ $mseCurrentParamIsSet == 0 ]; then
                ((mseCurrentParam=mseCurrentParam+1))
                mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_IsRequired}" "PARAM_A" "${mseParamLabel}")
              else
                if [ "${mseRawCurrentParamDataValue}" != "" ]; then
                  case "${mseParamType}" in
                    bool)
                      if [ "${mseRawCurrentParamDataValue}" != 1 ] && [ "${mseRawCurrentParamDataValue}" != 0 ]; then
                        mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_IsNot_A}" "PARAM_A" "${mseParamLabel}" "A" "bool")
                      fi
                    ;;
                    string)
                      local oLC_CTYPE="${LC_CTYPE}"
                      LC_CTYPE=""
                      if [ "$mseParamMaxLength" != "" ] && [ "${#mseRawCurrentParamDataValue}" -gt $mseParamMaxLength ]; then
                        mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_IsGreaterThanMaxLength}" "PARAM_A" "${mseParamLabel}" "MAXLENGTH" "${mseParamMaxLength}")
                      fi
                      LC_CTYPE="${oLC_CTYPE}"
                    ;;
                    char)
                      mseParamCk=$(mse_check_isChar "${mseRawCurrentParamDataValue}")
                      if [ $mseParamCk == 0 ]; then
                        mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_IsNot_A}" "PARAM_A" "${mseParamLabel}" "A" "char")
                      fi
                    ;;
                    charDecimal)
                      mseParamCk=$(mse_check_isCharDecimal "${mseRawCurrentParamDataValue}")
                      if [ $mseParamCk == 0 ]; then
                        mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_IsNotValid_A_RepresentationOf_B}" "PARAM_A" "${mseParamLabel}" "A" "decimal" "B" "char")
                      fi
                    ;;
                    charHex)
                      mseParamCk=$(mse_check_isCharHex "${mseRawCurrentParamDataValue}")
                      if [ $mseParamCk == 0 ]; then
                        mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_IsNotValid_A_RepresentationOf_B}" "PARAM_A" "${mseParamLabel}" "A" "hexadecimal" "B" "char")
                      fi
                    ;;
                    charOctal)
                      mseParamCk=$(mse_check_isCharOctal "${mseRawCurrentParamDataValue}")
                      if [ $mseParamCk == 0 ]; then
                        mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_IsNotValid_A_RepresentationOf_B}" "PARAM_A" "${mseParamLabel}" "A" "octal" "B" "char")
                      fi
                    ;;
                    int)
                      mseParamCk=$(mse_check_isInteger "${mseRawCurrentParamDataValue}")
                      if [ "$mseParamCk" == 0 ]; then
                        mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_IsNotAn_A}" "PARAM_A" "${mseParamLabel}" "A" "integer")
                      else
                        if [ "$mseParamMin" != "" ] && [ "${mseRawCurrentParamDataValue}" -lt "$mseParamMin" ]; then
                          mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_MustBeGreaterOrEqualsThan_A}" "PARAM_A" "${mseParamLabel}" "A" "${mseParamMin}")
                        elif [ "$mseParamMax" != "" ] && [ "${mseRawCurrentParamDataValue}" -gt "$mseParamMax" ]; then
                          mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_MustBeLessOrEqualsThan_A}" "PARAM_A" "${mseParamLabel}" "A" "${mseParamMax}")
                        fi
                      fi
                    ;;
                    fileName)
                      if [ "${mseParamCreate}" == 1 ] && [ ! -f "${mseRawCurrentParamDataValue}" ]; then
                        > "${mseRawCurrentParamDataValue}"
                        if [ "$?" != 0 ]; then
                          mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_cannotCreateNewFileIn}" "LOCAL" "${mseRawCurrentParamDataValue}")
                        fi
                      fi
                      if [ ! -f "${mseRawCurrentParamDataValue}" ]; then
                        mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_PointsToNonExistentFile}" "PARAM_A" "${mseParamLabel}")
                      fi
                    ;;
                    dirName)
                      if [ "${mseParamCreate}" == 1 ] && [ ! -d "${mseRawCurrentParamDataValue}" ]; then
                        mkdir -p "${mseRawCurrentParamDataValue}"
                        if [ $? != 0 ]; then
                          mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_cannotCreateNewDirectoryIn}" "LOCAL" "${mseRawCurrentParamDataValue}")
                        fi
                      fi
                      if [ ! -d "${mseRawCurrentParamDataValue}" ]; then
                        mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_PointsToNonExistentDirectory}" "PARAM_A" "${mseParamLabel}")
                      fi
                    ;;
                    functionName)
                      mseParamCk=$(mse_check_isFunctionExists "${mseRawCurrentParamDataValue}")
                      if [ $mseParamCk == 0 ]; then
                        mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_MustBeNameOfExistentFunction}" "PARAM_A" "${mseParamLabel}")
                      fi
                    ;;
                    arrayName)
                      #
                      # Identifica se o array de fato existe
                      if [[ ! "$(declare -p ${mseRawCurrentParamDataValue} 2> /dev/null)" =~ "declare -a" ]]; then
                        mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_IsNotAn_A}" "PARAM_A" "${mseParamLabel}" "A" "array name")
                      else
                        declare -n mseTmpArrayName="${mseRawCurrentParamDataValue}"

                        if [ "$mseParamMin" != "" ] && [ "${#mseTmpArrayName[@]}" -lt "$mseParamMin" ]; then
                          mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_MustBeAnArrayWithAtLast_Min}" "PARAM_A" "${mseParamLabel}" "MIN" ${mseParamMin})
                        elif [ "$mseParamMax" != "" ] && [ "${#mseTmpArrayName[@]}" -gt "$mseParamMax" ]; then
                          mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_MustBeAnArrayWithAtLast_Max}" "PARAM_A" "${mseParamLabel}" "MAX" ${mseParamMax})
                        fi
                      fi
                    ;;
                    assocName)
                      #
                      # Identifica se o array de fato existe
                      if [[ ! "$(declare -p ${mseRawCurrentParamDataValue} 2> /dev/null)" =~ "declare -A" ]]; then
                        mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_IsNotAn_A}" "PARAM_A" "${mseParamLabel}" "A" "associative array name")
                      else
                        declare -n mseTmpAssocArrayName="${mseRawCurrentParamDataValue}"
                        local mseTmpAssocKey

                        for mseTmpAssocKey in "${mseParamAssocKeys[@]}"; do
                          if [ "$mseReturn" == 1 ] && [ -z "${mseTmpAssocArrayName[$mseTmpAssocKey]+x}" ]; then
                            mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_LostTheRequiredKey_Key}" "PARAM_A" "${mseParamLabel}" "KEY" ${mseTmpAssocKey})
                          fi
                        done
                      fi
                    ;;
                    list)
                      local mseTmpMatch
                      local mseTmpListI
                      local mseTmpListL

                      mseTmpMatch=0
                      mseTmpListL="${#mseParamListLabels[@]}"
                      for ((mseTmpListI=0; mseTmpListI<mseTmpListL; mseTmpListI++)); do
                        if [ "${mseRawCurrentParamDataValue}" == "${mseParamListLabels[$mseTmpListI]}" ] || [ "${mseRawCurrentParamDataValue}" == "${mseParamListValues[$mseTmpListI]}" ]; then
                          mseRawCurrentParamDataValue="${mseParamListValues[$mseTmpListI]}"
                          mseTmpMatch=1
                          break;
                        fi
                      done

                      if [ "$mseTmpMatch" == 0 ]; then
                        mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_HasInvalidValue}" "PARAM_A" "${mseParamLabel}")
                      fi
                    ;;
                  esac
                fi
              fi
            fi
          fi
        fi

      fi
    done
  fi


  printf "%s" "${mseReturn}"
}
