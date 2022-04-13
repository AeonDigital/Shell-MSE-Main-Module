#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Efetua a contagem de linhas do arquivo ou string passada e printa o resultado.
# Devido a forma como o bash funciona com relação ao tratamento das linhas
# vazias no final dos arquivos, tenha em mente que a contagem de linhas irá
# apenas até a última linha não vazia do arquivo indicado.
#
# @param string $1
# Caminho para o arquivo ou string que será usada.
mse_mmod_countLines() {
  local mseReturn
  local mseFileContent
  local oIFS


  #
  # Apenas se há definição de um arquivo/string
  mseReturn=0
  mseFileContent=""
  if [ $# -ge 1 ] && [ "$1" != "" ]; then
    mseFileContent="$1"
    if [ -f "$1" ]; then
      mseFileContent=$(< "$1")
    fi
  fi


  if [ "${mseFileContent}" != "" ]; then
    oIFS=$IFS
    IFS=$'\n'

    while read mseLineRaw || [ -n "${mseLineRaw}" ]; do
      ((mseReturn=mseReturn+1))
    done <<< "$mseFileContent"

    IFS=$oIFS
  fi

  printf "${mseReturn}"
}
