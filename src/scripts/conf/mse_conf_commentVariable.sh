#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Permite editar um arquivo de configuração do tipo chave=valor e comentar uma
# variável indicada.
#
# Se o arquivo de configuração estiver mal formatado e existir dentro da mesma
# seção uma variável duplicada, apenas a primeira será levada em consideração.
#
# @param string $1
# Caminho até o arquivo alvo.
#
# @param string $2
# Nome da variável alvo.
#
# @param string $3
# Caracter usado para comentar a linha.
#
# @return
# Printa '1' se conseguir alterar o arquivo alvo ou se a variável
# já está no estado em que deveria ficar.
# Printa a mensagem do erro ocorrido.
mse_conf_commentVariable()
{
  local mseReturn

  declare -a mseParamData=("$@")
  declare -A mseParamRules
  mseParamRules["count"]=3
  mseParamRules["param_0"]="PathToFile :: r :: fileName"
  mseParamRules["param_1"]="VariableName :: r :: string"
  mseParamRules["param_2"]="CommentChar :: r :: char"

  mseReturn=$(mse_mmod_validateParams "mseParamRules" "mseParamData")
  if [ "$mseReturn" != 1 ]; then
    printf "%s" "${mseReturn}"
    return 1
  else
    mse_conf_comment "$1" "" "$2" "$3" "1"
  fi
}
