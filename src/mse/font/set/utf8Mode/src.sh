#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_font_set_utf8Mode() {
  local mseReturn=""

  local mseMode="check"
  if [ $# -ge 1 ] && ([ "${1,,}" == "on" ] || [ "${1,,}" == "off" ]); then
    mseMode="${1,,}"
  fi

  case "${mseMode}" in
    on)
      printf "\033%%G"
    ;;
    off)
      printf "\033%%@"
    ;;
  esac

  printf "UTF-8: ${mseMode} \u2658 \n"
}