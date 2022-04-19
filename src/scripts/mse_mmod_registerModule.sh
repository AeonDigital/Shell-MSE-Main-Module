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
  local mseModuleName="$1"
  local mseModuleSrcDirectory="$2";

  local mseModI=${#MSE_GLOBAL_MODULES_NAMES[@]}
  local mseModFiles=$(find "${mseModuleSrcDirectory}/scripts" -name "*.sh")

  local mseScrI=0
  local mseScrCount=0
  if [ "$mseModFiles" != "" ]; then
    #
    # Tratando-se do módulo base...
    if [ "${mseModuleName}" == "#MainModule" ]; then
      while read rawLine
      do
        local mseFullFileName=$(basename -- "$rawLine")
        local mseScriptName="${mseFullFileName%.*}"

        unset "${mseScriptName}"
        . "$rawLine" || true
      done <<< ${mseModFiles}

      mse_mmod_registerModule "Shell-MSE-Main-Module" "${mseModuleSrcDirectory}"
    else
      MSE_GLOBAL_MODULES_NAMES[mseModI]="${mseModuleName}"

      #
      # Carrega os arquivos de scripts deste módulo
      # e procede com o registro das funções disponíveis a partir dele.
      while read rawLine
      do
        local mseFullFileName=$(basename -- "$rawLine")
        local mseScriptName="${mseFullFileName%.*}"

        unset "${mseScriptName}"
        . "$rawLine" || true

        MSE_GLOBAL_MODULE_SCRIPTS["$mseModI,$mseScrI"]="${mseFullFileName%.*}"


        #
        # Identifica a descrição deste script, se houver
        mse_mmod_retrieveScriptDescription "$rawLine"
        if [ ${#MSE_TMP_MODULE_SCRIPT_DESCRIPTION[@]} == 0 ]; then
          MSE_GLOBAL_MODULE_SCRIPTS_DESCRIPTION["$mseModI,$mseScrI,0"]="-"
          MSE_GLOBAL_MODULE_SCRIPTS_DESCRIPTION["$mseModI,$mseScrI"]=1
        else
          local mseMsg
          local mseDscI=0
          for mseMsg in "${MSE_TMP_MODULE_SCRIPT_DESCRIPTION[@]}"; do
            MSE_GLOBAL_MODULE_SCRIPTS_DESCRIPTION["$mseModI,$mseScrI,$mseDscI"]="${mseMsg}"
            ((mseDscI=mseDscI+1))
          done
          MSE_GLOBAL_MODULE_SCRIPTS_DESCRIPTION["$mseModI,$mseScrI"]=$mseDscI
        fi

        ((mseScrI=mseScrI+1))
        ((mseScrCount=mseScrCount+1))
      done <<< ${mseModFiles}


      MSE_GLOBAL_MODULE_SCRIPTS["$mseModI"]=$mseScrCount
    fi
  fi
}
