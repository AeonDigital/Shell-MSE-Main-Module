#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Identifica o número da primeira e da última linha de um arquivo, se definida,
# identificará o número da linha de início e fim de uma seção de dados no
# arquivo de configuração.
# No caso de estar buscando os dados de uma seção, a linha de início será a
# própria linha onde se encontra o header da seção.
#
# @param string $1
# Caminho até o arquivo alvo.
#
# @param string $2
# Nome da seção alvo.
# Use "" para buscar os limites do arquivo inteiro.
#
# @param char $3
# Caracter usado para comentar a linha.
#
# @return
# Printa o número da linha de início e de fim separadas por um espaço.
# Não há retorno caso a seção ou o arquivo alvo não forem encontrados.
mse_conf_showBoundaryLinesNumbers()
{
  local mseCharC
  local mseFirstLine
  local mseFirstLineNumber
  local mseLastLine
  local mseLastLineNumber

  #
  # sendo para pesquisar em todo o arquivo.
  if [ $# == 1 ] || [ "$2" == "" ]; then
    mseFirstLineNumber="1"
    mseLastLineNumber=$(mse_file_countLines "$1")
  elif [ $# -ge 3 ]; then
    mse_file_read_resetConfig

    MSE_GLOBAL_MODULE_READ_BLOCK["start"]="mse_file_read_checkSection_start"
    MSE_GLOBAL_MODULE_READ_BLOCK["start_args"]="$2"
    MSE_GLOBAL_MODULE_READ_BLOCK["start_args_sep"]=","
    MSE_GLOBAL_MODULE_READ_BLOCK["end"]="mse_file_read_checkSection_end"
    MSE_GLOBAL_MODULE_READ_BLOCK["print_start_line"]="1"

    local mseRawLines=$(mse_file_read "$1" 0 "1")
    if [ "$mseRawLines" != "" ]; then
      mseCharC="$3"

      mseFirstLine="${mseRawLines%%[[:cntrl:]]*}"
      mseFirstLineNumber="${mseFirstLine%${mseCharC}*}"
      mseFirstLineNumber="${mseFirstLineNumber%*${mseCharC}}"

      mseLastLine="${mseRawLines##*[[:cntrl:]]}"
      mseLastLineNumber="${mseLastLine%${mseCharC}*}"
      mseLastLineNumber="${mseLastLineNumber%*${mseCharC}}"
    fi
  fi

  printf "%s" "${mseFirstLineNumber} ${mseLastLineNumber}"
}





#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_conf_showBoundaryLinesNumbers_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=3
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="PathToFile :: r :: fileName"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="SectionName :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="CommentChar :: r :: char"
}
