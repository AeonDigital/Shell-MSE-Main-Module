#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Identifica o número da primeira e da última linha de um arquivo ou de uma
# seção de dados identificada por um início e um fim objetivamente definido.
#
# No caso de estar buscando os dados de uma seção, tanto o número da linha
# que identifica o início da seção quanto o número da linha que identifica
# seu fim serão retornados.
#
# @param string $1
# Caminho até o arquivo alvo.
#
# @param char $2
# Caracter usado para comentar as linhas dentro do arquivo alvo.
#
# @param bool $3
# Identifica se trata-se de um arquivo de configuração ou outro tipo.
# Isto altera a forma como a seção é procurada.
#   - Omita ou use "0" para arquivos de qualquer tipo.
#   - Indique "1" se trata-se de um arquivo de configuração padrão.
#
# @param string $4
# Identificador do início da seção.
# Para arquivos em geral, a seção será identificada por uma linha cujo valor
# seja igual ao indicado. Já para arquivos de configuração, informe apenas o
# nome da seção pesquisada.
# Use "" se quiser ignorar esta definição.
#
# @param string $5
# Identificador do final da seção.
# Para arquivos em geral, o fim da seção será identificada por uma linha cujo
# valor seja igual ao indicado. Já para arquivos de configuração, este valor
# deve ser deixado em branco pois a seção termina ao iniciar uma nova ou ao
# termino do próprio arquivo.
#
# @param bool $6
# Omita, Use "" ou "0" para incluir as linhas vazias ao final da seção
# que está sendo pesquisada.
# Use "1" para remover as linhas em branco do final da seção alvo.
#
# @return
# Printa o número da linha de início e de fim separadas por um espaço.
# Não há retorno caso a seção ou o arquivo alvo não forem encontrados.
mse_file_boundaryLineNumbers() {
  local mseReturn=1

  if [ $# -ge 5 ] && [ -f "${1}" ]; then
    local msePathToFile="${1}"
    local mseCommentChar="${2}"
    local mseConfigFile="${3}"
    local mseSectionStart="${4}"
    local mseSectionEnd="${5}"
    local mseRemoveLastEmptyLines="${6}"

    local mseFirstLine
    local mseFirstLineNumber

    local mseLastLine
    local mseLastLineNumber

    local mseRawLines


    #
    # Sendo para pesquisar em todo o arquivo
    if [ "${mseSectionStart}" == "" ]; then
      mseFirstLineNumber="1"
      mseLastLineNumber=$(mse_file_countLines "$msePathToFile")
    else
      unset mseReadOptionsBLN
      declare -A mseReadOptionsBLN
      mse_file_prepareRead "mseReadOptionsBLN"


      if [ "${mseConfigFile}" == "1" ]; then
        #
        # Sendo uma pesquisa por um arquivo do tipo de configuração padrão
        # ou seja, onde as seções são definidas por uma linha do tipo:
        # [SECTION NAME]
        mseReadOptionsBLN["block_start_check"]="mse_file_read_checkSection_start"
        mseReadOptionsBLN["block_start_check_args"]="${mseSectionStart}"
        mseReadOptionsBLN["block_start_check_args_sep"]=","
        mseReadOptionsBLN["block_start_get_first_line"]="1"

        mseReadOptionsBLN["block_end_check"]="mse_file_read_checkSection_end"
      else
        #
        # Senão, se a seção que se está pesquisando é definida por alguma definição
        # arbitrária...
        mseReadOptionsBLN["block_start_check"]="mse_file_read_checkArbitratySection_start"
        mseReadOptionsBLN["block_start_check_args"]="${mseSectionStart}"
        mseReadOptionsBLN["block_start_check_args_sep"]=""
        mseReadOptionsBLN["block_start_get_first_line"]="1"

        mseReadOptionsBLN["block_end_check"]="mse_file_read_checkArbitratySection_end"
        mseReadOptionsBLN["block_end_check_args"]="${mseSectionEnd}"
        mseReadOptionsBLN["block_end_check_args_sep"]=""
        mseReadOptionsBLN["block_end_get_last_line"]="1"
      fi


      #
      # Resgata as linhas que envolvem toda a seção.
      mseRawLines=$(mse_file_read "${msePathToFile}" "mseReadOptionsBLN" 0 1)

      #
      # Sendo necessário, remove as linhas em branco do final da seção.
      if [ "${mseRemoveLastEmptyLines}" == "1" ]; then
        declare -a mseNewRawLines=()
        local mseLineRaw=""


        IFS=$'\n'
        while read mseLineRaw || [ -n "${mseLineRaw}" ]; do
          mseNewRawLines+=("${mseLineRaw}")
        done <<< "$mseRawLines"
        IFS=$' \t\n'


        local mseLength="${#mseNewRawLines[@]}"
        local mseREG='^[0-9]+[#]$'

        local mseI
        local mseLastInvalidLineIndex
        ((mseLastInvalidLineIndex=mseLength-1))

        for ((mseI=mseLastInvalidLineIndex; mseI>=0; mseI--)); do
          if [[ ! "${mseNewRawLines[$mseI]}" =~ $mseREG ]]; then
            ((mseLastInvalidLineIndex=mseI+1))
            break
          fi
        done

        mseRawLines=$(printf "%s\n" "${mseNewRawLines[@]:0:$mseLastInvalidLineIndex}")
      fi

      if [ "${mseRawLines}" != "" ]; then
        mseFirstLine="${mseRawLines%%[[:cntrl:]]*}"
        mseFirstLineNumber="${mseFirstLine%${mseCommentChar}*}"
        mseFirstLineNumber="${mseFirstLineNumber%*#}"

        mseLastLine="${mseRawLines##*[[:cntrl:]]}"
        mseLastLineNumber="${mseLastLine%${mseCommentChar}*}"
        mseLastLineNumber="${mseLastLineNumber%*#}"
      fi
    fi

    local mseCheck01=$(mse_check_isInteger "${mseFirstLineNumber}")
    local mseCheck02=$(mse_check_isInteger "${mseLastLineNumber}")

    if [ "${mseCheck01}" == "1" ] && [ "${mseCheck02}" == "1" ]; then
      mseReturn=0
      printf "%s" "${mseFirstLineNumber} ${mseLastLineNumber}"
    fi
  fi

  return "${mseReturn}"
}
MSE_GLOBAL_CMD["file boundaryLineNumbers"]="mse_file_boundaryLineNumbers"




#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_file_boundaryLineNumbers_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=6
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="PathToFile :: r :: fileName"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="CommentChar :: r :: char"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="ConfigFile :: r :: bool"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_3"]="SectionStart :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_4"]="SectionEnd :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_5"]="RemoveLastEmptyLines :: o :: bool :: 0"
}
