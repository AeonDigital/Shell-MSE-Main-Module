#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Armazena a última mensagem de erro ocorrida na execução de uma função.
declare -g MSE_GLOBAL_LASTERR=""

#
# Armazena a última mensagem de retorno resultante da execução de uma função.
declare -g MSE_GLOBAL_RETURN=""



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



#
# FILE READ

#
# O array associativo 'MSE_GLOBAL_MODULE_READ_BLOCK' permite configurar
# a função 'mse_file_read' indicando para ela como encontrar um ou
# mais bloco de informações que devem ser retornadas.
#
# Tenha em mente que a função 'mse_file_read', por padrão irá printar
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
# "start_args_sep"
# Indica o caracter que deve ser usado para 'splitar' a coleção de argumentos
# passados em 'start_args'.
MSE_GLOBAL_MODULE_READ_BLOCK["start_args_sep"]=""
#
# Armazena os argumentos passados em 'start_args' usando o separador indicado
# em 'start_args_sep'.
unset MSE_GLOBAL_MODULE_READ_BLOCK_START_ARGS_ARRAY
declare -ga MSE_GLOBAL_MODULE_READ_BLOCK_START_ARGS_ARRAY
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
# "end_args_sep"
# Indica o caracter que deve ser usado para 'splitar' a coleção de argumentos
# passados em 'end_args'.
MSE_GLOBAL_MODULE_READ_BLOCK["end_args_sep"]=""
#
# Armazena os argumentos passados em 'end_args' usando o separador indicado
# em 'end_args_sep'.
unset MSE_GLOBAL_MODULE_READ_BLOCK_END_ARGS_ARRAY
declare -ga MSE_GLOBAL_MODULE_READ_BLOCK_END_ARGS_ARRAY
#
# "print_start_line"
# Indique "" ou "0" para que a linha inicial de um bloco válido seja omitida.
# Indique "1" para que esta primeira linha identificada seja também retornada.
MSE_GLOBAL_MODULE_READ_BLOCK["print_start_line"]=""



#
# O array associativo 'MSE_GLOBAL_MODULE_READ_LINE' permite configurar
# a função 'mse_file_read' indicando para ela como saber se a linha
# atualmente sendo verificada deve ou não ser retornada.
#
# Tenha em mente que a função 'mse_file_read', por padrão irá printar
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
# "check_args_sep"
# Indica o caracter que deve ser usado para 'splitar' a coleção de argumentos
# passados em 'check_args'.
MSE_GLOBAL_MODULE_READ_LINE["check_args_sep"]=""
#
# Armazena os argumentos passados em 'check_args' usando o separador indicado
# em 'check_args_sep'.
unset MSE_GLOBAL_MODULE_READ_LINE_ARGS_ARRAY
declare -ga MSE_GLOBAL_MODULE_READ_LINE_ARGS_ARRAY
#
# "check_has_linenumber"
# Indique "1" para indicar que as linhas sendo processadas possuem seu respectivo
# número.
MSE_GLOBAL_MODULE_READ_LINE["check_has_linenumber"]=""
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
# "transform_args_sep"
# Indica o caracter que deve ser usado para 'splitar' a coleção de argumentos
# passados em 'transform_args'.
MSE_GLOBAL_MODULE_READ_LINE["transform_args_sep"]=""
#
# Armazena os argumentos passados em 'transform_args' usando o separador indicado
# em 'transform_args_sep'.
unset MSE_GLOBAL_MODULE_READ_TRANSFORM_ARGS_ARRAY
declare -ga MSE_GLOBAL_MODULE_READ_TRANSFORM_ARGS_ARRAY
#
# "transform_has_linenumber"
# Indique "1" para indicar que as linhas sendo processadas possuem seu respectivo
# número.
MSE_GLOBAL_MODULE_READ_LINE["transform_has_linenumber"]=""



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
# @param bool $3
# Indique "0" para informar que as linhas sendo processadas estão em formato
# 'raw' (tal qual no arquivo original).
# Indique "1" para informar que há, no conteúdo de cada linha, há a informação
# de seu respectivo número dentro do arquivo alvo.
#
# @param string $4
# Argumento opcional para complementar a verificação.
# Conforme a implementação pode ser obrigatorio.
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
# @param bool $3
# Indique "0" para informar que as linhas sendo processadas estão em formato
# 'raw' (tal qual no arquivo original).
# Indique "1" para informar que há, no conteúdo de cada linha, há a informação
# de seu respectivo número dentro do arquivo alvo.
#
# @param string $4
# Argumento opcional para complementar a verificação.
# Conforme a implementação pode ser obrigatorio.
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
