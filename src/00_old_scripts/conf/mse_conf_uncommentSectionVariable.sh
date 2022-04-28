#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Permite editar um arquivo de configuração do tipo chave=valor e descomentar
# uma variável indicada.
#
# Se o arquivo de configuração estiver mal formatado e existir dentro da mesma
# seção uma variável duplicada, apenas a primeira será levada em consideração.
#
# @param string $1
# Caminho até o arquivo alvo.
#
# @param string $2
# Nome da seção alvo.
#
# @param string $3
# Nome da variável alvo.
#
# @param string $4
# Caracter usado para comentar a linha.
#
# @return
# Printa '1' se conseguir alterar o arquivo alvo ou se a variável
# já está no estado em que deveria ficar.
# Ou
# Printa a mensagem do erro ocorrido.
mse_conf_uncommentSectionVariable()
{
  local mseReturn

  declare -a mseParamData=("$@")
  declare -A mseParamRules
  mseParamRules["count"]=4
  mseParamRules["param_0"]="PathToFile :: r :: fileName"
  mseParamRules["param_1"]="SectionName :: r :: string"
  mseParamRules["param_2"]="VariableName :: r :: string"
  mseParamRules["param_3"]="CommentChar :: r :: char"

  mseReturn=$(mse_mmod_validateParams "mseParamRules" "mseParamData")
  if [ "$mseReturn" != 1 ]; then
    printf "%s" "${mseReturn}"
    return 1
  else
    mse_conf_mainComment "$1" "$2" "$3" "$4" "0"
  fi

  # Apenas a primeira ocorrência.
  # sed -i "/^$3.*$2\s*=/{s/^$3//;:A;n;bA}" "$4";
  # Todas ocorrencias
  # sed -i "/^\[$1\]$/,/^\[/ s/^\s*$3\(.*$2\s*=.*\)$/\1/" "$4";
}