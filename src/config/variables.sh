#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Armazena o nome de todos os módulos carregados.
unset MSE_GLOBAL_MODULES_NAMES
declare -a MSE_GLOBAL_MODULES_NAMES=()


#
# Armazena o nome de cada um dos scripts caregados
# correlacionado com o índice do nome dos módulos carregados
# e registrados no array 'MSE_GLOBAL_MODULES_NAMES'
unset MSE_GLOBAL_MODULE_SCRIPTS
declare -A MSE_GLOBAL_MODULE_SCRIPTS


#
# Armazena a descrição de cada um dos scripts carregados
# correlacionado com o índice do nome dos módulos e scripts
# registrados nos arrays 'MSE_GLOBAL_MODULES_NAMES' e
# 'MSE_GLOBAL_MODULE_SCRIPTS'
unset MSE_GLOBAL_MODULE_SCRIPTS_DESCRIPTION
declare -A MSE_GLOBAL_MODULE_SCRIPTS_DESCRIPTION


#
# Armazena temporariamente o último resultado obtido ao
# rodar o script 'mse_mod_retrieveScriptDescription'
unset MSE_TMP_MODULE_SCRIPT_DESCRIPTION
declare -a MSE_TMP_MODULE_SCRIPT_DESCRIPTION=()
