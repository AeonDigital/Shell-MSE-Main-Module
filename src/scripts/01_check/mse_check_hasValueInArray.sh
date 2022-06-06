#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Identifica se o valor indicado existe no array alvo.
#
# @param string $1
# Valor que está sendo pesquisado.
#
# @param string $2
# Nome do array em que a pesquisa deve ser feita.
#
# @param bool $3
# Indica se a verificação deve ser feita em "case insensitive"
#   - Omita ou indique "0" para "case sensitive" (padrão)
#   - Indique "1" para "case insensitive"
#
# @param bool $4
# Tipo de retorno esperado.
#   - Omita ou indique "0" retornar apenas "1" ou "0" indicando
#     a presença ou ausência do elemento no array alvo.
#   - Indique "1" para retornar o índice do elemento identificado.
#     Se nada for encontrado, retornará uma string vazia "".
#
# @return
# Varia conforme o parametro $4
# Se o parametro $4 for omitido ou "0", retornará:
#   - '1' se 'true'   : elemento encontrado no array
#   - '0' se 'false'  : elemento não encontrado no array
#
# Se o parametro $4 for "1"
#   - Retorna o índice do elemento se ele for encontrado.
#   - Retorna "" se o elemento não existir.
#
# Se mais de um valor no array alvo for compatível com a verificação
# a informação referente ao primeiro encontrado é que será levada em
# conta
mse_check_hasValueInArray() {
  local mseSearchValue="$1"
  declare -n arrayName="$2"
  local mseArrayLength="${#arrayName[@]}"

  local mseCaseInsensitive
  local mseReturnIndex


  #
  # Identifica se a comparação deve ser "case sensitive|insensitive"
  mseCaseInsensitive=0
  if [ $# -ge 3 ] && [ "$3" == "1" ]; then
    mseCaseInsensitive=1
  fi

  #
  # Identifica se o retorno esperado é o índice do elemento encontrado
  # ou apenas a indicação de que o elemento existe ou não no array alvo.
  mseReturnIndex=0
  if [ $# -ge 4 ] && [ "$4" == "1" ]; then
    mseReturnIndex=1
  fi



  local i
  local mseResultIndex=""
  local mseResultBool=0

  #
  # Se a consulta deve ser feita de forma a diferenciar maiúsculas e
  # minúsculas...
  if [ "${mseCaseInsensitive}" == "0" ]; then
    for ((i=0; i<mseArrayLength; i++)); do
      if [ "${arrayName[$i]}" == "${mseSearchValue}" ]; then
        mseResultIndex="$i"
        mseResultBool="1"
        break
      fi
    done
  elif [ "${mseCaseInsensitive}" == "1" ]; then
    for ((i=0; i<mseArrayLength; i++)); do
      if [ "${arrayName[$i]^^}" == "${mseSearchValue^^}" ]; then
        mseResultIndex="$i"
        mseResultBool="1"
        break
      fi
    done
  fi

  if [ "${mseReturnIndex}" == "1" ]; then
    printf "%s" "${mseResultIndex}"
  else
    printf "%s" "${mseResultBool}"
  fi
}
MSE_GLOBAL_CMD["hasValueInArray"]="mse_check_hasValueInArray"




#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_check_hasValueInArray_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=4
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="Value :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="ArrayName :: r :: arrayName"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="CaseInsensitive :: o :: bool"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_3"]="ReturnIndex :: o :: bool"
}
