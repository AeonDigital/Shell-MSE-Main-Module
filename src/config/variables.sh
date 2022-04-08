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
# O array associativo 'MSE_GLOBAL_MODULE_READ_BLOCK' permite configurar
# a função 'mse_mmod_readFile' indicando para ela como encontrar um ou
# mais bloco de informações que devem ser retornadas.
#
# Tenha em mente que a função 'mse_mmod_readFile', por padrão irá printar
# na tela todas as linhas de dados do arquivo passado, no entanto, usando
# esta variável e suas chaves você pode informar a ele apenas os pontos
# que lhe interessa dentro de um arquivo.
#
# Cada uma das chaves abaixo tem uma função específica neste cenário mas
# elas só serão ativadas se a "start" for definida pois é a partir dela
# que todas as demais fazem sentido.
unset MSE_GLOBAL_MODULE_READ_BLOCK
declare -A MSE_GLOBAL_MODULE_READ_BLOCK
#
# "start"
# Indica o nome de uma função validadora que marcará o início de uma parte
# 'válida' de um arquivo que se deseja retornar.
#
# Manter este valor vazio fará com que todo o conteúdo do arquivo seja
# considerado como 'retornável'.
# Já, ao contrário, ao indicar uma função validadora fará com que todas as
# linhas sejam consideradas 'não retornáveis' até chegar em alguma cujo
# teste retorne positivo.
#
# Veja na seção 'FUNÇÕES VALIDADORAS' abaixo a interface das funções que
# podem ser definidas aqui.
MSE_GLOBAL_MODULE_READ_BLOCK["start"]=""
#
# "start_args"
# Permite armazenar alguma informação extra que será passada para a função
# validadora como um argumento extra.
MSE_GLOBAL_MODULE_READ_BLOCK["start_args"]=""
#
# "end"
# Indica o nome de uma função validadora que marcará o final de uma parte
# 'válida' de um arquivo que se deseja retornar.
MSE_GLOBAL_MODULE_READ_BLOCK["end"]=""
#
# "end_args"
# Permite armazenar alguma informação extra que será passada para a função
# validadora como um argumento extra.
MSE_GLOBAL_MODULE_READ_BLOCK["end_args"]=""
#
# "print_start_line"
# Indique "" ou "0" para que a linha inicial de um bloco válido seja omitida.
# Indique "1" para que esta primeira linha identificada seja também retornada.
MSE_GLOBAL_MODULE_READ_BLOCK["print_start_line"]=""



#
# O array associativo 'MSE_GLOBAL_MODULE_READ_LINE' permite configurar
# a função 'mse_mmod_readFile' indicando para ela como saber se a linha
# atualmente sendo verificada deve ou não ser retornada.
#
# Tenha em mente que a função 'mse_mmod_readFile', por padrão irá printar
# na tela todas as linhas de dados do arquivo passado, no entanto, usando
# esta variável e suas chaves você pode informar a ele como identificar
# com precisão as linhas exatas que deseja retornar.
#
# Cada uma das chaves abaixo tem uma função específica neste cenário mas
# elas só serão ativadas se a "check" for definida pois é a partir dela
# que todas as demais fazem sentido.
unset MSE_GLOBAL_MODULE_READ_LINE
declare -A MSE_GLOBAL_MODULE_READ_LINE
#
# "check"
# Indica o nome de uma função validadora que permite identificar se a linha
# atualmente sendo processada deve ser retornada.
#
# Manter este valor vazio fará com que todos linhas dentro de um bloco válido
# seja 'retornavél'.
# Já, ao contrário, ao indicar uma função validadora fará com que todas as
# linhas sejam consideradas 'não retornáveis' exceto aquelas que passarem
# no teste proposto.
#
# Veja na seção 'FUNÇÕES VALIDADORAS' abaixo a interface das funções que
# podem ser definidas aqui.
MSE_GLOBAL_MODULE_READ_LINE["check"]=""
#
# "check_args"
# Permite armazenar alguma informação extra que será passada para a função
# validadora como um argumento extra.
MSE_GLOBAL_MODULE_READ_LINE["check_args"]=""
#
# "check_invert"
# Indique "1" para inverter a saida da função definida em "check".
MSE_GLOBAL_MODULE_READ_LINE["check_invert"]=""
#
# "transform"
# Indica o nome de uma função que irá receber como argumentos as mesmas
# informações que as funções validadoras mas, neste caso, irá promover uma
# transformação na linha, permitindo que ela seja vista de forma diferente
# daquela que está atualmente registrada no arquivo.
# Nenhuma alteração será feita no arquivo em si.
#
# Veja na seção 'FUNÇÕES TRANSFORMADORAS' abaixo a interface das funções que
# podem ser definidas aqui.
MSE_GLOBAL_MODULE_READ_LINE["transform"]=""
#
# "transform_args"
# Permite armazenar alguma informação extra que será passada para a função
# definida em "transform".
MSE_GLOBAL_MODULE_READ_LINE["transform_args"]=""



#
# FUNÇÕES VALIDADORAS
# Usadas tanto para identificar o início e o fim de uma seção quanto para
# verificar se uma linha contém o tipo de informação que se está procurando
# tais funções devem seguir a seguinte interface:
#
# ---
#
# Descrição da verificação sendo realizada.
#
# @param int $1
# Número da linha sendo verificada.
#
# @param string $2
# Conteúdo da linha sendo verificada.
#
# @param string $3
# Argumento opcional para complementar a verificação.
#
# @return
# Printa '1' se o teste for positivo.
# Printa '0' se o teste for negativo.
# ---



#
# FUNÇÕES TRANSFORMADORAS
# Usadas para transformar as informações das linhas identificadas como válidas
# tais funções devem seguir a seguinte interface:
#
# ---
#
# Descrição da transformação sendo realizada.
#
# @param int $1
# Número da linha sendo transformada.
#
# @param string $2
# Conteúdo da linha sendo transformada.
#
# @param string $3
# Argumento opcional para complementar a transformação.
#
# @return
# Traz a string original transformada conforme indicado na descrição.
# ---







#
# Registra as variáveis relativas às cores disponíveis para uso
# Outras cores podem ser definidas. Use sempre o prefixo 'mse'
# para evitar conflitos com outras libs.
if [ -f "${MSE_TMP_THIS_DIRECTORY}/config/colors.sh" ]; then
  . "${MSE_TMP_THIS_DIRECTORY}/config/colors.sh"
fi
