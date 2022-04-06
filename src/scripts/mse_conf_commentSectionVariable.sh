#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Permite editar uma configuração do tipo chave=valor e comentar uma
# variável indicada.
#
# @param string $1
# Nome da seção alvo.
#
# @param string $2
# Nome da variável alvo.
#
# @param string $3
# Caracter que define que a linha está ou não comentada.
# Usualmente ; ou #
#
# @param string $4
# Caminho até o arquivo que deve ser verificado.
mse_conf_commentSectionVariable()
{
  # primeiro identifica se existe a linha da variável alvo.
  local mseTgtVariable

  mseTgtVariable=$(mse_conf_printSectionVariable "$1" "$2" "$4")
  if [ "${mseTgtVariable}" != "" ]; then
    if [ "$1" == "" ]; then
      # Apenas a primeira ocorrência.
      sed -i "/^\($2\s*=\)/{s/.*/$3&/;:A;n;bA}" "$4"
    else
      sed -i "/^\[$1\]$/,/^\[/ s/^\(.*$2\s*=.*\)$/$3\1/" "$4"
    fi;
  fi;
}
