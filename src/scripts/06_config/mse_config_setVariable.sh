#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Permite editar variáveis armazenadas em arquivos de configuração padrão ou
# em scripts preparados para tal.
#
# Arquivos de configuração padrão usa valores definidos em pares do tipo
# chave/valor e que podem ter suas configurações separadas logicamente por
# seções.
#
# Ex:
# [SectionName]
# VARNAME   = VALUE
#
# Se o arquivo de configuração estiver mal formatado e existir dentro da mesma
# seção uma variável duplicada, apenas a primeira será levada em consideração.
#
#
# Outros arquivos, tipo scripts, precisam estar preparados para serem editados
# usando esta função. Tal preparo é a marcação das zonas editáveis. No caso,
# cada variável que se deseja poder alterar desta forma deve estar identificada
# conforme o modelo abaixo:
#
# Ex:
# # [[INI-MSE_AVAILABLE_MODULES]]
# declare -gA MSE_AVAILABLE_MODULES
# # [[END-MSE_AVAILABLE_MODULES]]
#
# Importante notar que as marcações "INI" e "END" DEVEM estar comentadas e no
# início da linha e o nome de cada seção deve ser idêntico à variável que ela
# está habilitando a edição.
#
# @param string $1
# Caminho até o arquivo alvo.
#
# @param char $2
# Caracter usado para comentar as linhas dentro do arquivo alvo.
#
# @param bool $3
# Identifica se trata-se de um arquivo de configuração ou script.
# Isto altera a forma como a seção editável é procurada.
#   - Omita ou use "0" para arquivos de scripts.
#   - Indique "1" se trata-se de um arquivo de configuração padrão.
#
# @param string $4
# Identificador do início da seção alvo.
# Use apenas para edição de arquivos de configuração padrão.
#
# @param string $5
# Tipo de variável que está sendo usada
#   - Use "s" ou "scalar" para variáveis simples.
#   - Use "i" ou "index" para arrays unidimencionais.
#   - Use "a" ou "assoc" para arrays associativos.
#
# @param string $6
# Nome da variável alvo no arquivo.
#
# @param string $7
# Valor da variável.
# Para variáveis "index" ou "assoc" informe o nome de um array de mesmo tipo
# que contenha os valores que serão usados.
#
# @param string $8
# Tipo da operação que será realizada:
#   - add       | a   : para adicionar uma nova variável.
#   - delete    | d   : para remover uma variável existente.
#   - change    | ch  : para alterar o valor de uma variável.
#   - comment   | c   : para comentar uma variável.
#   - uncomment | u   : para descomentar uma variável.
#
# Use apenas para edição de arquivos de configuração padrão.
#
# @param string $9
# Opcional. Indica a posição em que a variável deve ser adicionada.
# Usado apenas em caso de operação 'add'.
# - prepend   | p   : Adiciona a variável no início do arquivo/seção.
# - append    | a   : Adiciona a variável no final do arquivo/seção.
#                     Esta é a operação padrão em caso de operação 'add'
#
# Use apenas para edição de arquivos de configuração padrão.
#
# @return
# Printa '1' se conseguir efetuar a alteração exigida.
# Ou
# Printa a mensagem do erro ocorrido.
mse_config_setVariable() {
  local mseReturn

  local msePathToFile="${1}"
  local mseCommentChar="${2}"
  local mseConfigFile="${3}"
  local mseSectionNameStart="${4}"
  local mseSectionNameEnd=""

  local mseVarType="${5}"
  local mseVarName="${6}"
  local mseVarValue="${7}"
  declare -n mseVarArrName

  local mseOperation="${8}"
  local msePosition=""





  mseReturn=1
  if [ $# -lt 8 ]; then
    local mseArgs="$#"
    local mseLost
    ((mseLost=8-mseArgs))

    mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_lostParameters}" "LOST" "${mseLost}")
  else
    #
    # Verifica o arquivo
    if [ "$msePathToFile" == "" ]; then
      mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_IsRequired}" "PARAM_A" "PathToFile")
    elif [ ! -f "$msePathToFile" ]; then
      mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_PointsToNonExistentFile}" "PARAM_A" "PathToFile")
    fi

    #
    # Verifica o caracter de comentário
    if [ "${mseReturn}" == "1" ] && [ "${mseConfigFile}" == "1" ] && [ "$mseCommentChar" == "" ]; then
      mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_IsRequired}" "PARAM_A" "CommentChar")
    fi

    #
    # Verifica se trata-se de um arquivo de configuração padrão
    if [ "${mseReturn}" == "1" ]; then
      if [ "${mseConfigFile}" == "" ]; then
        mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_IsRequired}" "PARAM_A" "ConfigFile")
      elif [ "${mseConfigFile}" != "0" ] && [ "${mseConfigFile}" != "1" ]; then
        mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_HasInvalidValue}" "PARAM_A" "ConfigFile")
      fi
    fi

    #
    # Verifica se o tipo de variável está definido e é válido
    if [ "${mseReturn}" == "1" ]; then
      if [ "${mseVarType}" == "" ]; then
        mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_IsRequired}" "PARAM_A" "VarType")
      else
        case "${mseVarType}" in
          s | scalar)
            mseVarType="s"
          ;;
          i | index)
            mseVarType="i"
          ;;
          a | assoc)
            mseVarType="a"
          ;;
          *)
            mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_HasInvalidValue}" "PARAM_A" "VarType")
          ;;
        esac
      fi
    fi

    #
    # Verifica o nome da variável
    if [ "${mseReturn}" == "1" ] && [ "${mseVarName}" == "" ]; then
      mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_IsRequired}" "PARAM_A" "VarName")
    else
      #
      # Em caso de edição em arquivos do tipo "script"
      # gera os marcadores de início e fim da seção alvo
      if [ "${mseConfigFile}" == "0" ]; then
        mseSectionNameStart="${mseCommentChar} [[INI-${mseVarName}]]"
        mseSectionNameEnd="${mseCommentChar} [[END-${mseVarName}]]"
      fi
    fi

    #
    # Verifica o valor da variável se ela não for do tipo "scalar"
    if [ "${mseReturn}" == "1" ] && [ "${mseVarType}" != "s" ]; then
      local mseArrDeclare=$(declare -p "${mseVarValue}" 2> /dev/null)

      if [ "${mseVarType}" == "i" ] && [[ ! "${mseArrDeclare}" =~ "declare -a" ]]; then
        mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_MustBeAnArray}" "PARAM_A" "VarValue")
      elif [ "${mseVarType}" == "a" ] && [[ ! "${mseArrDeclare}" =~ "declare -A" ]]; then
        mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_MustBeAnAssocArray}" "PARAM_A" "VarValue")
      else
        mseVarArrName="${mseVarValue}"
      fi
    fi

    #
    # Identifica o tipo de operação que será feita
    if [ "${mseConfigFile}" == "1" ] && [ "$mseReturn" == 1 ]; then
      case "$mseOperation" in
        add | a)
          mseOperation="a"
        ;;
        delete | d)
          mseOperation="d"
        ;;
        change | ch)
          mseOperation="ch"
        ;;
        comment | c)
          mseOperation="c"
        ;;
        uncomment | u)
          mseOperation="u"
        ;;
        *)
          mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_HasInvalidOption}" "PARAM_A" "Operation")
        ;;
      esac
    fi

    #
    # Em caso de operação 'add'
    # Identifica a posição que deve ser usada como referência para
    # a nova variável.
    if [ "${mseConfigFile}" == "1" ] && [ "$mseReturn" == 1 ] && [ "$mseOperation" == "a" ]; then
      msePosition="a"

      if [ $# -ge 9 ] && [ "${9}" != "" ]; then
        case "${9}" in
          prepend | p)
            msePosition="p"
          ;;
          append | a)
            msePosition="a"
          ;;
          *)
            mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_HasInvalidOption}" "PARAM_A" "Position")
          ;;
        esac
      fi
    fi
  fi





  #
  # Identifica o número das linhas que podem ser alvo da edição
  local mseTargetSectionLines
  local mseTargetSectionFirstLine
  local mseTargetSectionLastLine

  if [ "$mseReturn" == 1 ]; then
    #
    # Resgata o número da linha inicial e final que envolvem a seção da variável alvo.
    mseTargetSectionLines=$(mse_file_boundaryLineNumbers "${msePathToFile}" "${mseCommentChar}" "${mseConfigFile}" "${mseSectionNameStart}" "${mseSectionNameEnd}")

    #
    # Executa um split no valor obtido para ver se trata-se de 2 inteiros
    mse_str_split " " "${mseTargetSectionLines}"
    if [ "${#MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}" != 2 ]; then
      mseReturn="${lbl_err_cannotIdentifyTargetLine}"
    else
      mseTargetSectionFirstLine="${MSE_GLOBAL_MODULE_SPLIT_RESULT[0]}"
      mseTargetSectionLastLine="${MSE_GLOBAL_MODULE_SPLIT_RESULT[1]}"
    fi
  fi





  #
  # Para arquivos de configuração padrão,
  # verifica se há alguma inconsistência para a execução do comando
  local mseTargetVarRawLine
  local mseTargetVarLineNumber
  local mseTargetVarIsCommented

  if [ "$mseReturn" == 1 ] && [ "${mseConfigFile}" == "1" ]; then
    #
    # Resgata a linha em que a variável está definida.
    mseTargetVarRawLine=$(mse_config_showVariableLine "${msePathToFile}" "${mseSectionNameStart}" "${mseVarName}" "1")

    #
    # A existência da variável alvo no caso de uma operação de adição
    # causará um erro se ela já existir.
    if [ "${mseOperation}" == "a" ]; then
      if [ "${mseTargetVarRawLine}" != "" ]; then
        mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_variableAlreadExists}" "VAR" "${mseVarName}")
      fi
    else
      #
      # Em qualquer outro caso, a ausencia da variável alvo causará um erro.
      if [ "${mseTargetVarRawLine}" == "" ]; then
        if [ "${mseSectionNameStart}" == "" ]; then
          mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_variableDoNotExists}" "VAR" "${mseVarName}")
        else
          mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_variableDoNotExistsInSection}" "VAR" "${mseVarName}" "SECTION" "${mseSectionNameStart}")
        fi
      else
        #
        # Existindo, identifica a linha em que a variável está escrita
        mseTargetVarLineNumber="${mseTargetVarRawLine%${mseCommentChar}*}"
        mseTargetVarLineNumber="${mseTargetVarLineNumber%*${mseCommentChar}}"

        #
        # Remove a informação da linha para ter apenas a informação útil
        mseTargetVarRawLine="${mseTargetVarRawLine#${mseTargetVarLineNumber}#}"

        #
        # Verifica o estado da variável... se está ou não comentada
        mseTargetVarIsCommented=0
        if [ "${mseTargetVarRawLine:0:1}" == "${mseCommentChar}" ]; then
          mseTargetVarIsCommented=1
        fi
      fi
    fi
  fi





  if [ "$mseReturn" == 1 ]; then
    declare -a mseNewLine=()

    if [ "${mseConfigFile}" == "0" ]; then
      #
      # Prepara o conteúdo a ser usado
      if [ "${mseOperation}" != "d" ]; then
        local mseTmpComment=""
        if [ "${mseOperation}" == "c" ]; then
          mseTmpComment="${mseCommentChar} "
        fi

        mseNewLine+=("${mseSectionNameStart}")

        case "${mseVarType}" in
          s)
            mseNewLine+=("${mseTmpComment}${mseVarName}=${mseVarValue}")
          ;;
          i)
            local i
            local l="${#mseVarArrName[@]}"
            local v

            mseNewLine+=("declare -ga ${mseVarName}")
            for ((i=0; i<l; i++)); do
              v="${mseVarArrName[$i]}"
              mseNewLine+=("${mseTmpComment}${mseVarName}[$i]=\"${v}\"")
            done
          ;;
          a)
            local k
            local v

            mseNewLine+=("declare -gA ${mseVarName}")
            for k in ${!mseVarArrName[@]}; do
              v="${mseVarArrName[$k]}"
              mseNewLine+=("${mseTmpComment}${mseVarName}[\"$k\"]=\"${v}\"")
            done
          ;;
        esac

        mseNewLine+=("${mseSectionNameEnd}")

        #
        # Efetivamente escreve a nova variável
        mseReturn=$(mse_file_write "${msePathToFile}" "mseNewLine" "r" "${mseTargetSectionLines}")
      fi


    else

      case "${mseOperation}" in
        #
        # Adicionar uma nova variável
        a)

          #
          # Conforme a posição relativa a ser usada para adicionar a nova
          # variável, seleciona o número da linha que será a referencia
          if [ "${msePosition}" == "p" ]; then
            mseTargetVarLineNumber="${mseTargetSectionFirstLine}"
          elif [ "${msePosition}" == "a" ]; then
            mseTargetVarLineNumber="${mseTargetSectionLastLine}"
          fi

          #
          # Monta a linha da nova variável.
          mseNewLine=("${mseVarName}=${mseVarValue}")

          #
          # Efetivamente escreve a nova variável
          mseReturn=$(mse_file_write "${msePathToFile}" "mseNewLine" "a" "${mseTargetVarLineNumber}")

        ;;

        #
        # Exclui uma variável existente
        d)

          mseReturn=$(mse_file_write "${msePathToFile}" "mseNewLine" "d" "${mseTargetVarLineNumber}")

        ;;

        #
        # Altera o valor de uma variável existente
        ch)

          local mseRawVarAssign="${mseTargetVarRawLine%%=*}"
          local mseRawVarValue="${mseTargetVarRawLine#${mseRawVarAssign}=}"
          local mseRawVarSep=${mseRawVarValue%%[^ ]*}
          mseNewLine=("${mseRawVarAssign}=${mseRawVarSep}${mseVarValue}")

          mseReturn=$(mse_file_write "${msePathToFile}" "mseNewLine" "r" "${mseTargetVarLineNumber}")

        ;;

        #
        # Comenta uma variável existente se ela não estiver comentada
        c)

          if [ "${mseTargetVarIsCommented}" == 0 ]; then
            mseNewLine=("${mseCommentChar}${mseTargetVarRawLine}")
            mseReturn=$(mse_file_write "${msePathToFile}" "mseNewLine" "r" "${mseTargetVarLineNumber}")
          fi

        ;;

        #
        # Descomenta uma variável existente
        u)

          if [ "${mseTargetVarIsCommented}" == 1 ]; then
            mseNewLine=("${mseTargetVarRawLine:1}")
            mseReturn=$(mse_file_write "${msePathToFile}" "mseNewLine" "r" "${mseTargetVarLineNumber}")
          fi

        ;;
      esac
    fi
  fi

  printf "%s" "${mseReturn}"
}
MSE_GLOBAL_CMD["config set variable"]="mse_config_setVariable"




#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_config_setVariable_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=9
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="PathToFile :: r :: fileName"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="CommentChar :: r :: char"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="ConfigFile :: r :: bool"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_3"]="SectionStart :: r :: string"

  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_4"]="VarType :: r :: list"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_4_labels"]="scalar, index, assoc"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_4_values"]="s, i, a"

  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_5"]="VarName :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_6"]="VarValue :: r :: string"

  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_7"]="Operation :: r :: list"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_7_labels"]="add, delete, change, comment, uncomment"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_7_values"]="a, d, ch, c, u"

  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_8"]="Position :: o :: list"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_8_labels"]="prepend, append"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_8_values"]="p, a"
}
