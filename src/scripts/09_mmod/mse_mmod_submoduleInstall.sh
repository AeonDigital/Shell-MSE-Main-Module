#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Instala um submódulo para a instância atual do 'MSE'.
#
# @param string $1
# URL completa até o repositório onde se encontra o submódulo a ser instalado.
# Também pode ser definido o nome do submódulo se ele estiver definido entre
# uma coleção de itens pré-aprovados.
#
mse_mmod_submoduleInstall() {
  local mseCode=1
  local mseMsg
  local mseInstallationPath="${HOME}/.config/myShellEnv"
  local mseSubmoduleName=""



  if [ $# == 0 ] || [ "$1" == "" ]; then
    mseMsg=$(mse_str_replacePlaceHolder "${lbl_err_paramA_IsRequired}" "PARAM_A" "Repositorie")
    mse_inter_alertUser "i" "MSE" "${mseMsg}"
  else
    local mseTargetModuleURL=""

    #
    # Tratando-se de uma URL...
    if [[ "${1}" =~ "https://" ]]; then
      mseTargetModuleURL="${1}"
    else
      #
      # Tenta identificar qual é a URL alvo que trata o submódulo apontado
      local mseKey
      declare -a mseValidValues=()
      for mseKey in "${!MSE_GLOBAL_SUBMODULES_REPOSITORIES[@]}"; do
        mseValidValues+=("${mseKey}")
        if [ "${mseKey^^}" == "${1^^}" ]; then
          mseTargetModuleURL="${MSE_GLOBAL_SUBMODULES_REPOSITORIES[$mseKey]}"
        fi
      done
    fi


    if [ "${mseTargetModuleURL}" == "" ]; then
      mseMsg=$(mse_str_replacePlaceHolder "${lbl_err_paramA_HasInvalidValue}" "PARAM_A" "Repositorie")
      mse_inter_alertUser "i" "MSE" "${mseMsg}" "mseValidValues"
    else
      declare -a mseArr=()
      mse_inter_promptUser "" "" "${lbl_generic_confirmActionToProceed}" "mseArr" "bool"

      if [ "${MSE_GLOBAL_PROMPT_RESULT}" == "0" ]; then
        mse_inter_alertUser "i" "MSE" "${lbl_generic_actionAbortedByTheUser}"
      else

        #
        # Verifica se o módulo já existe
        mseSubmoduleName=$(basename -- "$mseTargetModuleURL")
        mseSubmoduleName="${mseSubmoduleName%.*}"
        if [ -d "${mseInstallationPath}/${mseSubmoduleName}" ]; then
          mse_inter_alertUser "e" "MSE" "${lbl_submoduleInstall_alreadExists}" "lbl_generic_scriptInterruptedError"
        else
          mse_inter_alertUser "i" "MSE" "${lbl_submoduleInstall_addNew}"

          git -C "${mseInstallationPath}" submodule add "${mseTargetModuleURL}"
          git -C "${mseInstallationPath}" submodule set-branch --branch main -- "${mseInstallationPath}/${mseSubmoduleName}"
          git -C "${mseInstallationPath}" submodule update --remote

          if [ -d "${mseInstallationPath}/${mseSubmoduleName}" ]; then
            local mseExecResult
            #
            # Registra o módulo como disponível e ativo
            # para que ele seja carregado junto no próximo reinicio.
            MSE_AVAILABLE_MODULES["${mseSubmoduleName}"]=1
            mseExecResult=$(mse_conf_setVariable "${mseInstallationPath}/config.sh" "#" "0" "" "a" "MSE_AVAILABLE_MODULES" "MSE_AVAILABLE_MODULES" "")


            if [ "${mseExecResult}" == "1" ]; then
              #
              # Verifica se há um arquivo de instalação
              if [ -f "${mseInstallationPath}/${mseSubmoduleName}/src/install.sh" ]; then
                if [ "$(type -t "mse_module_onInstall")" == "function" ]; then
                  unset mse_module_onInstall
                fi

                . "${mseInstallationPath}/${mseSubmoduleName}/src/install.sh"

                if [ "$(type -t "mse_module_onInstall")" == "function" ]; then
                  mse_module_onInstall
                fi
              fi


              # comita as alterações
              git -C "${mseInstallationPath}" add .
              git -C "${mseInstallationPath}" commit -m "Add submodule : '${mseSubmoduleName}'"

              mseCode=0
              mse_inter_alertUser "s" "MSE" "${lbl_submoduleInstall_addSuccess}"

              bash
            else
              mseMsg=$(mse_str_replacePlaceHolder "${lbl_submoduleInstall_unableToEditConfigFile}" "FILE" "${mseInstallationPath}/config.sh")
              mse_inter_alertUser "w" "MSE" "${mseMsg}" "lbl_submoduleInstall_unableToEditConfigFile_msg"
            fi
          else
            mse_inter_alertUser "e" "MSE" "${lbl_submoduleInstall_addFail}"
          fi
        fi
      fi
    fi
  fi


  return $mseCode
}
MSE_GLOBAL_CMD["submodule install"]="mse_mmod_submoduleInstall"




#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_mmod_submoduleInstall_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=1
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="Repositorie :: r :: string"
}
