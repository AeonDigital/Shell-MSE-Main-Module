#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Permite editar uma configuração do tipo chave=valor e descomentar uma
# variável indicada.
#
# @param string $1
# Nome da variável alvo.
#
# @param string $2
# Caracter que define que a linha está ou não comentada.
# Usualmente ; ou #
#
# @param string $3
# Caminho até o arquivo que deve ser verificado.
mse_conf_uncommentVariable()
{
  mse_conf_uncommentSectionVariable "" "$1" "$2" "$3"
}
