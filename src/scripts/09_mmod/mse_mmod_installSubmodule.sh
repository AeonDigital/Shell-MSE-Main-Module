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
mse_mmod_installSubmodule() {
  local mseCode=1
  local mseMsg
  local mseInstallationPath="${HOME}/.config/myShellEnv"
  local mseSubmoduleDirectory=""



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
      declare -a mseValidValues
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
      declare -a mseArr
      mse_inter_promptUser "" "" "${lbl_generic_confirmActionToProceed}" "mseArr" "bool"

      if [ "${MSE_GLOBAL_PROMPT_RESULT}" == "0" ]; then
        mse_inter_alertUser "i" "MSE" "${lbl_generic_actionAbortedByTheUser}"
      else

        #
        # Verifica se o módulo já existe
        mseSubmoduleDirectory=$(basename -- "$mseTargetModuleURL")
        mseSubmoduleDirectory="${mseSubmoduleDirectory%.*}"
        if [ -d "${mseInstallationPath}/${mseSubmoduleDirectory}" ]; then
          mse_inter_alertUser "e" "MSE" "${lbl_submoduleInstall_alreadExists}" "lbl_generic_scriptInterruptedError"
        else
          mse_inter_alertUser "i" "MSE" "${lbl_submoduleInstall_addNew}"

          git -C "${mseInstallationPath}" submodule add "${mseTargetModuleURL}"
          git -C "${mseInstallationPath}" submodule set-branch --branch main -- "${mseInstallationPath}/${mseSubmoduleDirectory}"
          git -C "${mseInstallationPath}" submodule update --remote

          if [ -d "${mseInstallationPath}/${mseSubmoduleDirectory}" ]; then
            mseCode=0
            mse_inter_alertUser "s" "MSE" "${lbl_submoduleInstall_addSuccess}"
          else
            mse_inter_alertUser "e" "MSE" "${lbl_submoduleInstall_addFail}"
          fi
        fi
      fi
    fi
  fi


  return $mseCode
}
MSE_GLOBAL_CMD["install submodule"]="mse_mmod_installSubmodule"




#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_mmod_installSubmodule_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=1
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="Repositorie :: r :: string"
}
