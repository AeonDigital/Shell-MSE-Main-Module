#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_is_char() {
  local mseReturn="0"
  #
  # A alteração do "LC_CTYPE" abaixo
  # resolve a contagem de caracteres multibyte/UTF8 garantindo
  # que cada caracter multibyte seja mesmo contabilizado apenas 1 vez.
  local oLC_CTYPE="$LC_CTYPE"
  LC_CTYPE=""
  if [ "${#1}" == "1" ]; then mseReturn="1"; else mseReturn="0"; fi
  LC_CTYPE="${oLC_CTYPE}"

  echo -n "${mseReturn}"
}