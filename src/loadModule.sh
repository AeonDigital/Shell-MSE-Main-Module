#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]
#
# No diretório raiz use o comando abaixo para iniciar
# este módulo de forma independente
# . src/loadModule.sh



#
# Diretório 'src'
MSE_TMP_THIS_DIRECTORY=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

#
# Se o locale para as mensagens não está definido, usa o padrão 'en-us',
if [ -z ${MSE_GLOBAL_MODULE_LOCALE+x} ]; then
  MSE_GLOBAL_MODULE_LOCALE="en-us"
fi
	MSE_TMP_PATH_TO_LOCALE="${MSE_TMP_THIS_DIRECTORY}/locale/${MSE_GLOBAL_MODULE_LOCALE}.sh"
if [ ! -f "${MSE_TMP_PATH_TO_LOCALE}" ]; then
	MSE_TMP_PATH_TO_LOCALE="${MSE_TMP_THIS_DIRECTORY}/locale/en-us.sh"
fi
. "${MSE_TMP_PATH_TO_LOCALE}"



#
# Carrega as variáveis do módulo caso um arquivo 'variables.sh' esteja definido
if [ -f "${MSE_TMP_THIS_DIRECTORY}/config/variables.sh" ]; then
	. "${MSE_TMP_THIS_DIRECTORY}/config/variables.sh"
fi

#
# Carrega os 'aliases' do módulo caso um arquivo 'aliases.sh' esteja definido
if [ -f "${MSE_TMP_THIS_DIRECTORY}/config/aliases.sh" ]; then
	. "${MSE_TMP_THIS_DIRECTORY}/config/aliases.sh"
fi


. "${MSE_TMP_THIS_DIRECTORY}/scripts/mse_mmod_registerModule.sh"
mse_mmod_registerModule "#MainModule" "${MSE_TMP_THIS_DIRECTORY}"


unset MSE_TMP_THIS_DIRECTORY
