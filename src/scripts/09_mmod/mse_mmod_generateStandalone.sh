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
    declare -a mseStandaloneContent=()
    mseStandaloneContent+=("#!/usr/bin/env bash")
    mseStandaloneContent+=("# myShellEnv v 1.0 [aeondigital.com.br]")


    declare -a mseTmpArr=()
    local mseTmpLine=""


    #
    # Havendo funções especiais para a geração da versão standalone
    mse_mmod_loadStandaloneFunctions "$mseModulePath"
    if [ "$(type -t "mse_standalone_execOnStart")" == "function" ]; then
      mse_standalone_execOnStart "$mseModulePath" "mseTmpArr"

      for mseTmpLine in "${mseTmpArr[@]}"; do
        mseStandaloneContent+=("${mseTmpLine}")
      done
    fi





    #
    # Adiciona o arquivo de locale atualmente configurado
    if [ "$(type -t "mse_standalone_execBeforeLoadLocale")" == "function" ]; then
      mse_standalone_execBeforeLoadLocale "$mseModulePath" "mseTmpArr"

      for mseTmpLine in "${mseTmpArr[@]}"; do
        mseStandaloneContent+=("${mseTmpLine}")
      done
    fi

    mse_mmod_retrieveOnlyCodeFromFile "${mseModulePath}/locale/${MSE_GLOBAL_MODULE_LOCALE}.sh" "mseTmpArr"
    for mseTmpLine in "${mseTmpArr[@]}"; do
      mseStandaloneContent+=("${mseTmpLine}")
    done

    if [ "$(type -t "mse_standalone_execAfterLoadLocale")" == "function" ]; then
      mse_standalone_execAfterLoadLocale "$mseModulePath" "mseTmpArr"

      for mseTmpLine in "${mseTmpArr[@]}"; do
        mseStandaloneContent+=("${mseTmpLine}")
      done
    fi





    #
    # Adiciona o arquivo de variáveis de ambiente
    if [ "$(type -t "mse_standalone_execBeforeLoadEnv")" == "function" ]; then
      mse_standalone_execBeforeLoadEnv "$mseModulePath" "mseTmpArr"

      for mseTmpLine in "${mseTmpArr[@]}"; do
        mseStandaloneContent+=("${mseTmpLine}")
      done
    fi

    mse_mmod_retrieveOnlyCodeFromFile "${mseModulePath}/config/env.sh" "mseTmpArr"
    for mseTmpLine in "${mseTmpArr[@]}"; do
      mseStandaloneContent+=("${mseTmpLine}")
    done

    if [ "$(type -t "mse_standalone_execAfterLoadEnv")" == "function" ]; then
      mse_standalone_execAfterLoadEnv "$mseModulePath" "mseTmpArr"

      for mseTmpLine in "${mseTmpArr[@]}"; do
        mseStandaloneContent+=("${mseTmpLine}")
      done
    fi





    #
    # Adiciona o arquivo de variáveis locais
    if [ "$(type -t "mse_standalone_execBeforeLoadVariables")" == "function" ]; then
      mse_standalone_execBeforeLoadVariables "$mseModulePath" "mseTmpArr"

      for mseTmpLine in "${mseTmpArr[@]}"; do
        mseStandaloneContent+=("${mseTmpLine}")
      done
    fi

    mse_mmod_retrieveOnlyCodeFromFile "${mseModulePath}/config/variables.sh" "mseTmpArr"
    for mseTmpLine in "${mseTmpArr[@]}"; do
      mseStandaloneContent+=("${mseTmpLine}")
    done

    if [ "$(type -t "mse_standalone_execAfterLoadVariables")" == "function" ]; then
      mse_standalone_execAfterLoadVariables "$mseModulePath" "mseTmpArr"

      for mseTmpLine in "${mseTmpArr[@]}"; do
        mseStandaloneContent+=("${mseTmpLine}")
      done
    fi





    #
    # Adiciona o arquivo de aliases
    if [ "$(type -t "mse_standalone_execBeforeLoadAliases")" == "function" ]; then
      mse_standalone_execBeforeLoadAliases "$mseModulePath" "mseTmpArr"

      for mseTmpLine in "${mseTmpArr[@]}"; do
        mseStandaloneContent+=("${mseTmpLine}")
      done
    fi

    mse_mmod_retrieveOnlyCodeFromFile "${mseModulePath}/config/aliases.sh" "mseTmpArr"
    for mseTmpLine in "${mseTmpArr[@]}"; do
      mseStandaloneContent+=("${mseTmpLine}")
    done

    if [ "$(type -t "mse_standalone_execAfterLoadAliases")" == "function" ]; then
      mse_standalone_execAfterLoadAliases "$mseModulePath" "mseTmpArr"

      for mseTmpLine in "${mseTmpArr[@]}"; do
        mseStandaloneContent+=("${mseTmpLine}")
      done
    fi





    if [ "$(type -t "mse_standalone_execBeforeLoadScripts")" == "function" ]; then
      mse_standalone_execBeforeLoadScripts "$mseModulePath" "mseTmpArr"

      for mseTmpLine in "${mseTmpArr[@]}"; do
        mseStandaloneContent+=("${mseTmpLine}")
      done
    fi

    #
    # Coleta todos os scripts que o módulo dispõe
    mseTargetFiles=$(find "${mseModulePath}/scripts" -name "*.sh" | sort -n)
    if [ "${mseTargetFiles}" != "" ]; then
      while read mseFilePath; do
        mse_mmod_retrieveOnlyCodeFromFile ${mseFilePath} "mseTmpArr"
        for mseTmpLine in "${mseTmpArr[@]}"; do
          mseStandaloneContent+=("${mseTmpLine}")
        done
      done <<< ${mseTargetFiles}
    fi

    if [ "$(type -t "mse_standalone_execAfterLoadScripts")" == "function" ]; then
      mse_standalone_execAfterLoadScripts "$mseModulePath" "mseTmpArr"

      for mseTmpLine in "${mseTmpArr[@]}"; do
        mseStandaloneContent+=("${mseTmpLine}")
      done
    fi



    printf "%s\n" "${mseStandaloneContent[@]}" > "${mseFileStandalone}"
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
#
# @param string $2
# Nome do array que será preenchido com as informações que devem ser
# retornadas.
mse_mmod_retrieveOnlyCodeFromFile() {
  local mseFullFileName=$(basename -- "$1")
  local mseFileContent=$(grep -vE '^(\s*$|\s*#)' "${1}")

  declare -a mseSplitArr=()
  local mseLine

  readarray -t mseSplitArr <<< "$mseFileContent"

  declare -n mseTmpArrName="$2"
  mseTmpArrName=()

  if [ "${mseFileContent}" != "" ] && [ "${#mseSplitArr[@]}" -gt 0 ]; then
    mseTmpArrName+=("# INI :: ${mseFullFileName}")
    for mseLine in "${mseSplitArr[@]}"; do
      mseTmpArrName+=("${mseLine}")
    done
    mseTmpArrName+=("# END :: ${mseFullFileName}")
    mseTmpArrName+=("")
    mseTmpArrName+=("")
  fi
}
