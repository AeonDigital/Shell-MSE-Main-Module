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
#
# @return int
# Total de linhas do arquivo
mse_file_countLines() {
  local mseReturn

  declare -a mseParamData=("$@")
  declare -A mseParamRules
  mseParamRules["count"]=1
  mseParamRules["param_0"]="PathToFile :: r :: fileName"

  mseReturn=$(mse_exec_validateParams "mseParamRules" "mseParamData")
  if [ "$mseReturn" != 1 ]; then
    printf "%s" "${mseReturn}"
    return 1
  else
    mseReturn=0
    local mseLineRaw
    local mseFileContent
    local oIFS


    mseFileContent="$1"
    if [ -f "$mseFileContent" ]; then
      mseFileContent=$(< "$mseFileContent")
    fi

    if [ "${mseFileContent}" != "" ]; then
      oIFS=$IFS
      IFS=$'\n'

      while read mseLineRaw || [ -n "${mseLineRaw}" ]; do
        ((mseReturn=mseReturn+1))
      done <<< "$mseFileContent"

      IFS=$oIFS
    fi


    printf "%s" "${mseReturn}"
    return 0
  fi
}
