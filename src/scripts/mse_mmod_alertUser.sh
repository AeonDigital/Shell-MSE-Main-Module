#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Mostra uma mensagem de alerta para o usuário.
#
# A mensagem mostrada deve ser preparada no array ${MSE_GLOBAL_MODULE_ALERT_MSG}
# onde, cada item do array será definido em uma linha do terminal
#
# @example
#   MSE_GLOBAL_MODULE_ALERT_MSG=()
#   MSE_GLOBAL_MODULE_ALERT_MSG[0]=$(printf "Sucesso!")
#   MSE_GLOBAL_MODULE_ALERT_MSG[1]=$(printf "Todos os scripts foram atualizados")
#
#   mse_mmod_alertUser
mse_mmod_alertUser() {
  if [ ${#MSE_GLOBAL_MODULE_ALERT_MSG[@]} == 0 ] && [ ${#MSE_GLOBAL_MODULE_GENERAL_MSG[@]} == 0 ]; then
    mse_mmod_errorAlert "${FUNCNAME[0]}" "${lbl_genericError_emptyArray} MSE_GLOBAL_MODULE_ALERT_MSG"
  else
    if [ ${#MSE_GLOBAL_MODULE_ALERT_MSG[@]} == 0 ]; then
      MSE_GLOBAL_MODULE_ALERT_MSG=("${MSE_GLOBAL_MODULE_GENERAL_MSG[@]}")
    fi

    local mseMsg
    for mseMsg in "${MSE_GLOBAL_MODULE_ALERT_MSG[@]}"; do
      printf "${MSE_GLOBAL_MODULE_ALERT_INDENT}${mseMsg}\n"
    done

    MSE_GLOBAL_MODULE_ALERT_MSG=()
    MSE_GLOBAL_MODULE_GENERAL_MSG=()
  fi
}
