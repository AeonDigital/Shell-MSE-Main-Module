#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Registra o módulo alvo.
# Todas suas variáveis, aliases e scripts serão carregadas.
#
# @param string $1
# Nome do módulo que está sendo registrado.
#
# @param string $2
# Caminho completo até o diretório 'src' do módulo que está
# sendo registrado.
mse_mmod_registerModule() {
  local mseModFiles
  local mseModuleName
  local mseModuleSrcDirectory

  local rawLine
  local mseFullFileName
  local mseScriptName



  mseModFiles=$(find "$2/scripts" -name "*.sh")
  if [ "$mseModFiles" != "" ]; then
    mseModuleName="$1"
    mseModuleSrcDirectory="$2"


    #
    # Tratando-se do módulo base...
    if [ "${mseModuleName}" == "#MainModule" ]; then
      while read rawLine; do
        mseFullFileName=$(basename -- "$rawLine")
        mseScriptName="${mseFullFileName%.*}"

        unset "${mseScriptName}"
        . "$rawLine" || true
      done <<< ${mseModFiles}
    else


      #
      # Carrega os arquivos de scripts deste módulo
      while read rawLine; do
        mseFullFileName=$(basename -- "$rawLine")
        mseScriptName="${mseFullFileName%.*}"

        unset "${mseScriptName}"
        . "$rawLine" || true
      done <<< ${mseModFiles}
    fi
  fi
}
