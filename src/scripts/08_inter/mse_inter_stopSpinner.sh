#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Encerra o spinner que está ativado.
# Esta função desativa a configuração "+m" do bash que faz com que todos os
# processos rodem de forma desanexados.
#
# @link
# A construção deste spinner foi baseada nas orientações do seguinte
# tutorial
# https://willcarh.art/blog/how-to-write-better-bash-spinners
mse_inter_stopSpinner() {
  {
    kill -9 "${MSE_GLOBAL_SPINNER_PID}" && wait;
  } 2> /dev/null

  set -m
  MSE_GLOBAL_SPINNER_PID=""
  mse_inter_clearLine "" "1"
}
