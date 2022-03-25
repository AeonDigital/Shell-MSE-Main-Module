#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Imprime todas as variáveis do arquivo de configuração indicado.
#
# Linhas comentadas não serão mostradas.
#
# @param string $1
# Caminho até o arquivo que deve ser verificado.
mse_conf_printVariables()
{
  mse_conf_printSectionVariables "" "$1";
}
