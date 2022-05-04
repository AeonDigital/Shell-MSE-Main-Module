#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Escreve uma ou mais linhas de dados no arquivo alvo na posição indicada.
#
# @param string $1
# Caminho até o arquivo alvo da alteração.
#
# @param string $2
# Nome do array contendo as novas linhas de dados a serem adicionadas.
#
# @param string $3
# Opcional. Tipo de operação que será efetuada.
# - prepend | p : Adiciona as novas linhas no início do arquivo.
# - append  | a : Adiciona as novas linhas no final do arquivo.
# - replace | r : Adiciona as novas linhas em substituição a uma linha existente.
# - delete  | d : Exclui a linha ou linhas indicadas.
# Se omitido ou "" será usada a opção "append"
#
# @param int|string $4
# Opcional para 'prepend' e 'append'; Obrigatório para 'replace' e 'delete'.
# Indica o número da linha a ser usada como posição inicial para a escrita
# do novo conteúdo.
#
# Se este parametro não for definido e o tipo for:
# - prepend : equivalente a definir o valor '1'.
# - append  : equivalente a definir o número da última linha do arquivo.
# - replace : falhará a execução.
# - delete  : falhará a execução.
#
# SE
# o valor passado for uma string, esta deverá ser:
# - o nome de uma função a ser executada para identificar o número da linha em
#   que a escrita deve ser feita.
# OU
# - 2 valores inteiros separados por espaço, sendo estes dois valores o range
#   entre 2 linhas nas quais o novo valor será adicionado
#   (ex: "10 15" substituirá totalmente o conteúdo das linhas 10, 11, 12, 13,
#   14 e 15 pelo conteúdo novo a ser adicionado)
#
# Em qualquer dos casos, se não receber valores inteiros válidos (entre 1 e o
# número da última linha do arquivo conforme ele está atualmente salvo) a
# ação não será feita e uma falha ocorrerá.
#
# @return
# Printa '1' se conseguir alterar o arquivo alvo.
# Ou
# Printa a mensagem do erro ocorrido.
mse_file_write()
{
  local mseReturn

  local mseFilePath
  local mseFileContent
  local mseFileLastLine

  declare -n mseContentArrayName
  local mseAction
  local mseTargetFirstLine
  local mseTargetLastLine

  local oIFS
  local mseCountLine
  local mseNewFileContent




  #
  # Verifica os parametros
  mseReturn=1


  #
  # Pega informações do arquivo alvo
  mseFilePath="$1"
  mseFileContent=$(< "$mseFilePath")
  mseFileLastLine=$(mse_file_countLines "$mseFilePath")


  #
  # Identifica o array de conteúdo
  mseContentArrayName="$2"


  #
  # Verifica o tipo de operação que deve ser realizado
  mseAction="a"
  if [ $# -ge 3 ]; then
    case "$3" in
      prepend | p)
        mseAction="p"
        mseTargetFirstLine=1
        mseTargetLastLine=0
      ;;
      append | a)
        mseAction="a"
        mseTargetFirstLine=$mseFileLastLine
        mseTargetLastLine=0
      ;;
      replace | r)
        mseAction="r"
        if [ $# -lt 4 ]; then
          mseReturn="Parameter \"TargetLine\" is required for \"replace\" operation"
        fi
      ;;
      delete | d)
        mseAction="d"
        if [ $# -lt 4 ]; then
          mseReturn="Parameter \"TargetLine\" is required for \"delete\" operation"
        fi
      ;;
    esac
  fi



  #
  # Verifica o número da linha que deve ser usada como
  # orientação para a operação de escrita.
  if [ "$mseReturn" == 1 ] && [ $# -ge 4 ]; then
    #
    # Uma vez que este parametro foi passado
    # verifica se trata-se de um único número inteiro...
    if [[ "$4" =~ ^[0-9]+$ ]]; then
      mseTargetFirstLine=$4
      mseTargetLastLine=0
    else
      local mseFnName
      local mseFnResult
      local mseFnResultParts


      #
      # Senão, verifica se a string é ou não o nome de uma função.
      mseFnResult="$4"
      if [ "$(type -t $4)" == "function" ]; then
        mseFnName="fn $4"
        mseFnResult=$($4)
      else
        mseFnName="Received"
      fi



      #
      # Executa um split no valor obtido para ver se trata-se de 2 inteiros
      mse_str_split " " "$mseFnResult"
      mseFnResultParts="${#MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}"

      if [ "$mseFnResultParts" == 0 ] || [ "$mseFnResultParts" -gt 2 ]; then
        mseReturn="Parameter \"TargetLine\" has an invalid value [ Expected a function name or one/two integers; \"${mseFnName}\": \"$mseFnResult\"  :: 1 ]"
      else
        mseTargetFirstLine="${MSE_GLOBAL_MODULE_SPLIT_RESULT[0]}"
        mseTargetLastLine=0

        if ! [[ "${mseTargetFirstLine}" =~ ^[0-9]+$ ]]; then
          mseReturn="Parameter \"TargetLine\" has an invalid value [ Expected a function name or one/two integers; \"${mseFnName}\": \"$mseFnResult\"  :: 2 ]"
        else
          if [ "$mseFnResultParts" == 2 ] && [ "${MSE_GLOBAL_MODULE_SPLIT_RESULT[1]}" != "$mseTargetFirstLine" ]; then
            mseTargetLastLine="${MSE_GLOBAL_MODULE_SPLIT_RESULT[1]}"
            if ! [[ "${mseTargetLastLine}" =~ ^[0-9]+$ ]]; then
              mseReturn="Parameter \"TargetLine\" has an invalid value [ Expected a function name or one/two integers; \"${mseFnName}\": \"$mseFnResult\"  :: 3 ]"
            else
              if [ $mseTargetFirstLine -gt $mseTargetLastLine ]; then
                mseReturn="Parameter \"TargetLine\" has an invalid value [ First line must be less than the last: \"$mseFnResult\" ]"
              fi
            fi
          fi
        fi
      fi
    fi


    #
    # Verifica se o número da linha indicada é válida
    if [ "$mseReturn" == 1 ]; then
      if [ "$mseTargetFirstLine" -lt 1 ] || [ "$mseTargetFirstLine" -gt "$mseFileLastLine" ] || [ "$mseTargetLastLine" -gt "$mseFileLastLine" ]; then
        mseReturn="Parameter \"TargetLine\" has an invalid value [ Outside the file limits; 1 - $mseFileLastLine ]"
      fi
    fi
  fi



  #
  # Finalmente, não existindo nenhuma falha, começa a
  # operação de escrita.
  if [ "$mseReturn" == 1 ]; then
    oIFS=$IFS
    IFS=$'\n'

    mseCountLine=0
    mseNewFileContent=""
    while read mseLineRaw || [ -n "${mseLineRaw}" ]; do
      ((mseCountLine=mseCountLine+1))

      if [ $mseCountLine == $mseTargetFirstLine ]; then
        if [ $mseAction == "a" ]; then
          mseNewFileContent+="${mseLineRaw}\n"
        fi

        if [ $mseAction != "d" ]; then
          local mseNL
          for mseNL in "${mseContentArrayName[@]}"; do
            mseNewFileContent+="${mseNL}\n"
          done
        fi

        if [ $mseAction == "p" ]; then
          mseNewFileContent+="${mseLineRaw}\n"
        fi
      else
        if [ $mseTargetLastLine == 0 ] || [ $mseCountLine -lt $mseTargetFirstLine ] || [ $mseCountLine -gt $mseTargetLastLine ]; then
          mseNewFileContent+="${mseLineRaw}\n"
        fi
      fi

    done <<< "$mseFileContent"

    IFS=$oIFS

    printf "${mseNewFileContent}" > "${mseFilePath}"
    if [ $? != 0 ]; then
      mseReturn="Error on save. Do you have permissions to change the target file?"
    fi
  fi


  printf "${mseReturn}"
}





#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_file_write_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=3
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="PathToFile :: r :: fileName"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="ContentArrayName :: r :: arrayName"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="OperationType :: o :: list :: append"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2_labels"]="prepend, append, replace"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2_values"]="p, a, r"
}
