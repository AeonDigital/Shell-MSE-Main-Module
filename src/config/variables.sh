#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Identificadores dos submódulos.
# Cada identificador é um prefixo usado no nome das respectivas funções
MSE_TMP_SUBMODULES="check::str::str_convert::exec::file::conf::font::inter::misc"


#
# Array associativo que armazena os repositórios de submódulos que estão aptos
# a serem adicionados à instância atualmente instalada.
declare -gA MSE_GLOBAL_SUBMODULES_REPOSITORIES
MSE_GLOBAL_SUBMODULES_REPOSITORIES["Shell-MSE-Prompt"]="https://github.com/AeonDigital/Shell-MSE-Prompt.git"
MSE_GLOBAL_SUBMODULES_REPOSITORIES["Shell-MSE-Notes"]="https://github.com/AeonDigital/Shell-MSE-Notes.git"



#
# Coleção de comandos que facilitam o acesso a funções do módulo
# e servem de opções para o autocomplete.
declare -gA MSE_GLOBAL_CMD
#
# Coleção de chaves/valores que auxiliam a comparação dos comandos
# que estão sendo digitados pelo usuário.
declare -gA MSE_GLOBAL_CMD_COMPARE


#
# Indica o tipo de 'intervenção' que deve ser feita ao executar o autocomplete.
# Os modos esperados são "C" ou "F".
# Se vazio ou inválido, desabilitará este recurso.
MSE_GLOBAL_COMPLETION_MODE="F"




#
# Coleção de funções que podem ser definidas em um arquivo "register.sh"
# no diretório "/src/config/module".
#
# Estas funções tem o papel de auxiliar o registrador a executar sua função
# ao carregar a iniciar cada módulo.
declare -a MSE_GLOBAL_REGISTERMODULE_META_FUNCTIONS=()
MSE_GLOBAL_REGISTERMODULE_META_FUNCTIONS+=("mse_registerModule_execOnStart")
MSE_GLOBAL_REGISTERMODULE_META_FUNCTIONS+=("mse_registerModule_execOnEnd")
MSE_GLOBAL_REGISTERMODULE_META_FUNCTIONS+=("mse_registerModule_execBeforeLoadLocale")
MSE_GLOBAL_REGISTERMODULE_META_FUNCTIONS+=("mse_registerModule_execAfterLoadLocale")
MSE_GLOBAL_REGISTERMODULE_META_FUNCTIONS+=("mse_registerModule_execBeforeLoadEnv")
MSE_GLOBAL_REGISTERMODULE_META_FUNCTIONS+=("mse_registerModule_execAfterLoadEnv")
MSE_GLOBAL_REGISTERMODULE_META_FUNCTIONS+=("mse_registerModule_execBeforeLoadVariables")
MSE_GLOBAL_REGISTERMODULE_META_FUNCTIONS+=("mse_registerModule_execAfterLoadVariables")
MSE_GLOBAL_REGISTERMODULE_META_FUNCTIONS+=("mse_registerModule_execBeforeLoadAliases")
MSE_GLOBAL_REGISTERMODULE_META_FUNCTIONS+=("mse_registerModule_execAfterLoadAliases")
MSE_GLOBAL_REGISTERMODULE_META_FUNCTIONS+=("mse_registerModule_execBeforeLoadScripts")
MSE_GLOBAL_REGISTERMODULE_META_FUNCTIONS+=("mse_registerModule_execAfterLoadScripts")
#
# Coleção de funções que podem ser definidas em um arquivo "standalone.sh"
# no diretório "/src/config/module".
#
# Estas funções tem o papel de auxiliar a gerar uma versão "standalone" do módulo
# apontado.
declare -a MSE_GLOBAL_STANDALONE_META_FUNCTIONS=()
MSE_GLOBAL_STANDALONE_META_FUNCTIONS+=("mse_standalone_execOnStart")
MSE_GLOBAL_STANDALONE_META_FUNCTIONS+=("mse_standalone_execOnEnd")
MSE_GLOBAL_STANDALONE_META_FUNCTIONS+=("mse_standalone_execBeforeLoadLocale")
MSE_GLOBAL_STANDALONE_META_FUNCTIONS+=("mse_standalone_execAfterLoadLocale")
MSE_GLOBAL_STANDALONE_META_FUNCTIONS+=("mse_standalone_execBeforeLoadEnv")
MSE_GLOBAL_STANDALONE_META_FUNCTIONS+=("mse_standalone_execAfterLoadEnv")
MSE_GLOBAL_STANDALONE_META_FUNCTIONS+=("mse_standalone_execBeforeLoadVariables")
MSE_GLOBAL_STANDALONE_META_FUNCTIONS+=("mse_standalone_execAfterLoadVariables")
MSE_GLOBAL_STANDALONE_META_FUNCTIONS+=("mse_standalone_execBeforeLoadAliases")
MSE_GLOBAL_STANDALONE_META_FUNCTIONS+=("mse_standalone_execAfterLoadAliases")
MSE_GLOBAL_STANDALONE_META_FUNCTIONS+=("mse_standalone_execBeforeLoadScripts")
MSE_GLOBAL_STANDALONE_META_FUNCTIONS+=("mse_standalone_execAfterLoadScripts")






#
# Armazena todas as meta informações referentes a cada módulo, submódulo
# e funções carregadas.
#
# Cada chave será composta conforme os 3 modelos indicados abaixo:
#   - Módulos
#   [M::ModuleName]
#   Valor: Total de funções
#   - SubMódulos
#   [S::ModuleName::SubModuleName]
#   Valor: Total de funções
#   - Funções
#   [F::ModuleName::SubModuleName::FunctionName]
#   Valor: Caminho completo até o arquivo de definição da função.
declare -gA MSE_GLOBAL_MODULES_METADATA
#
# Armazena as chaves que identificam os módulos, submódulos e funções
# em ordem alfabética de apresentação (com submódulos e funções devidamente
# aninhadas).
declare -ga MSE_GLOBAL_MODULES_METADATA_INDEXED
#
# Armazena o caminho completo até o diretório "src" de cada módulo carregado.
declare -gA MSE_GLOBAL_MODULES_PATH





#
# Armazena a última mensagem de erro ocorrida na execução de uma função.
declare -g MSE_GLOBAL_LASTERR=""

#
# Armazena a última mensagem de retorno resultante da execução de uma função.
declare -g MSE_GLOBAL_RETURN=""



#
# INTERFACE

#
# Função do 'theme' usada para renderizar as mensagens de interface
# [Esta configuração fica efetiva no arquivo "config.sh"]
# MSE_GLOBAL_THEME_NAME="mse_inter_theme_default"
#
# Indica o 'theme' que está carregado no momento.
MSE_GLOBAL_THEME_LOADED=""
#
# Armazena uma configuração "prepareMessage" usando o tema padrão.
# Usado com "showMessage"
declare -gA MSE_GLOBAL_SHOW_MESSAGE_CONFIG
#
# Armazena uma configuração "prepareProgressBar" usando o tema padrão.
# Usado com "showProgressBar"
declare -gA MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG
#
# Armazena uma configuração "prepareMessage" usando o tema padrão.
# Usado com "showPrompt"
declare -gA MSE_GLOBAL_SHOW_PROMPT_CONFIG


#
# Armazena a última resposta do usuário a um prompt.
MSE_GLOBAL_PROMPT_RESULT=""

#
# Armazena o ID do processo de controle do spinner.
trap mse_inter_stopSpinner EXIT
MSE_GLOBAL_SPINNER_PID=""

#
# Modelo de spinner padrão
MSE_GLOBAL_SPINNER_DEFAULT=(" / " " - " " \\ " " | ")

#
# Modelo de spinner vai e vem
MSE_GLOBAL_SPINNER_COMESANDGOES=(" •      " "  •     " "   •    " "    •   " "     •  " "      • " "     •  " "    •   " "   •    " "  •     ")




#
# EXEC - VALIDATE

#
# Para fins de validação
# Armazena os parametros que estão sendo passados para uma função.
unset MSE_GLOBAL_VALIDATE_PARAMETERS_DATA
declare -ga MSE_GLOBAL_VALIDATE_PARAMETERS_DATA

#
# Para fins de validação
# Armazena as regras de validação de cada um dos parametros de uma função.
unset MSE_GLOBAL_VALIDATE_PARAMETERS_RULES
declare -gA MSE_GLOBAL_VALIDATE_PARAMETERS_RULES



#
# STRING

#
# Armazena o resultado de um 'split' de uma string resultante do uso da
# função 'mse_str_split'.
declare -ga MSE_GLOBAL_MODULE_SPLIT_RESULT
