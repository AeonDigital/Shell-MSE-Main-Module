#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Mostra as cores básicas de fonte que podem ser utilizados para a
# estilização das mensagens da interface.
#
# @param string $1
# Opcional.
# Indica o formato que as cores devem ser apresentadas.
#
# Use 'list' ou omita este parametro para ver uma lista linha a linha
# com o nome de cada cor já estilizada.
#
# Use 'table' para ver as cores em um formato de tabela.
#
# Use 'codes' para ver a correlação de cores, nomes, variáveis e aparencia.
#
# @param int $2
# Opcional.
# Indique a quantidade de itens por linha que devem ser mostrados.
# Se omitido, assumirá o total de 8 itens por linha.
#
# @return
# Printa na tela as opções de atributos conforme o formato de apresentação
# selecionado
mse_font_showColors() {

  local i
  local mseLength=${#MSE_MD_ICOLOR_AVAILABLE_COLOR_NAMES[@]}
  local mseFormat="list"

  local mseColorRaw
  local mseColorVar
  local mseColorCod
  local mseLine
  local mseRawTable
  local mseLineItens=8
  local mseColorName



  if [ $# -ge 1 ]; then
    mseFormat="$1"
  fi
  if [ $# == 2 ]; then
    local isInt=$(mse_check_isInteger $2)
    if [ $isInt == 1 ]; then
      mseLineItens=$2
    fi
  fi



  if [ $mseFormat == "list" ] || [ $mseFormat == "table" ]; then
    for (( i=0; i<mseLength; i++ )); do
      mseColorRaw=${MSE_MD_ICOLOR_AVAILABLE_COLOR_NAMES[$i]}

      if [ "${mseColorRaw}" != "NONE" ]; then
        mseColorVar="mse${mseColorRaw}"
        mseColorCod="\\${!mseColorVar}"

        mseLine="${!mseColorVar}${mseColorRaw}${mseNONE}"
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



    if [ "${mseFormat}" == "list" ]; then
      printf "NONE\n"
      printf "${mseRawTable}"
    elif [ "${mseFormat}" == "table" ]; then
      printf "NONE\n"
      mseRawTable=$(printf "${mseRawTable}")
      column -e -t -s ":" <<< "${mseRawTable}"
    fi
  elif [ $mseFormat == "codes" ]; then
    mseRawTable="${lbl_mmod_showTextColors_TableHeaders}\n"

    for (( i=0; i<mseLength; i++)); do
      mseColorName=${MSE_MD_ICOLOR_AVAILABLE_COLOR_LABELS[$i]}
      mseColorRaw=${MSE_MD_ICOLOR_AVAILABLE_COLOR_NAMES[$i]}
      mseColorVar="mse${mseColorRaw}"
      mseColorCod="\\${!mseColorVar}"

      mseLine="${mseColorName}:${mseColorRaw}:${mseColorCod}:${!mseColorVar}myShellEnv${mseNONE} \n"
      mseRawTable+="${mseLine}"
    done

    mseRawTable=$(printf "${mseRawTable}")
    mseRawTable=$(sed 's/^\s*//g' <<< "${mseRawTable}" | sed 's/\s*$//g' | sed 's/\s*:/:/g' | sed 's/:\s*/:/g')
    column -e -t -s ":" <<< "${mseRawTable}"
  fi
}





#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_mmod_fontShowColors_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=2
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="Format :: o :: list :: list"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0_labels"]="list, table, codes"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0_values"]="list, table, codes"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="ItensPerLine :: o :: int :: 8"
}
