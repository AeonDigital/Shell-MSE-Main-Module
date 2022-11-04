#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Desinstala um submódulo para a instância atual do 'MSE'.
#
# @param string $1
# Nome do submódulo a ser desinstalado
mse_mmod_mng_submoduleUninstall() {

  local mseCode=1
  local mseMsg
  local mseHOME=$([ ! -z "${XDG_MAIN_HOME}" ] && echo "${XDG_MAIN_HOME}" || echo "${HOME}")
  local mseInstallationPath="${mseHOME}/apps/myShellEnv"



  if [ $# == 0 ] || [ "$1" == "" ]; then
    mseMsg=$(mse_str_replacePlaceHolder "${lbl_err_paramA_IsRequired}" "PARAM_A" "SubmoduleName")
    mse_inter_showAlert "i" "MSE::${mseMsg}"
  else
    local mseSubmoduleName=""
    local mseSubmoduleInstalled="0"


    #
    # Identifica se o submódulo de nome passado é válido
    local mseKey
    declare -a mseValidValues=()
    for mseKey in "${!MSE_GLOBAL_SUBMODULES_REPOSITORIES[@]}"; do
      mseValidValues+=("${mseKey}")
      if [ "${mseKey^^}" == "${1^^}" ]; then
        mseSubmoduleName="${mseKey}"
      fi
    done


    if [ "${mseSubmoduleName}" == "" ]; then
      mseMsg=$(mse_str_replacePlaceHolder "${lbl_err_paramA_HasInvalidValue}" "PARAM_A" "SubmoduleName")
      mse_inter_showAlert "i" "MSE::${mseMsg}" "mseValidValues"
    else

      #
      # Verifica se o submódulo indicado está instalado
      for mseKey in "${!MSE_AVAILABLE_MODULES[@]}"; do
        if [ "${mseKey}" == "${mseSubmoduleName}" ]; then
          mseSubmoduleInstalled="1"
        fi
      done


      if [ "${mseSubmoduleInstalled}" == "0" ]; then
        mse_inter_showAlert "e" "MSE::${lbl_submoduleUninstall_submoduleDoesNotExists}"
      else

        declare -a mseArr=()
        mse_inter_showPrompt "" "ca" "MSE::${lbl_generic_confirmActionToProceed}" "bool" "mseArr"

        if [ "${MSE_GLOBAL_PROMPT_RESULT}" == "0" ]; then
          mse_inter_showAlert "i" "MSE::${lbl_generic_actionAbortedByTheUser}"
        else

          #
          # 1. Remove o submódulo das configurações do 'MSE'
          local mseExecResult

          unset MSE_AVAILABLE_MODULES["${mseSubmoduleName}"]
          mseExecResult=$(mse_config_setVariable "${mseInstallationPath}/config.sh" "#" "0" "" "a" "MSE_AVAILABLE_MODULES" "MSE_AVAILABLE_MODULES" "")

          if [ "${mseExecResult}" == "0" ]; then
            mseMsg=$(mse_str_replacePlaceHolder "${lbl_submoduleUninstall_unableToEditConfigFile}" "FILE" "${mseInstallationPath}/config.sh")
            mse_inter_showAlert "e" "MSE::${mseMsg}" "lbl_generic_scriptInterruptedError"

          elif [ "${mseExecResult}" == "1" ]; then

            #
            # 2. Remove totalmente o submódulo

            #
            # 2.1 Verifica se há um arquivo de desinstalação
            if [ -f "${mseInstallationPath}/${mseSubmoduleName}/src/config/module/install.sh" ]; then
              unset mse_module_onUninstall

              . "${mseInstallationPath}/${mseSubmoduleName}/src/config/module/install.sh"
              if [ "$(type -t "mse_module_onUninstall")" == "function" ]; then
                mse_module_onUninstall
              fi
            fi


            # 2.2 desativa o submódulo e remove-o
            git -C "${mseInstallationPath}" submodule deinit -f -- "${mseSubmoduleName}"
            rm -rf "${mseInstallationPath}/.git/modules/${mseSubmoduleName}"
            git -C "${mseInstallationPath}" rm -f "${mseSubmoduleName}"

            # 2.3 comita as alterações
            git -C "${mseInstallationPath}" add .
            git -C "${mseInstallationPath}" commit -m "Remove submodule : '${mseSubmoduleName}'"


            #
            # Se o diretório do submódulo não foi removido ...
            if [ -d "${mseInstallationPath}/${mseSubmoduleName}" ]; then
              mse_inter_showAlert "e" "MSE::${lbl_submoduleUninstall_cannotRemove}" "lbl_generic_scriptInterruptedError"
            else
              mseCode=0
              mse_inter_showAlert "s" "MSE::${lbl_submoduleInstall_addSuccess}"

              bash
            fi
          fi
        fi

      fi
    fi
  fi


  return $mseCode
}
MSE_GLOBAL_CMD["mng submodule uninstall"]="mse_mmod_mng_submoduleUninstall"




#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_mmod_mng_submoduleUninstall_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=1
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="SubmoduleName :: r :: string"
}
