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
mse_mmod_fileWrite()
{
  local mseReturn
  local mseFilePath
  local mseFileContent
  local mseFileLastLine

  local mseArrayNewContent
  local mseAction
  local mseTargetLine

  local oIFS
  local mseCountLine
  local mseNewFileContent




  #
  # Verifica existência e validade dos parametros
  mseReturn=1
  mseArrayNewContent=()


  #
  # Verifica se o primeiro parametro está definido e trata-se
  # de um caminho para um arquivo existente.
  if [ $# == 0 ]; then
    mseReturn="Lost parameter \$1 [ Expected path to target file ]"
  else
    if [ "$1" == "" ]; then
      mseReturn="Empty parameter \$1 [ Expected path to target file ]"
    else
      if [ -f "$1" ]; then
        mseFilePath="$1"
        mseFileContent=$(< "$mseFilePath")
        mseFileLastLine=$(mse_file_countLines "$mseFilePath")
      else
        mseReturn="Invalid parameter \$1 [ File not found ]"
      fi
    fi
  fi


  #
  # Identifica se o segundo argumento é um array
  if [ "$mseReturn" == 1 ]; then
    if [ $# == 1 ]; then
      mseReturn="Lost parameter \$2 [ Expected name of array with new content ]"
    else
      if [ "$2" == "" ]; then
        mseReturn="Empty parameter \$2 [ Expected name of array with new content ]"
      else
        if [[ "$(declare -p $2 2> /dev/null)" =~ "declare -a" ]]; then
          #
          # Copia o array indicado
          mseArrayNewContent="$2[@]"
          mseArrayNewContent=("${!mseArrayNewContent}")
        else
          mseReturn="Invalid parameter \$2 [ Is not a name of array ]"
        fi
      fi
    fi
  fi


  #
  # Verifica o tipo de operação que deve ser realizado
  if [ "$mseReturn" == 1 ]; then
    mseAction="a"

    if [ $# -gt 2 ]; then
      case "${3,,}" in
        prepend | p)
          mseAction="p"
        ;;
        append | a)
          mseAction="a"
        ;;
        replace | r)
          mseAction="r"
        ;;
        *)
          mseReturn="Invalid parameter \$3 [ Expected one of \"prepend\" \"p\", \"append\" \"a\" or \"replace\" \"r\" ]"
        ;;
      esac
    fi
  fi


  #
  # Verifica o número da linha que deve ser usada como
  # orientação para a operação de escrita.
  if [ "$mseReturn" == 1 ]; then
    #
    # Se não for definido, usa um valor pré definido conforme
    # o tipo de operação a ser usado.
    if [ $# -lt 4 ]; then
      if [ "$mseAction" == "p" ]; then
        mseTargetLine=1
      elif [ "$mseAction" == "a" ]; then
        mseTargetLine=$mseFileLastLine
      elif [ "$mseAction" == "r" ]; then
        mseReturn="Lost parameter \$4 [ For \"replace\" operation is required to define the target line ]"
      fi
    else
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
          mseReturn="Invalid parameter \$4 [ Not a valid function name or line number ]"
        fi
      fi


      #
      # Verifica se o número da linha indicada é válida
      if [ "$mseReturn" == 1 ]; then
        if [ $mseTargetLine -lt 1 ] || [ $mseTargetLine -gt $mseFileLastLine ]; then
          mseReturn="Invalid parameter \$4 [ Outside the file limits; 1 - $mseFileLastLine ]"
        fi
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
        for mseNL in "${mseArrayNewContent[@]}"; do
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
}
