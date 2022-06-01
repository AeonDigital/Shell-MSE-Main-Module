#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Permite editar um arquivo de configuração do tipo chave=valor e efetuar
# alterações em suas seções como adicionar, remover, alterar, comentar e
# descomentar variáveis.
#
# Se o arquivo de configuração estiver mal formatado e existir dentro da mesma
# seção uma variável duplicada, apenas a primeira será levada em consideração.
#
# @param string $1
# Caminho até o arquivo alvo.
#
# @param string $2
# Nome da seção alvo.
# Use "" para focar em todo o arquivo.
#
# @param string $3
# Nome da variável alvo.
#
# @param string $4
# Valor da variável.
# Usado apenas para operações 'add' e 'change'.
#
# @param string $5
# Nome da operação que será realizada:
# - add       | a   : para adicionar uma nova variável.
# - delete    | d   : para remover uma variável existente.
# - change    | ch  : para alterar o valor de uma variável.
# - comment   | c   : para comentar uma variável.
# - uncomment | u   : para descomentar uma variável.
#
# @param char $6
# Caracter usado para comentar a linha.
# Usado apenas em caso de operação 'comment' ou 'uncomment'.
#
# @param string $7
# Opcional. Indica a posição em que a variável deve ser adicionada.
# Usado apenas em caso de operação 'add'.
# - prepend   | p   : Adiciona a variável no início do arquivo/seção.
# - append    | a   : Adiciona a variável no final do arquivo/seção.
#                     Esta é a operação padrão em caso de operação 'add'
#
# @return
# Printa '1' se conseguir efetuar a alteração exigida.
# Ou
# Printa a mensagem do erro ocorrido.
mse_conf_setVariable()
{
  local mseReturn

  local mseOperation
  local mseCommentChar
  local msePosition


  local mseRawVarLine

  local mseTargetFirstLine
  local mseTargetLastLine

  local mseTargetLineNumber

  local mseIsComment



  mseReturn=1
  if [ $# -lt 6 ]; then
    local mseArgs="$#"
    local mseLost
    ((mseLost=6-mseArgs))

    mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_lostParameters}" "LOST" "${mseLost}")
  else
    if [ $# -ge 1 ] && [ "$1" == "" ]; then
      mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_IsRequired}" "PARAM_A" "PathToFile")
    elif [ $# -ge 3 ] && [ "$3" == "" ]; then
      mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_IsRequired}" "PARAM_A" "VariableName")
    elif [ $# -ge 5 ] && [ "$5" == "" ]; then
      mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_IsRequired}" "PARAM_A" "Operation")
    elif [ $# -ge 6 ] && [ "$6" == "" ]; then
      mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_IsRequired}" "PARAM_A" "CommentChar")
    fi

    if [ "$mseReturn" == 1 ] && [ ! -f "$1" ]; then
      mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_PointsToNonExistentFile}" "PARAM_A" "PathToFile")
    fi
  fi




  #
  # Identifica o tipo de operação que será feita
  if [ "$mseReturn" == 1 ]; then
    case "$5" in
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
  # Registra o caracter de comentário usado no arquivo de configuração
  if [ "$mseReturn" == 1 ]; then
    mseCommentChar="$6"
  fi





  #
  # Em caso de operação 'add'
  # Identifica a posição que deve ser usada como referência para
  # a nova variável.
  if [ "$mseReturn" == 1 ]; then
    if [ "$mseOperation" == "a" ]; then
      msePosition="a"

      if [ $# -ge 7 ] && [ "$7" != "" ]; then
        case "$7" in
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
  # Verifica se a variável indicada já existe ou não
  if [ "$mseReturn" == 1 ]; then
    mseRawVarLine=$(mse_conf_showVariableLine "$1" "$2" "$3" "1")

    #
    # A existência da variável alvo no caso de uma operação de adição
    # causará um erro se ela já existir.
    if [ "$mseOperation" == "a" ]; then
      if [ "$mseRawVarLine" != "" ]; then
        mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_variableAlreadExists}" "VAR" "$3")
      fi
    else
      #
      # Em qualquer outro caso, a ausencia da variável alvo causará um erro.
      if [ "$mseRawVarLine" == "" ]; then
        if [ "$2" == "" ]; then
          mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_variableDoNotExists}" "VAR" "$3")
        else
          mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_variableDoNotExistsInSection}" "VAR" "$3" "SECTION" "$2")
        fi
      else
        #
        # Existindo, identifica a linha em que a variável está escrita
        mseTargetLineNumber="${mseRawVarLine%${mseCommentChar}*}"
        mseTargetLineNumber="${mseTargetLineNumber%*${mseCommentChar}}"

        #
        # Remove a informação da linha para ter apenas a informação útil
        mseRawVarLine="${mseRawVarLine#${mseTargetLineNumber}#}"

        #
        # Verifica o estado da variável... se está ou não comentada
        mseIsComment=0
        if [ "${mseRawVarLine:0:1}" == "$mseCommentChar" ]; then
          mseIsComment=1
        fi

      fi
    fi
  fi





  #
  # Identifica as linhas que são possíveis alvo desta ação.
  if [ "$mseReturn" == 1 ]; then
    local mseTargetLines

    mseTargetLines=$(mse_file_boundaryLineNumbers "$1" "$mseCommentChar" "1" "$2" "")

    #
    # Executa um split no valor obtido para ver se trata-se de 2 inteiros
    mse_str_split " " "$mseTargetLines"
    if [ "${#MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}" != 2 ]; then
      mseReturn="${lbl_cf_cannotIdentifyTargetLine}"
    else
      mseTargetFirstLine="${MSE_GLOBAL_MODULE_SPLIT_RESULT[0]}"
      mseTargetLastLine="${MSE_GLOBAL_MODULE_SPLIT_RESULT[1]}"
    fi
  fi





  if [ "$mseReturn" == 1 ]; then
    local mseNewLine
    mseNewLine=()


    if [ "$mseOperation" == "a" ]; then
      #
      # Adicionar uma nova variável

      #
      # Conforme a posição relativa a ser usada para adicionar a nova
      # variável, seleciona o número da linha que será a referencia
      if [ "$msePosition" == "p" ]; then
        mseTargetLineNumber="${mseTargetFirstLine}"
      elif [ "$msePosition" == "a" ]; then
        mseTargetLineNumber="${mseTargetLastLine}"
      fi

      #
      # Monta a linha da nova variável.
      mseNewLine=("${3}=${4}")

      #
      # Efetivamente escreve a nova variável
      mseReturn=$(mse_file_write "$1" "mseNewLine" "a" "${mseTargetLineNumber}")
    elif [ "$mseOperation" == "d" ]; then
      #
      # Exclui uma variável existente
      mseReturn=$(mse_file_write "$1" "mseNewLine" "d" "${mseTargetLineNumber}")
    elif [ "$mseOperation" == "ch" ]; then
      #
      # Altera o valor de uma variável existente
      local mseVarAssign="${mseRawVarLine%%=*}"
      local mseVarValue="${mseRawVarLine#${mseVarAssign}=}"
      local mseVarSep=${mseVarValue%%[^ ]*}
      mseNewLine=("${mseVarAssign}=${mseVarSep}${4}")

      mseReturn=$(mse_file_write "$1" "mseNewLine" "r" "${mseTargetLineNumber}")
    elif [ "$mseOperation" == "c" ]; then
      #
      # Comenta uma variável existente se ela não estiver comentada
      if [ "$mseIsComment" == 0 ]; then
        mseNewLine=("${mseCommentChar}${mseRawVarLine}")
        mseReturn=$(mse_file_write "$1" "mseNewLine" "r" "${mseTargetLineNumber}")
      fi
    elif [ "$mseOperation" == "u" ]; then
      #
      # Descomenta uma variável existente
      if [ "$mseIsComment" == 1 ]; then
        mseNewLine=("${mseRawVarLine:1}")
        mseReturn=$(mse_file_write "$1" "mseNewLine" "r" "${mseTargetLineNumber}")
      fi
    fi
  fi

  printf "%s" "${mseReturn}"
}





#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_conf_mainSetVariable_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=7
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="PathToFile :: r :: fileName"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="SectionName :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="VariableName :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_3"]="VariableValue :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_4"]="Operation :: r :: list"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_4_labels"]="add, delete, change, comment, uncomment"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_4_values"]="a, d, ch, c, u"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_5"]="CommentChar :: r :: char"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_6"]="Position :: o :: list"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_6_labels"]="prepend, append"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_6_values"]="p, a"
}
