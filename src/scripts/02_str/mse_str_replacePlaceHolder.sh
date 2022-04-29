#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Substitui um 'placeholder' em uma string pelo valor indicado.
# Os 'placeholders' precisam ser definidos usando o seguinte padrão:
# [[PHNAME]]
#
# @param string $1
# Nome do placeholder que será substituido (sem os colchetes).
#
# @param string $2
# Valor que será usado no lugar do 'placeholder'
#
# @param string $3
# String que contém o 'placeholder' e que será retornada com a
# alteração feita.
#
# @return
# Printa a string original com a substituição do placeholder pelo
# novo conteúdo indicado.
mse_str_replacePlaceHolder() {
  local msePH="\[\[${1}\]\]"
  local mseNewValue="$2"
  local mseOriginalString="$3"

  printf "%s" "${mseOriginalString//${msePH}/${mseNewValue}}"
}





#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_str_replacePlaceHolder_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=3
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="PlaceHolderName :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="NewValue :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="OriginalString :: r :: string"
}
