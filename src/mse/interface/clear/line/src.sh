#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_interface_clear_line() {
  local mseCmd="2"
  local mseCR=""

  if [ $# -ge 1 ]; then
    if [ "${1}" == "l" ]; then
      mseCmd="1"
    elif [ "${1}" == "r" ]; then
      mseCmd="0"
    fi
  fi

  if [ $# -ge 2 ]; then
    if [ "${2}" == "1" ]; then
      mseCR="\r"
    fi
  fi

  printf "\e[${mseCmd}K${mseCR}"
}