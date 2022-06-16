#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Substitui um ou mais 'placeholder' em uma string pelos valores indicados.
# Os 'placeholders' precisam ser definidos usando o seguinte padrão:
# [[PHNAME]]
#
# @param string $1
# String que contém os 'placeholders' e que será retornada com as devidas
# substituições.
#
# @param string ${2.. 4.. 6 ..}
# A partir daqui, cada parametro PAR será usado para indicar o nome de um
# placeholder a ser substituído (informe o nome sem os colchetes).
#
# @param string ${3.. 5.. 7..}
# A partir daqui, cada parametro IMPAR será usado para indicar o valor pelo
# qual o placeholder será substituído.
#
# @return
# Printa a string original com a substituição dos placeholders pelos
# novos conteúdos indicados.
mse_str_replacePlaceHolder() {
  if [ $# -ge 3 ]; then
    local mseOriginalString
    local msePH
    local mseValue

    if [ $# == 3 ]; then
      mseOriginalString="$1"
      msePH="\[\[${2}\]\]"
      mseValue="$3"

      printf "%s" "${mseOriginalString//${msePH}/${mseValue}}"
    else
      local i
      local v
      local mseTotalParans
      local mseTmpParametersArray
      local mseReturn="$1"

      mseTmpParametersArray=("$@")
      mseTmpParametersArray=("${mseTmpParametersArray[@]:1}")
      mseTotalParans="${#mseTmpParametersArray[@]}"

      for ((i=0; i<mseTotalParans; i=i+2)); do
        ((v=i+1))
        if [ "${v}" -lt "${mseTotalParans}" ]; then
          msePH="${mseTmpParametersArray[$i]}"
          mseValue="${mseTmpParametersArray[$v]}"
          mseReturn=$(mse_str_replacePlaceHolder "${mseReturn}" "${msePH}" "${mseValue}")
        fi
      done

      printf "${mseReturn}"
    fi
  fi
}
MSE_GLOBAL_CMD["str replacePlaceHolder"]="mse_str_replacePlaceHolder"




#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_str_replacePlaceHolder_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=3
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="OriginalString :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="PlaceHolderName :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="NewValue :: r :: string"
}
