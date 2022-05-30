#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Mostra os atributos de fonte que podem ser utilizados para a
# estilização das mensagens da interface.
#
# @param string $1
# Opcional.
# Indica o formato que os atributos devem ser apresentados.
#
# Use 'list' ou omita este parametro para ver uma lista linha a linha
# com o nome de cada atributo.
#
# Use 'table' para ver as cores em um formato de tabela.
#
# @param int $2
# Opcional.
# Indique a quantidade de itens por linha que devem ser mostrados.
# Se omitido, assumirá o total de 6 itens por linha.
#
# @return
# Printa na tela as opções de atributos conforme o formato de apresentação
# selecionado
mse_font_showAttributes() {
  local i
  local mseFormat="list"
  local mseLength=${#MSE_MD_ICOLOR_AVAILABLE_FONT_ATTRIBUTE_NAMES[@]}
  local mseLine
  local mseRawTable
  local mseLineItens=6


  if [ $# -ge 1 ]; then
    mseFormat="$1"
  fi
  if [ $# == 2 ]; then
    local isInt=$(mse_check_isInteger $2)
    if [ $isInt == 1 ]; then
      mseLineItens=$2
    fi
  fi


  for (( i=0; i<mseLength; i++)); do
    mseAttrName=${MSE_MD_ICOLOR_AVAILABLE_FONT_ATTRIBUTE_NAMES[$i]}

    if [ "${mseAttrName}" != "NONE" ]; then

      mseLine="${mseAttrName}"
      if [ "${mseFormat}" == "list" ]; then
        mseLine+="\n"
      elif [ "${mseFormat}" == "table" ]; then
        if (( i % mseLineItens != 0 )); then
          mseLine+=" : "
        else
          mseLine+="\n"
        fi
      fi

      mseRawTable+="${mseLine}"
    fi
  done

  printf "NONE\n"
  mseRawTable=$(printf "${mseRawTable}")
  column -e -t -s ":" <<< "${mseRawTable}"
}





#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_font_showAttributes_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=2
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="Format :: o :: list :: list"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0_labels"]="list, table"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0_values"]="list, table"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="ItensPerLine :: o :: int :: 6"
}
