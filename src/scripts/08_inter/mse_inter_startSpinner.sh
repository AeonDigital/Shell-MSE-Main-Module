#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Ativa um spinner que visa dar ao usuário a percepção de que um processo
# está ainda em andamento.
# Esta função ativa a configuração "+m" do bash que faz com que todos os
# processos rodem de forma desanexados.
#
# Para interromper o spinner use a função "mse_inter_stopSpinner".
#
# @param string $1
# Nome de um array contendo cada etapa do spinner que será apresentado.
# Se omitido, ou, se o nome for inválido, usará o spinner padrão.
#
# @link
# A construção deste spinner foi baseada nas orientações do seguinte
# tutorial
# https://willcarh.art/blog/how-to-write-better-bash-spinners
mse_inter_startSpinner() {
  declare -n mseSpinnerSteps="MSE_GLOBAL_SPINNER_DEFAULT"
  if [ $# -ge 1 ]; then
    if [[ "$(declare -p ${1} 2> /dev/null)" =~ "declare -a" ]]; then
      declare -n mseSpinnerSteps="${1}"
    fi
  fi

  set +m
  {
    local mseStep=""
    local mseFirst=1
    while : ; do
      # Causa um delay no início da apresentação para dar tempo do
      # prompt ser iniciado quando em modo interativo
      if [ "${mseFirst}" == "1" ]; then
        mseFirst=0
        sleep 0.5
      fi
      for mseStep in "${mseSpinnerSteps[@]}"; do
        printf "\r${mseStep}"
        sleep 0.2
      done
    done &
  } 2> /dev/null

  MSE_GLOBAL_SPINNER_PID=$!
}
