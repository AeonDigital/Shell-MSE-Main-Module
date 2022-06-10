#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Gera uma versão 'standalone' de todo o módulo indicado.
# o "locale" da versão "standalone" será aquela que está
# atualmente definida.
#
# @param string $1
# Indique o nome do módulo alvo.
mse_mmod_generateStandalone() {

  if [ -z "${MSE_GLOBAL_MODULES_PATH[$1]+x}" ]; then
    mse_inter_errorAlert "err" "${lbl_generateStandalone_moduleNotFound}"
  else
    local mseTargetFiles
    local mseFilePath

    local mseModulePath="${MSE_GLOBAL_MODULES_PATH[$1]}"
    local mseFileStandalone="${mseModulePath}/standalone.sh"
    local mseStandaloneContent=""
    mseStandaloneContent+="#!/usr/bin/env bash\n"
    mseStandaloneContent+="# myShellEnv v 1.0 [aeondigital.com.br]\n"



    #
    # Havendo funções especiais para a geração da versão standalone
    mse_mmod_loadStandaloneFunctions "$mseModulePath"
    if [ "$(type -t "mse_standalone_execOnStart")" == "function" ]; then
      mseStandaloneContent+=$(mse_standalone_execOnStart "$mseModulePath")
    fi





    #
    # Adiciona o arquivo de locale atualmente configurado
    if [ "$(type -t "mse_standalone_execBeforeLoadLocale")" == "function" ]; then
      mseStandaloneContent+=$(mse_standalone_execBeforeLoadLocale "$mseModulePath")
    fi

    mseStandaloneContent+=$(mse_mmod_retrieveOnlyCodeFromFile "${mseModulePath}/locale/${MSE_GLOBAL_MODULE_LOCALE}.sh")

    if [ "$(type -t "mse_standalone_execAfterLoadLocale")" == "function" ]; then
      mseStandaloneContent+=$(mse_standalone_execAfterLoadLocale "$mseModulePath")
    fi





    #
    # Adiciona o arquivo de variáveis de ambiente
    if [ "$(type -t "mse_standalone_execBeforeLoadEnv")" == "function" ]; then
      mseStandaloneContent+=$(mse_standalone_execBeforeLoadEnv "$mseModulePath")
    fi

    mseStandaloneContent+=$(mse_mmod_retrieveOnlyCodeFromFile "${mseModulePath}/config/env.sh")

    if [ "$(type -t "mse_standalone_execAfterLoadEnv")" == "function" ]; then
      mseStandaloneContent+=$(mse_standalone_execAfterLoadEnv "$mseModulePath")
    fi





    #
    # Adiciona o arquivo de variáveis locais
    if [ "$(type -t "mse_standalone_execBeforeLoadVariables")" == "function" ]; then
      mseStandaloneContent+=$(mse_standalone_execBeforeLoadVariables "$mseModulePath")
    fi

    mseStandaloneContent+=$(mse_mmod_retrieveOnlyCodeFromFile "${mseModulePath}/config/variables.sh")

    if [ "$(type -t "mse_standalone_execAfterLoadVariables")" == "function" ]; then
      mseStandaloneContent+=$(mse_standalone_execAfterLoadVariables "$mseModulePath")
    fi





    #
    # Adiciona o arquivo de aliases
    if [ "$(type -t "mse_standalone_execBeforeLoadAliases")" == "function" ]; then
      mseStandaloneContent+=$(mse_standalone_execBeforeLoadAliases "$mseModulePath")
    fi

    mseStandaloneContent+=$(mse_mmod_retrieveOnlyCodeFromFile "${mseModulePath}/config/aliases.sh")

    if [ "$(type -t "mse_standalone_execAfterLoadAliases")" == "function" ]; then
      mseStandaloneContent+=$(mse_standalone_execAfterLoadAliases "$mseModulePath")
    fi





    if [ "$(type -t "mse_standalone_execBeforeLoadScripts")" == "function" ]; then
      mseStandaloneContent+=$(mse_standalone_execBeforeLoadScripts "$mseModulePath")
    fi

    #
    # Coleta todos os scripts que o módulo dispõe
    mseTargetFiles=$(find "${mseModulePath}/scripts" -name "*.sh" | sort -n)
    if [ "${mseTargetFiles}" != "" ]; then
      while read mseFilePath; do
        mseStandaloneContent+=$(mse_mmod_retrieveOnlyCodeFromFile ${mseFilePath})
      done <<< ${mseTargetFiles}
    fi

    if [ "$(type -t "mse_standalone_execAfterLoadScripts")" == "function" ]; then
      mseStandaloneContent+=$(mse_standalone_execAfterLoadScripts "$mseModulePath")
    fi



    printf "${mseStandaloneContent}" > "${mseFileStandalone}"
    mse_mmod_unloadStandaloneFunctions
  fi
}
MSE_GLOBAL_CMD["generateStandalone"]="mse_mmod_generateStandalone"





#
# @desc
# Verifica se, para o módulo alvo, existe um arquivo contendo as funções de
# configurações especiais para a geração de uma versão "standalone".
#
# @param string $1
# Caminho completo até o diretório 'src' do módulo alvo.
mse_mmod_loadStandaloneFunctions() {
  if [ -f "${1}/config/module/standalone.sh" ]; then
    . "${1}/config/module/standalone.sh"
  fi
}
#
# @desc
# Executa o "unset" de todas funções auxiliares.
mse_mmod_unloadStandaloneFunctions() {
  local mseFunctionName
  for mseFunctionName in "${MSE_GLOBAL_STANDALONE_META_FUNCTIONS[@]}"; do
    unset "${mseFunctionName}"
  done
}
#
# @desc
# A partir da URL de um arquivo de script, retorna uma string contendo apenas
# as linhas de código. Linhas comentadas e em branco serão removidas.
# Serão adicionadas marcações especiais indicando o início e o final de cada
# bloco de código.
#
# @param string $1
# Caminho completo até o arquivo alvo.
mse_mmod_retrieveOnlyCodeFromFile() {
  local mseReturn=""
  local mseFullFileName=$(basename -- "$1")
  local mseFileContent=$(grep -vE '^(\s*$|\s*#)' "${1}")

  printf "# INI :: ${mseFullFileName}\n"
  printf "%s\n" "${mseFileContent}"
  printf "# END :: ${mseFullFileName}\n\n"
}
