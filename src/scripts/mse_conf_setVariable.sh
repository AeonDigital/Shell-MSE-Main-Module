#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Permite editar uma configuração do tipo chave=valor que está armazenada
# em um arquivo de configuração.
#
# @param string $1
# Nome da variável alvo.
#
# @param string $2
# Valor que será atribuido à variável.
#
# @param string $3
# Caminho até o arquivo que deve ser verificado.
mse_conf_setVariable()
{
  mse_conf_setSectionVariable "" "$1" "$2" "$3";
}
