#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Efetua a validação dos argumentos de uma função conforme as regras
# especificadas nas regras indicadas.
#
# @param int $1
# Total de argumentos que foram passados para a função sendo testada.
# Este valor pode ser obtido pela variável especial '$#'.
#
# @param array $2
# Nome do array associativo contendo as regras que servirão para testar os
# argumentos passados.
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
mse_mmod_validateArgs() {
  local mseReturn

  #
  # Define a validação dos argumentos desta própria função
  mseReturn=1
  # declare -A mseCheckParans
  # mseCheckParans["count"]="$#"
  # mseCheckParans["param_1"]="TotalArgs :: r :: int :: . :: 2 :: 2"
  # mseCheckParans["param_2"]="ParamRules :: r :: assocName :: . :: count"
  # mseCheckParans["param_2_count"]="count :: r :: int :: . :: 0"

  # if [ $# -le 1 ] || [ "$2" != "1" ]; then
  #   mseReturn=$(mse_mmod_validateArgs "mseCheckParans" "1")
  # fi


  #
  # Tendo recebido as informações mínimas necessárias para efetuar a validação
  # dos parametros indicados...
  if [ "$mseReturn" == 1 ]; then
    local mseAtualParam
    local mseTotalParans
    local mseParamRuleRawName
    local mseParamRuleEvalName

    local mseParamRawKey
    local mseParamRawValue
    local mseParamArrValues


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




    mseAtualParam=1
    mseTotalParans="$1"
    mseParamRuleRawName="$2"
    mseParamRuleEvalName="$2[@]"

    #
    # Para cada argumento existente verifica se há uma regra para ele.
    for ((mseAtualParam=1; mseAtualParam<=mseTotalParans; mseAtualParam++)); do
      if [ "${mseReturn}" == 1 ]; then
        mseParamRawKey="param_${mseAtualParam}"
        mseParamRawValue="${mseParamRuleRawName}[$mseParamRawKey]"
        mseParamRawValue="${!mseParamRawValue}"


        #
        # Apenas se há alguma regra descrita para este parametro
        if [ "${mseParamRawValue}" != "" ]; then
          mse_str_split "::" "${mseParamRawValue}"
          mseParamArrValues=("${MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}")

          #
          # Apenas se a regra encontrada possui os 4 itens mínimos
          if [ "${#mseParamArrValues[@]}" -lt 4 ]; then
            mseReturn="Invalid parameter definition; [ ${mseParamRawValue} ]"
          else
            #
            # Promove um 'trim' em todos os parametros
            mseParamL="${#mseParamArrValues[@]}"
            for ((mseParamI=0; mseParamI<mseParamL; mseParamI++)); do
              mseParamArrValues[$mseParamI]=$(mse_str_trim "${mseParamArrValues[$mseParamI]}")
            done


            mseParamLabel="${mseParamArrValues[0]}"
            mseParamRequired="${mseParamArrValues[1]}"
            mseParamType="${mseParamArrValues[2]}"

            #
            # Valida o nome do campo
            if [ "$mseParamLabel" == "" ]; then
              mseReturn="Invalid parameter definition; [ Label field cannot be empty ]"
            fi
            #
            # Valida a configuração de obrigatoriedade do campo
            if [ "${mseReturn}" == 1 ] && [ "$mseParamRequired" == "" ]; then
              mseReturn="Invalid parameter definition; [ Required field cannot be empty ]"
            else
              case "$mseParamRequired" in
                optional | opt | o | 0)
                  mseParamRequired=0
                ;;
                required | req | r | 1)
                  mseParamRequired=1
                ;;
                *)
                  mseReturn="Invalid parameter definition; [ Required field has an invalid value \"${mseParamRequired}\" ]"
                ;;
              esac
            fi
            #
            # Valida a configuração de tipo do campo
            if [ "${mseReturn}" == 1 ] && [ "$mseParamType" == "" ]; then
              mseReturn="Invalid parameter definition; [ Type field cannot be empty ]"
            else
              mseParamDefault=""
              mseParamFunctionName=""


              case "$mseParamType" in
                string | int | fileName | dirName | functionName | arrayName | assocName | list)
                  mseParamDefault="${mseParamArrValues[3]}"
                ;;
                validateFN)
                  mseParamFunctionName="${mseParamArrValues[3]}"
                  mseParamCk=$(mse_mmod_checkIfFunctionExists "$mseParamFunctionName")
                  if [ $mseParamCk == 0 ]; then
                    mseReturn="Invalid parameter definition; [ ValidateFunction field points to non existent function \"${mseParamFunctionName}\" ]"
                  fi
                ;;
                *)
                  mseReturn="Invalid parameter definition; [ Type field has an invalid value \"${mseParamType}\" ]"
                ;;
              esac
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
                    mseParamMaxLength="${mseParamArrValues[4]}"

                    mseParamCk=$(mse_mmod_checkIfInteger "$mseParamMaxLength")
                    if [ $mseParamCk == 0 ]; then
                      mseReturn="Invalid parameter definition; [ MaxLength field must be an integer ]"
                    else
                      if [ $mseParamMaxLength -lt 1 ]; then
                        mseReturn="Invalid parameter definition; [ MaxLength field must be greater than 0 ]"
                      fi
                    fi
                  fi
                ;;
                int | arrayName)
                  if [ $mseParamL -ge 5 ]; then
                    mseParamMin="${mseParamArrValues[4]}"

                    mseParamCk=$(mse_mmod_checkIfInteger "$mseParamMin")
                    if [ $mseParamCk == 0 ]; then
                      mseReturn="Invalid parameter definition; [ Min field must be an integer ]"
                    fi
                  fi

                  if [ "${mseReturn}" == 1 ] && [ $mseParamL -ge 6 ]; then
                    mseParamMax="${mseParamArrValues[5]}"

                    mseParamCk=$(mse_mmod_checkIfInteger "$mseParamMax")
                    if [ $mseParamCk == 0 ]; then
                      mseReturn="Invalid parameter definition; [ Max field must be an integer ]"
                    fi
                  fi

                  if [ "$mseParamMin" != "" ] && [ "$mseParamMax" != "" ] && [ $mseParamMin -gt $mseParamMax ]; then
                    mseReturn="Invalid parameter definition; [ Min field is greater than Max field ]"
                  fi
                ;;
                fileName | dirName)
                  mseParamCreate="0"

                  if [ $mseParamL -ge 5 ]; then
                    case "${mseParamArrValues[4]}" in
                      create | yes | y | 1)
                        mseParamCreate=1
                      ;;
                      nocreate | no | n | 0)
                        mseParamCreate=0
                      ;;
                      *)
                        mseReturn="Invalid parameter definition; [ Create field has an invalid option ]"
                      ;;
                    esac
                  fi
                ;;
                assocName)
                  mseParamAssocKeys=()

                  if [ $mseParamL -ge 5 ] && [ "${mseParamArrValues[4]}" != "" ]; then
                    local mseI
                    local mseL
                    mse_str_split "," "${mseParamArrValues[4]}"
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
                  mseParamCk=$(mse_mmod_checkIfHasKeyInAssoc "${mseParamRawKey}_labels" "${mseParamRuleRawName}")
                  if [ $mseParamCk == 0 ]; then
                    mseReturn="Invalid parameter definition; [ List field lost the label collection ]"
                  else
                    mseParamTmpList="${mseParamRuleRawName}[${mseParamRawKey}_labels]"
                    mseParamTmpList="${!mseParamTmpList}"
                    if [ "$mseParamTmpList" == "" ]; then
                      mseReturn="Invalid parameter definition; [ List field has an empty label collection ]"
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
                    mseParamCk=$(mse_mmod_checkIfHasKeyInAssoc "${mseParamRawKey}_values" "${mseParamRuleRawName}")
                    if [ $mseParamCk == 0 ]; then
                      mseReturn="Invalid parameter definition; [ List field lost the value collection ]"
                    else
                      mseParamTmpList="${mseParamRuleRawName}[${mseParamRawKey}_values]"
                      mseParamTmpList="${!mseParamTmpList}"
                      if [ "$mseParamTmpList" == "" ]; then
                        mseReturn="Invalid parameter definition; [ List field has an empty value collection ]"
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
                    mseReturn="Invalid parameter definition; [ List field has an incorrect correlation between labels and values ]"
                  fi
                ;;
              esac
            fi



            #
            # PROSSEGUIR DAQUI:
            # COMEÇAR A EFETIVA VALIDAÇÃO DE CADA CAMPO RECEBIDO.
            echo "====  ${mseParamRawKey}  ===="
            echo "Label           : ${mseParamLabel}"
            echo "Required        : ${mseParamRequired}"
            echo "Type            : ${mseParamType}"
            echo "Default         : ${mseParamDefault}"
            echo "MaxLengh        : ${mseParamMaxLength}"
            echo "Min             : ${mseParamMin}"
            echo "Max             : ${mseParamMax}"
            echo "Create          : ${mseParamCreate}"
            if [ $mseParamType == "assocName" ]; then
              echo "AssocKeys       : ${mseParamAssocKeys[@]}"
            else
              echo "AssocKeys       : ${mseParamAssocKeys}"
            fi
            if [ $mseParamType == "list" ]; then
              echo "Labels          : ${mseParamListLabels[@]}"
              echo "Values          : ${mseParamListValues[@]}"
            else
              echo "Labels          : ${mseParamListLabels}"
              echo "Values          : ${mseParamListValues}"
            fi
            echo "FunctionName    : ${mseParamFunctionName}"
          fi
        fi
      fi
    done
  fi


  printf "${mseReturn}"
}


mse_mmod_test() {
  declare -A checkParams
  checkParams["param_1"]="P01 :: r :: string    :: teste01 :: 25"
  checkParams["param_2"]="P02 :: o :: string    :: teste02 :: 200"
  checkParams["param_3"]="P03 :: o :: int       :: 1 :: 0 :: 10"
  checkParams["param_4"]="P04 :: o :: fileName  :: :: y"
  checkParams["param_5"]="P05 :: o :: dirName   :: ~/mypath :: n"
  checkParams["param_6"]="P06 :: o :: arrayName :: :: 1 :: 20"
  checkParams["param_7"]="P07 :: o :: assocName :: key1 :: key1, key2, key3 "
  checkParams["param_8"]="P08 :: o :: list :: SC"
  checkParams["param_8_labels"]="São Paulo, Santa Catarina, Rio Grande do Sul"
  checkParams["param_8_values"]="SP, SC, RS"
  mse_mmod_validateArgs "8" "checkParams"
}
