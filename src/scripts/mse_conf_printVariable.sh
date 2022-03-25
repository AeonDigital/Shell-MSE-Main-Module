#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Imprime na tela toda a linha informativa sobre a variável de nome indicado presente em.
# qualquer ponto do arquivo de configuração alvo.
# Se a variável alvo estiver duplicada, apenas a primeira será levada em consideração.
#
# @param string $1
# Nome da variável alvo.
#
# @param string $2
# Caminho até o arquivo que deve ser verificado.
mse_conf_printVariable()
{
  mse_conf_printSectionVariable "" "$1" "$2"
}
