#!/bin/bash -eu
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Identifica a descrição de funcionamento de um script e aloca as linhas
# descritivas no array 'MSE_TMP_MODULE_SCRIPT_DESCRIPTION'.
#
# Uma descrição de um script é identificada por uma linha no arquivo que
# inicie por '# @desc'. A partir da próxima linha, todas serão capturadas
# até que alguma linha seja um comentário vazio (linha contendo apenas '#')
# ou que não seja um comentário.
#
# @param string $1
# Caminho completo até o script que será varrido em busca de sua descrição
# de execução.
mse_mod_retrieveScriptDescription() {
  local mseInDescription=0
  MSE_TMP_MODULE_SCRIPT_DESCRIPTION=()

  while read rawLine || [ -n "${rawLine}" ]
  do
    if [ "$rawLine" == "# @desc" ]; then
      mseInDescription=1
    else
      if [ $mseInDescription == 1 ]; then
          if [ "${rawLine}" == "#" ] || [ "${rawLine:0:1}" != "#" ]; then
            mseInDescription=0
          else
            local mseLength=${#MSE_TMP_MODULE_SCRIPT_DESCRIPTION[@]}
            MSE_TMP_MODULE_SCRIPT_DESCRIPTION[mseLength]=${rawLine#"# "}
          fi
      fi
    fi
  done < "$1"
}
