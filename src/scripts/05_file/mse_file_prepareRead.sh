#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Prepara um array associativo preenchendo as chaves necessárias para a
# execução de um comando "mse_file_read".
#
# Se nenhum critério de configuração for passado, todo o documento será
# considerado válido.
#
# A configuração é feita em cinco blocos sendo:
#
# - Bloco 01: Controle em nível de bloco
#   permite identificar qual trecho do documento deve ser retornado ou a
#   partir de onde que ele deve passar a ser ignorado.
#
# - Bloco 02: Controle em nível de linha
#   permite passar regras que farão a validação linha a linha por aquelas
#   que devem ser retornadas.
#
# - Bloco 03: Controles de transformação
#   Configura transformações a serem aplicadas nas linhas que serão retornadas.
#
# - Bloco 03: Outras configurações
#   Uso geral para configurações que não se enquadram necessariamente em alguma
#   das citadas acima.
#
#
# @param string $1
# Nome do array associativo que será preenchido.
#
#
#
# [[ Bloco 01: Controle em nível de bloco ]]
#
# @param string $2
# ["block_start_check"]
# Indica o nome de uma função validadora que pode identificar o início de uma
# parte "válida" de um arquivo que se deseja retornar.
#
# Manter este valor vazio fará com que todo o conteúdo do arquivo seja
# considerado como "retornável".
# Já, ao contrário, ao indicar uma função validadora fará com que todas as
# linhas sejam consideradas "não retornáveis" até chegar em alguma cujo
# teste retorne positivo.
#
# Veja na seção "FUNÇÕES VALIDADORAS" abaixo a interface das funções que podem
# ser definidas aqui.
#
# @param string $3
# ["block_start_check_args"]
# Permite passar alguma informação que será usada na função validadora como um
# argumento extra.
#
# @param string $4
# ["block_start_check_args_sep"]
# Indica o caracter que deve ser usado para "splitar" a coleção de argumentos
# passados em "block_start_check_args".
#
# @param bool $5
# ["block_start_get_first_line"]
# Indique "" ou "0" para que a linha inicial de um bloco válido seja omitida.
# Indique "1" para que esta primeira linha identificada seja também retornada.
#
# @param string $6
# ["block_end_check"]
# Indica o nome de uma função validadora que marcará o final de uma parte
# "válida" de um arquivo que se deseja retornar.
#
# Veja na seção "FUNÇÕES VALIDADORAS" abaixo a interface das funções que podem
# ser definidas aqui.
#
# @param string $7
# ["block_end_check_args"]
# Permite passar alguma informação que será usada na função validadora como um
# argumento extra.
#
# @param string $8
# ["block_end_check_args_sep"]
# Indica o caracter que deve ser usado para "splitar" a coleção de argumentos
# passados em "block_end_check_args".
#
# @param bool $9
# ["block_end_get_last_line"]
# Indique "" ou "0" para que a linha final de um bloco válido seja omitida.
# Indique "1" para que esta última linha identificada seja também retornada.
#
# @param bool $10
# ["block_check_invert"]
# Indique "1" para inverter a saida da função definida em "block_start_check"
# e "block_end_check".
#
#
#
# [[ Bloco 02: Controle em nível de linha ]]
#
# @param bool $11
# ["line_check"]
# Indica o nome de uma função validadora que permite identificar se a linha
# atualmente sendo processada deve ser retornada.
#
# Manter este valor vazio fará com que todos linhas dentro de um bloco válido
# seja "retornavél".
# Já, ao contrário, ao indicar uma função validadora fará com que todas as
# linhas sejam consideradas "não retornáveis" exceto aquelas que passarem no
# teste proposto.
#
# Veja na seção "FUNÇÕES VALIDADORAS" abaixo a interface das funções que podem
# ser definidas aqui.
#
# @param string $12
# ["line_check_args"]
# Permite passar alguma informação que será usada na função validadora como um
# argumento extra.
#
# @param string $13
# ["line_check_args_sep"]
# Indica o caracter que deve ser usado para "splitar" a coleção de argumentos
# passados em "line_check_args".
#
# @param bool $14
# ["line_check_invert"]
# Indique "1" para inverter a saida da função definida em "line_check".
#
# @param bool $15
# ["line_check_has_linenumber"]
# Use "1" para indicar que as linhas sendo processadas estão vindo com seus
# respectivos números em seu início.
#
#
#
# [[ Bloco 03: Controles de transformação ]]
#
# @param string $16
# ["line_transform"]
# Indica o nome de uma função que irá receber como argumentos as mesmas
# informações que as funções validadoras mas, neste caso, irá promover uma
# transformação na linha, permitindo que ela seja vista de forma diferente
# daquela que está atualmente registrada no arquivo.
# Nenhuma alteração será feita no arquivo em si.
#
# Veja na seção "FUNÇÕES TRANSFORMADORAS" abaixo a interface das funções que
# podem ser definidas aqui.
#
# @param string $17
# ["line_transform_args"]
# Permite passar alguma informação que será usada na função transformadora
# como um argumento extra.
#
# @param string $18
# ["line_transform_args_sep"]
# Indica o caracter que deve ser usado para "splitar" a coleção de argumentos
# passados em "line_transform_args".
#
# @param bool $19
# ["line_transform_has_linenumber"]
# Use "1" para indicar que as linhas sendo processadas estão vindo com seus
# respectivos números em seu início.
#
#
#
# [[ Bloco 04: Outras configurações ]]
#
# @param bool $20
# ["line_hide_empty"]
# Se "" ou "0" irá mostrar todas as linhas incluindo as vazias.
# Se "1" irá remover as linhas vazias.
#
# @param bool $21
# ["line_show_number"]
# Se "" ou "0" irá trazer o valor bruto da linha, tal qual ela consta no
# arquivo original.
# Se "1" irá apresentar o número de cada linha em seu início.
# O número da linha será retornado como primeira informação e estará
# separada do início do texto por um caracter '#'.
#
#
#
# ---
#
# [[ FUNÇÕES VALIDADORAS ]]
# Usadas tanto para identificar o início e o fim de uma seção quanto para
# verificar se uma linha contém o tipo de informação que se está procurando
# tais funções devem seguir a seguinte interface:
#
# Descrição da verificação sendo realizada.
#
# @param string $1
# Nome do array associativo que traz as configurações para leitura sendo
# usadas no momento.
#
# @param int $2
# Número da linha sendo verificada.
#
# @param string $3
# Conteúdo da linha sendo verificada.
#
# @param bool $4
# Use "0" para informar que as linhas sendo processadas estão em formato "raw"
# (tal qual no arquivo original).
# Use "1" para informar que há, no conteúdo de cada linha, a informação de seu
# respectivo número dentro do arquivo alvo.
#
# @param string $5
# Argumento opcional para complementar a verificação.
# Conforme a implementação pode ser obrigatorio.
#
# @return
# Printa '1' se o teste for positivo.
# Printa '0' se o teste for negativo.
#
#
#
# ---
#
# [[ FUNÇÕES TRANSFORMADORAS ]]
# Usadas para transformar as informações das linhas identificadas como válidas
# tais funções devem seguir a seguinte interface:
#
# Descrição da transformação sendo realizada.
#
# @param string $1
# Nome do array associativo que traz as configurações para leitura sendo
# usadas no momento.
#
# @param int $2
# Número da linha sendo transformada.
#
# @param string $3
# Conteúdo da linha sendo transformada.
#
# @param bool $4
# Indique "0" para informar que as linhas sendo processadas estão em formato
# 'raw' (tal qual no arquivo original).
# Indique "1" para informar que há, no conteúdo de cada linha, há a informação
# de seu respectivo número dentro do arquivo alvo.
#
# @param string $5
# Argumento opcional para complementar a verificação.
# Conforme a implementação pode ser obrigatorio.
#
# @return
# Traz a string original transformada conforme indicado na descrição.
# ---
#
mse_file_prepareRead() {
  declare -n mseArrAssoc="${1}"

  #
  # Remove todas as entradas atualmente definidas no array indicado sem
  # destruí-lo
  local mseKey=""
  for mseKey in "${!mseArrAssoc[@]}"; do
    unset mseArrAssoc["${mseKey}"]
  done

  mseArrAssoc["block_start_check"]=""
  mseArrAssoc["block_start_check_args"]=""
  mseArrAssoc["block_start_check_args_sep"]=""
  mseArrAssoc["block_start_get_first_line"]=""

  mseArrAssoc["block_end_check"]=""
  mseArrAssoc["block_end_check_args"]=""
  mseArrAssoc["block_end_check_args_sep"]=""
  mseArrAssoc["block_end_get_last_line"]=""

  mseArrAssoc["block_check_invert"]=""


  mseArrAssoc["line_check"]=""
  mseArrAssoc["line_check_args"]=""
  mseArrAssoc["line_check_args_sep"]=""
  mseArrAssoc["line_check_invert"]=""
  mseArrAssoc["line_check_has_linenumber"]=""


  mseArrAssoc["line_transform"]=""
  mseArrAssoc["line_transform_args"]=""
  mseArrAssoc["line_transform_args_sep"]=""
  mseArrAssoc["line_transform_has_linenumber"]=""


  mseArrAssoc["line_hide_empty"]=""
  mseArrAssoc["line_show_number"]=""



  unset block_start_check_args_array
  declare -ga block_start_check_args_array=()

  unset block_end_check_args_array
  declare -ga block_end_check_args_array=()

  unset line_check_args_array
  declare -ga line_check_args_array=()

  unset line_transform_args_array
  declare -ga line_transform_args_array=()



  #
  # Bloco 01: Controle em nível de bloco
  if [ "${2}" != "" ]; then
    mseArrAssoc["block_start_check"]="${2}"
    mseArrAssoc["block_start_check_args"]="${3}"
    mseArrAssoc["block_start_check_args_sep"]="${4}"
    mseArrAssoc["block_start_get_first_line"]="${5}"

    if [ "${5}" != "0" ] && [ "${5}" != "1" ]; then
      mseArrAssoc["block_start_get_first_line"]="0"
    fi
  fi

  if [ "${6}" != "" ]; then
    mseArrAssoc["block_end_check"]="${6}"
    mseArrAssoc["block_end_check_args"]="${7}"
    mseArrAssoc["block_end_check_args_sep"]="${8}"
    mseArrAssoc["block_end_get_last_line"]="${9}"

    if [ "${9}" != "0" ] && [ "${9}" != "1" ]; then
      mseArrAssoc["block_end_get_last_line"]="0"
    fi
  fi

  if [ "${2}" != "" ] || [ "${6}" != "" ]; then
    mseArrAssoc["block_check_invert"]="${10}"

    if [ "${10}" != "0" ] && [ "${10}" != "1" ]; then
      mseArrAssoc["block_check_invert"]="0"
    fi
  fi



  #
  # Bloco 02: Controle em nível de linha
  if [ "${11}" != "" ]; then
    mseArrAssoc["line_check"]="${11}"
    mseArrAssoc["line_check_args"]="${12}"
    mseArrAssoc["line_check_args_sep"]="${13}"
    mseArrAssoc["line_check_invert"]="${14}"
    mseArrAssoc["line_check_has_linenumber"]="${15}"

    if [ "${14}" != "0" ] && [ "${14}" != "1" ]; then
      mseArrAssoc["line_check_invert"]="0"
    fi

    if [ "${15}" != "0" ] && [ "${15}" != "1" ]; then
      mseArrAssoc["line_check_has_linenumber"]="0"
    fi
  fi



  #
  # Bloco 03: Controles de transformação
  if [ "${16}" != "" ]; then
    mseArrAssoc["line_transform"]="${16}"
    mseArrAssoc["line_transform_args"]="${17}"
    mseArrAssoc["line_transform_args_sep"]="${18}"
    mseArrAssoc["line_transform_has_linenumber"]="${19}"

    if [ "${19}" != "0" ] && [ "${19}" != "1" ]; then
      mseArrAssoc["line_transform_has_linenumber"]="0"
    fi
  fi



  #
  # Bloco 04: Outras configurações
  mseArrAssoc["line_hide_empty"]="${20}"
  if [ "${20}" != "0" ] && [ "${20}" != "1" ]; then
    mseArrAssoc["line_hide_empty"]="0"
  fi

  mseArrAssoc["line_show_number"]="${21}"
  if [ "${21}" != "0" ] && [ "${21}" != "1" ]; then
    mseArrAssoc["line_show_number"]="0"
  fi
}
MSE_GLOBAL_CMD["file prepareRead"]="mse_file_prepareRead"




#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_file_prepareRead_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=21
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="AssocArrayName :: r :: assocName"

  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="BlockStartCheck :: o :: functionName"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="BlockStartCheckArgs :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_3"]="BlockStartCheckArgsSep :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_4"]="BlockStartGetFirstLine :: o :: bool :: 0"

  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_5"]="BlockEndCheck :: o :: functionName"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_6"]="BlockEndCheckArgs :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_7"]="BlockEndCheckArgsSep :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_8"]="BlockEndGetLastLine :: o :: bool :: 0"

  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_9"]="BlockCheckInvert :: o :: bool :: 0"


  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_10"]="LineCheck :: o :: functionName"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_11"]="LineCheckArgs :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_12"]="LineCheckArgsSep :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_13"]="LineCheckInvert :: o :: bool :: 0"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_14"]="LineCheckHasLineNumber :: o :: bool :: 0"


  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_15"]="LineTransform :: o :: functionName"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_16"]="LineTransformArgs :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_17"]="LineTransformArgsSep :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_18"]="LineTransformLineNumber :: o :: bool :: 0"


  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_19"]="LineHideEmpty :: o :: bool :: 0"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_20"]="LineShowNumber :: o :: bool :: 0"
}
