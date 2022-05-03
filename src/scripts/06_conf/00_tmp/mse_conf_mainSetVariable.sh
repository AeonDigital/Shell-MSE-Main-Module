#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Permite editar um arquivo de configuração do tipo chave=valor e evetuar
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
# Use "" para procurar em todo o arquivo.
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
# - remove    | r   : para remover uma variável existente.
# - change    | ch  : para alterar o valor de uma variável.
# - comment   | c   : para comentar uma variável.
# - uncomment | u   : para descomentar uma variável.
#
# @param char $6
# Opcional. Caracter usado para comentar a linha.
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
mse_conf_mainSetVariable()
{
  local mseReturn

  local mseOperation
  local mseCommentChar
  local msePosition

  local mseRawLine


  # local mseIsComment
  # local mseLineNumber
  # local mseNewLine
  # local mseCharC


  #
  # Identifica o tipo de operação que será feita
  case "$5" in
    add | a)
      mseOperation="a"
    ;;
    remove | r)
      mseOperation="r"
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
  esac



  #
  # Registra o caracter de comentário usado no arquivo de configuração
  mseCommentChar="$6"



  #
  # Em caso de operação 'add'
  # Identifica a posição que deve ser usada como referência para
  # a nova variável.
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
      esac
    fi
  fi





  #
  # Sendo para adicionar uma nova variável...
  if [ "$mseOperation" == "a" ]; then
    local mseCk
    #
    # Verifica se a variável indicada já não existe
    if [ "$2" == "" ]; then
      mseCk=$(mse_conf_showVariableLine "$1" "$3")
    else
      mseCk=$(mse_conf_showSectionVariableLine "$1" "$2" "$3")
    fi

    #
    # Se a variável já existe, não seta!
    if [ "$mseCk" != "" ]; then
      mseReturn="Variable \"$2\" already exists"
    else
      local mseFirstLineNumber
      local mseLastLineNumber
      local mseUseLine
      local mseNewLine

      #
      # Identifica a primeira e a última linha útil para a ação de adição
      # da nova variável conforme a definição ou não de uma seção alvo.
      if [ "$2" == "" ]; then
        mseFirstLineNumber=1
        mseLastLineNumber=$(mse_file_countLines "$1")
      else
        local mseSectionLines

        mseSectionLines=$(mse_conf_showSectionLineNumbers "$1" "$2" "$mseCommentChar")
        if [ "$?" != "0" ]; then
          mseReturn="${mseSectionLines}"
        else
          mse_str_split " " "${mseSectionLines}"

          mseFirstLineNumber="${MSE_GLOBAL_MODULE_SPLIT_RESULT[0]}"
          mseLastLineNumber="${MSE_GLOBAL_MODULE_SPLIT_RESULT[1]}"


          #
          # Conforme a posição relativa a ser usada para adicionar a nova
          # variável, seleciona o número da linha que será a referencia
          if [ "$msePosition" == "p" ]; then
            mseUseLine="${mseFirstLineNumber}"
          elif [ "$msePosition" == "a" ]; then
            mseUseLine="${mseLastLineNumber}"
          fi

          #
          # Monta a linha da nova variável.
          mseNewLine=("${3}=${2}")

          #
          # Efetivamente escreve a nova variável
          mseReturn=$(mse_file_write "$1" "mseNewLine" "a" "${mseUseLine}")
        fi
      fi
    fi
  else
    printf ""
    #
    #
    # MELHORAR 'RETURN' E 'ERROR' DAS FUNÇÕES.
    # É MELHOR CRIAR 2 VARIÁVEIS EXTERNAS PARA ESTES DOIS STATUS.
    # USAR O $? PARA VERIFICAR SE UMA FUNÇÃO TEVE SUCESSO OU FALHA.
    #
    # ADICIONAR NAS MENSAGENS DE ERRO DA VALIDAÇÃO DE PARAMETROS O NOME DA
    # FUNÇÃO ONDE O ERRO OCORREU.
    #
    # ADICIONAR CAPACIDADE DE REMOVER UMA OU MAIS LINHAS DE UM ARQUIVO
  fi



  # if [ "${mseRawLine}" == "" ]; then
  #   printf "Variable \"$3\" not found"
  #   return 1
  # else
  #   mseReturn="1"
  #   mseCharC="$4"

  #   #
  #   # Identifica o número da linha alvo em que está a variável
  #   # redefine o 'rawLine' para uma versão sem o número da linha
  #   mseLineNumber="${mseRawLine%${mseCharC}*}"
  #   mseLineNumber="${mseLineNumber%*${mseCharC}}"
  #   mseRawLine=$(mse_raw_str_trim "${mseRawLine#*${mseCharC}}")



  #   #
  #   # Verifica o estado da variável... se está ou não comentada
  #   mseIsComment=0
  #   if [ "${mseRawLine:0:1}" == "$4" ]; then
  #     mseIsComment=1
  #   fi


  #   #
  #   # Se a variável deve ser comentada...
  #   mseNewLine=""
  #   if [ "$mseIsComment" == 0 ] && [ "$5" == 1 ]; then
  #     mseNewLine=("${4}${mseRawLine}")
  #   elif [ "$mseIsComment" == 1 ] && [ "$5" == 0 ]; then
  #     mseNewLine=("${mseRawLine:1}")
  #   fi


  #   if [ "$mseNewLine" != "" ]; then
  #     mseReturn=$(mse_file_write "$1" "mseNewLine" "r" "$mseLineNumber")
  #   fi


  #   printf "%s" "${mseReturn}"
  #   if [ "$mseReturn" == 1 ]; then return 0; else return 1; fi
  # fi

  printf "%s" "${mseReturn}"
  if [ "$mseReturn" == 1 ]; then return 0; else return 1; fi
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
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_4_labels"]="add, remove, change, comment, uncomment"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_4_values"]="a, r, ch, c, u"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_5"]="CommentChar :: r :: char"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_6"]="Position :: o :: list"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_6_labels"]="prepend, append, replace"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_6_values"]="p, a, r"
}
