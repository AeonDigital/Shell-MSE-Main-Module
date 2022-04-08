#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Normaliza uma linha do tipo "chave/valor" fazendo com que qualquer
# espaço existente antes e após o sinal de = seja removido.
#
# @param int $1
# Número da linha sendo transformada.
#
# @param string $2
# Conteúdo da linha sendo transformada.
#
# @param string $3
# Argumento opcional para complementar a transformação.
#
# @return
# Traz a string original transformada conforme indicado na descrição.
mse_mmod_readFile_transformLine_normalizeKeyValue() {
  local mseLine

  if [ $# -ge 2 ] && [ "$2" != "" ]; then
    mseLine=$(mse_str_trimD "=" "$2")
  fi

  printf "${mseLine}"
}
