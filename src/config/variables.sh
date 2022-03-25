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
# rodar o script 'mse_mmod_retrieveScriptDescription'
unset MSE_TMP_MODULE_SCRIPT_DESCRIPTION
declare -a MSE_TMP_MODULE_SCRIPT_DESCRIPTION=()


#
# Armazena uma coleção de chaves a serem configuradas em
# um arquivo de configuração.
unset MSE_GLOBAL_MODULE_ARRAY_CONFIG
declare -A MSE_GLOBAL_MODULE_ARRAY_CONFIG





#
# Identação a ser usada em cada linha de mensagem do tipo 'alert'.
MSE_GLOBAL_MODULE_ALERT_INDENT="    "
#
# Armazena cada linha de mensagem que será mostrada para um usuário em
# uma operação do tipo 'alert'.
MSE_GLOBAL_MODULE_ALERT_MSG=()





#
# Identação a ser usada em cada linha de mensagem do tipo 'alert'.
MSE_GLOBAL_MODULE_PROMPT_INDENT="    "
#
# Armazena cada linha de mensagem que será mostrada para um usuário em
# uma operação do tipo 'alert'.
MSE_GLOBAL_MODULE_PROMPT_MSG=()
#
# Guarda o resultado selecionado do prompt mostrado ao usuário.
MSE_GLOBAL_MODULE_PROMPT_RESULT=""
#
# Informa se a função de 'prompt' está sendo rodada em um ambiente de
# testes.
MSE_GLOBAL_MODULE_PROMPT_TEST=0





#
# Coleção de opções aceitas para um 'prompt' do tipo 'list'.
unset MSE_GLOBAL_MODULE_PROMPT_LIST_OPTIONS_LABELS
MSE_GLOBAL_MODULE_PROMPT_LIST_OPTIONS_LABELS=()
#
# Coleção de valores correspondentes às opções de 'labels' de um 'prompt'
# do tipo 'list'.
unset MSE_GLOBAL_MODULE_PROMPT_LIST_OPTIONS_VALUES
MSE_GLOBAL_MODULE_PROMPT_LIST_OPTIONS_VALUES=()





#
# Armazena cada linha de mensagem que será mostrada para um usuário em
# uma operação do tipo 'alert' ou 'prompt'.
MSE_GLOBAL_MODULE_GENERAL_MSG=()





#
# Registra as variáveis relativas às cores disponíveis para uso
# Outras cores podem ser definidas. Use sempre o prefixo 'mse'
# para evitar conflitos com outras libs.
. "${MSE_TMP_THIS_DIRECTORY}/config/colors.sh"
