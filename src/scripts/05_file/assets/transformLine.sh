#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Normaliza uma linha do tipo "chave/valor" fazendo com que qualquer
# espaço existente antes e após o sinal de = seja removido.
#
# @param string $1
# Nome do array associativo que traz as configurações para leitura sendo
# usadas no momento.
#
# @param int $2
# Número da linha sendo transformada.
#
# @param string $3
# Conteúdo da linha sendo transformada.
#
# @param bool $4
# Indique "0" para informar que as linhas sendo processadas estão em formato
# 'raw' (tal qual no arquivo original).
# Indique "1" para informar que há, no conteúdo de cada linha, há a informação
# de seu respectivo número dentro do arquivo alvo.
#
# @param string $5
# Argumento opcional para complementar a verificação.
# Conforme a implementação pode ser obrigatorio.
#
# @return
# Traz a string original transformada conforme indicado na descrição.
mse_file_read_transformLine_normalizeKeyValue() {
  local mseLine

  if [ $# -ge 3 ] && [ "$3" != "" ]; then
    mseLine=$(mse_str_trimD "=" "$3")
  fi

  printf "${mseLine}"
}
