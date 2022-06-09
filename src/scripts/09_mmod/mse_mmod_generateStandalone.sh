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
    local rawLine
    local mseCheck

    local mseModulePath="${MSE_GLOBAL_MODULES_PATH[$1]}"
    declare -a mseTargetFiles=()

    #
    # Adiciona o arquivo de locale atualmente configurado
    mseTargetFiles+=("${mseModulePath}/locale/${MSE_GLOBAL_MODULE_LOCALE}.sh")

    #
    # Adiciona o arquivo de variáveis de ambiente
    mseTargetFiles+=("${mseModulePath}/config/env.sh")

    #
    # Adiciona o arquivo de variáveis locais
    mseTargetFiles+=("${mseModulePath}/config/variables.sh")

    #
    # Adiciona o arquivo de aliases
    mseTargetFiles+=("${mseModulePath}/config/aliases.sh")

    #
    # Verifica outras configurações que possam estar disponíveis mas são
    # particulares do módulo em questão
    mseConfigFiles=$(find "${mseModulePath}/config" -name "*.sh" | sort -n)
    if [ "$mseConfigFiles" != "" ]; then
      while read rawLine; do
        mseCheck=$(mse_check_hasValueInArray "${rawLine}" "mseTargetFiles")

        if [ "${mseCheck}" == "0" ]; then
          mseTargetFiles+=("${rawLine}")
        fi
      done <<< ${mseConfigFiles}
    fi


    #
    # Coleta todos os scripts que o módulo dispõe
    mseModFiles=$(find "${mseModulePath}/scripts" -name "*.sh" | sort -n)
    if [ "$mseModFiles" != "" ]; then
      while read rawLine; do
        mseTargetFiles+=("${rawLine}")
      done <<< ${mseModFiles}
    fi



    local mseFileContent
    local mseFileStandalone="${mseModulePath}/standalone.sh"
    local mseFullFileName=$(basename -- "$rawLine")

    > "${mseFileStandalone}"
    printf "%s\n" "#!/usr/bin/env bash" >> "${mseFileStandalone}"
    printf "%s\n\n\n" "# myShellEnv v 1.0 [aeondigital.com.br]" >> "${mseFileStandalone}"


    for mseFile in "${mseTargetFiles[@]}"; do
      mseFullFileName=$(basename -- "$mseFile")

      mseFileContent=$(grep -vE '^(\s*$|\s*#)' "${mseFile}")

      echo -e "# INI :: ${mseFullFileName}" >> "${mseFileStandalone}"
      printf "%s\n" "${mseFileContent}" >> "${mseFileStandalone}"
      echo -e "# END :: ${mseFullFileName}\n\n" >> "${mseFileStandalone}"
    done
  fi
}
MSE_GLOBAL_CMD["generateStandalone"]="mse_mmod_generateStandalone"
