#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Imprime na tela o valor da variável pesquisada.
#
# Se o arquivo de configuração estiver mal formatado e existir uma variável
# duplicada, apenas a primeira será levada em consideração.
#
# @param string $1
# Caminho até o arquivo que deve ser verificado.
#
# @param string $2
# Nome da seção alvo.
# Use "" para procurar a variável em todo o arquivo.
#
# @param string $3
# Nome da variável alvo.
#
# @return
# Printa o valor da variável indicada.
# Atenção para casos em que o valor da variável é vazio ( "" ) pois o fato
# de não obter uma saída pode ser interpretado da mesma forma que se ela
# não existisse no arquivo de configuração ou seção indicada.
mse_conf_showVariableValue() {
  local mseReturn

  mseReturn=$(mse_conf_showVariableLine "$1" "$2" "$3" "0")
  if [ "${mseReturn}" != "" ]; then
    mseReturn=$(mse_str_trimD "=" "${mseReturn}")
    printf "${mseReturn#${3}=}"
  fi
}
MSE_GLOBAL_CMD["show variableValue"]="mse_conf_showVariableValue"




#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_conf_showVariableValue_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=3
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="PathToFile :: r :: fileName"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="SectionName :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="VariableName :: r :: string"
}
