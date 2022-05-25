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
  local mseFunctionName

  local mseMFName



  mseModFiles=$(find "$2/scripts" -name "*.sh" | sort -n)
  if [ "$mseModFiles" != "" ]; then
    mseModuleName="$1"
    mseModuleSrcDirectory="$2"


    #
    # Carrega os arquivos de scripts deste módulo
    MSE_GLOBAL_MODULES+=("${mseModuleName}")

    while read rawLine; do
      mseFullFileName=$(basename -- "$rawLine")
      mseFunctionName="${mseFullFileName%.*}"

      unset "${mseFunctionName}"
      . "$rawLine" || true

      #
      # Registra a função
      # Apenas se a mesma não está em uma pasta do tipo 'assets'
      if [[ ! ${rawLine} =~ "/assets/" ]]; then
        MSE_GLOBAL_MODULES_FUNCTIONS["${mseModuleName}::${mseFunctionName}"]="${rawLine}"
      fi
    done <<< ${mseModFiles}
  fi
}
