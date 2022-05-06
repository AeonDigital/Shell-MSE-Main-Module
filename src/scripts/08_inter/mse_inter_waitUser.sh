#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Mostra uma mensagem de alerta para o usuário e para a execução do script
# até que ele digite uma tecla qualquer.
#
# @param string $1
# Nome de um array em que estão as informações que devem ser mostradas para o
# usuário.
#
# @param string $2
# Opcional. Tipo de mensagem.
# Permite indicar exatamente que tipo de mensagem está sendo mostrada.
#
#   - info      | i   : Informação genérica (valor padrão).
#   - attention | a   : Atenção.
#   - warning   | w   : Alerta.
#   - error     | e   : Erro em uma operação.
#   - fail      | f   : Falha em uma operação.
#   - success   | s   : Sucesso em uma operação.
#
# @param string $3
# Opcional.
# Indique "1" ou omita para usar cores.
# Indique "0" ou "" para não usar cores.
#
# @param string $4
# Opcional.
# Nome da função usada para renderizar as mensagens a serem mostradas na tela.
# 'theme' que será usada para printar as mensagens na tela.
#
# @return
# Printa na tela as informações desejadas como um alerta para o usuário.
# Em caso de erro, suprimirá qualquer saída e a mensagem de erro ficará
# registrada na variável global 'MSE_GLOBAL_LASTERR'.
mse_inter_waitUser() {
  mse_inter_alertUser "$@"

  if [ ${#MSE_GLOBAL_MODULE_ALERT_MSG[@]} == 0 ] && [ ${#MSE_GLOBAL_MODULE_GENERAL_MSG[@]} == 0 ]; then
    mse_mmod_errorAlert "${FUNCNAME[0]}" "${lbl_genericError_emptyArray} MSE_GLOBAL_MODULE_ALERT_MSG"
  else
    if [ ${#MSE_GLOBAL_MODULE_ALERT_MSG[@]} == 0 ]; then
      MSE_GLOBAL_MODULE_ALERT_MSG=("${MSE_GLOBAL_MODULE_GENERAL_MSG[@]}")
    fi

    local mseMsg
    for mseMsg in "${MSE_GLOBAL_MODULE_ALERT_MSG[@]}"; do
      printf "${MSE_GLOBAL_MODULE_ALERT_INDENT}$mseMsg \n"
    done
    read -n 1 -s -r -p "${MSE_GLOBAL_MODULE_ALERT_INDENT}[ ${lbl_genericMessage_pressAnyKeyToProceed} ] `printf $'\n '`"

    MSE_GLOBAL_MODULE_ALERT_MSG=()
    MSE_GLOBAL_MODULE_GENERAL_MSG=()
  fi
}
