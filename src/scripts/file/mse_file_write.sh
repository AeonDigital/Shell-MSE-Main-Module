#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Escreve uma ou mais linhas de dados no arquivo alvo na posição indicada.
#
# @param string $1
# Caminho até o arquivo que será lida.
#
# @param string $2
# Nome do array contendo as novas linhas de dados a serem adicionadas.
#
# @param string $3
# Opcional. Tipo de operação que será efetuada.
# - p|prepend : Adiciona as novas linhas no início do arquivo.
# - a|append  : Adiciona as novas linhas no final do arquivo.
# - r|replace : Adiciona as novas linhas em substituição a uma linha existente.
# Se omitido ou "" será usada a opção "append"
#
# @param int|string $4
# Opcional para 'prepend' e 'append'; Obrigatório para 'replace'.
# Indica o número da linha a ser usada como posição inicial para a a escrita
# do novo conteúdo.
# Se há conteúdo nesta mesma linha, o mesmo será 'empurrado' para baixo exceto
# no caso de estar usando a operação 'replace'.
#
# Se este parametro não for definido e o tipo for:
# - prepend : equivalente a definir o valor '1'.
# - append  : equivalente a definir o número da última linha do arquivo.
# - replace : falhará a execução.
#
# SE
# o valor passado for uma string, esta deverá ser o nome de uma função a ser
# executada para identificar o número da linha em que a escrita deve ser feita.
#
# Em qualquer dos casos, se não receber um valor inteiro válido (entre 1 e o
# número da última linha do arquivo conforme ele está atualmente salvo) a
# ação não será feita e uma falha ocorrerá.
#
# @return
# Printa '1' se conseguir alterar o arquivo alvo.
# Printa a mensagem do erro ocorrido.
mse_file_write()
{
  local mseReturn

  declare -a mseParamData=("$@")
  declare -A mseParamRules
  mseParamRules["count"]=3
  mseParamRules["param_0"]="PathToFile :: r :: fileName"
  mseParamRules["param_1"]="ContentArrayName :: r :: arrayName"
  mseParamRules["param_2"]="ContentArrayName :: o :: list :: append"
  mseParamRules["param_2_labels"]="prepend, append, replace"
  mseParamRules["param_2_values"]="p, a, r"


  mseReturn=$(mse_mmod_validateParams "mseParamRules" "mseParamData")
  if [ "$mseReturn" != 1 ]; then
    printf "%s" "${mseReturn}"
    return 1
  else

    local mseFilePath
    local mseFileContent
    local mseFileLastLine

    declare -n mseContentArrayName
    local mseAction
    local mseTargetLine

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
          mseTargetLine=1
        ;;
        append | a)
          mseAction="a"
          mseTargetLine=$mseFileLastLine
        ;;
        replace | r)
          mseAction="r"
          if [ $# -lt 4 ]; then
            mseReturn="Parameter \"TargetLine\" is required for \"replace\" operation"
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
      # verifica se trata-se de um número
      if [[ $4 =~ ^[0-9]+$ ]]; then
        mseTargetLine=$4
      else
        #
        # Senão, tratando-se de uma string... identifica se a mesma indica o nome
        # de uma função
        if [ "$(type -t $4)" == "function" ]; then
          mseTargetLine=$($4)
        else
          mseReturn="Parameter \"TargetLine\" has an invalid value [ Expected a valid function name or line number ]"
        fi
      fi


      #
      # Verifica se o número da linha indicada é válida
      if [ "$mseReturn" == 1 ]; then
        if [ $mseTargetLine -lt 1 ] || [ $mseTargetLine -gt $mseFileLastLine ]; then
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

        if [ $mseCountLine == $mseTargetLine ]; then
          if [ $mseAction == "a" ]; then
            mseNewFileContent+="${mseLineRaw}\n"
          fi

          local mseNL
          for mseNL in "${mseContentArrayName[@]}"; do
            mseNewFileContent+="${mseNL}\n"
          done

          if [ $mseAction == "p" ]; then
            mseNewFileContent+="${mseLineRaw}\n"
          fi
        else
          mseNewFileContent+="${mseLineRaw}\n"
        fi

      done <<< "$mseFileContent"

      IFS=$oIFS

      printf "${mseNewFileContent}" > "${mseFilePath}"
      if [ $? != 0 ]; then
        mseReturn="Error on save. Do you have permissions to change the target file?"
      fi
    fi


    printf "${mseReturn}"
    return 0
  fi
}
