#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


unset MSE_FUNCTION_MAN
declare -gA MSE_FUNCTION_MAN
MSE_FUNCTION_MAN["description"]=""
MSE_FUNCTION_MAN["description"]+="Prepares an associative array by filling in the keys required\n"
MSE_FUNCTION_MAN["description"]+="to execute a "mse_file_read" command.\n"
MSE_FUNCTION_MAN["description"]+="\n"
MSE_FUNCTION_MAN["description"]+="Reading a file allows you to filter and transform the desired parts\n"
MSE_FUNCTION_MAN["description"]+="according to the settings you set.\n"
MSE_FUNCTION_MAN["description"]+="\n"
MSE_FUNCTION_MAN["description"]+="There are four configuration sets that can be used, below is the\n"
MSE_FUNCTION_MAN["description"]+="description of each one and which configurations are part of it.\n"
MSE_FUNCTION_MAN["description"]+="The description of each configuration can be seen in the information about the\n"
MSE_FUNCTION_MAN["description"]+="parameters used for this function.\n"
MSE_FUNCTION_MAN["description"]+="\n"
MSE_FUNCTION_MAN["description"]+="- Part 01: Text block-level control\n"
MSE_FUNCTION_MAN["description"]+="  Allows you to identify which parts of the document should be returned or\n"
MSE_FUNCTION_MAN["description"]+="  from where it should be ignored.\n"
MSE_FUNCTION_MAN["description"]+="  Keys defined in this part:\n"
MSE_FUNCTION_MAN["description"]+="  - block_start_check\n"
MSE_FUNCTION_MAN["description"]+="  - block_start_check_args\n"
MSE_FUNCTION_MAN["description"]+="  - block_start_check_args_sep\n"
MSE_FUNCTION_MAN["description"]+="  - block_start_get_first_line\n"
MSE_FUNCTION_MAN["description"]+="  - block_end_check\n"
MSE_FUNCTION_MAN["description"]+="  - block_end_check_args\n"
MSE_FUNCTION_MAN["description"]+="  - block_end_check_args_sep\n"
MSE_FUNCTION_MAN["description"]+="  - block_end_get_last_line\n"
MSE_FUNCTION_MAN["description"]+="  - block_check_invert\n"
MSE_FUNCTION_MAN["description"]+="\n"
MSE_FUNCTION_MAN["description"]+="- Part 02: Row-Level Control\n"
MSE_FUNCTION_MAN["description"]+="  Allows you to pass rules that will do line-by-line validation to identify those\n"
MSE_FUNCTION_MAN["description"]+="  that should be returned.\n"
MSE_FUNCTION_MAN["description"]+="  Keys defined in this part:\n"
MSE_FUNCTION_MAN["description"]+="  - line_check\n"
MSE_FUNCTION_MAN["description"]+="  - line_check_args\n"
MSE_FUNCTION_MAN["description"]+="  - line_check_args_sep\n"
MSE_FUNCTION_MAN["description"]+="  - line_check_invert\n"
MSE_FUNCTION_MAN["description"]+="  - line_check_has_linenumber\n"
MSE_FUNCTION_MAN["description"]+="\n"
MSE_FUNCTION_MAN["description"]+="- Part 03: Transformation Controls\n"
MSE_FUNCTION_MAN["description"]+="  Configures transformations to be applied to the rows that will be returned.\n"
MSE_FUNCTION_MAN["description"]+="  Keys defined in this part:\n"
MSE_FUNCTION_MAN["description"]+="  - line_transform\n"
MSE_FUNCTION_MAN["description"]+="  - line_transform_args\n"
MSE_FUNCTION_MAN["description"]+="  - line_transform_args_sep\n"
MSE_FUNCTION_MAN["description"]+="  - line_transform_has_linenumber\n"
MSE_FUNCTION_MAN["description"]+="\n"
MSE_FUNCTION_MAN["description"]+="- Part 04: Other settings\n"
MSE_FUNCTION_MAN["description"]+="  General use for settings that do not necessarily fall under any\n"
MSE_FUNCTION_MAN["description"]+="  of the above.\n"
MSE_FUNCTION_MAN["description"]+="  Keys defined in this part:\n"
MSE_FUNCTION_MAN["description"]+="  - line_hide_empty\n"
MSE_FUNCTION_MAN["description"]+="  - line_show_number\n"



# ---
#
# [[ FUNÇÕES VALIDADORAS ]]
# Usadas tanto para identificar o início e o fim de uma seção quanto para
# verificar se uma linha contém o tipo de informação que se está procurando
# tais funções devem seguir a seguinte interface:
#
# Descrição da verificação sendo realizada.
#
# @param string $1
# Nome do array associativo que traz as configurações para leitura sendo
# usadas no momento.
#
# @param int $2
# Número da linha sendo verificada.
#
# @param string $3
# Conteúdo da linha sendo verificada.
#
# @param bool $4
# Use "0" para informar que as linhas sendo processadas estão em formato "raw"
# (tal qual no arquivo original).
# Use "1" para informar que há, no conteúdo de cada linha, a informação de seu
# respectivo número dentro do arquivo alvo.
#
# @param string $5
# Argumento opcional para complementar a verificação.
# Conforme a implementação pode ser obrigatorio.
#
# @return
# Printa '1' se o teste for positivo.
# Printa '0' se o teste for negativo.
#
#
#
# ---
#
# [[ FUNÇÕES TRANSFORMADORAS ]]
# Usadas para transformar as informações das linhas identificadas como válidas
# tais funções devem seguir a seguinte interface:
#
# Descrição da transformação sendo realizada.
#
# @param string $1
# Nome do array associativo que traz as configurações para leitura sendo
# usadas no momento.
#
# @param int $2
# Número da linha sendo transformada.
#
# @param string $3
# Conteúdo da linha sendo transformada.
#
# @param bool $4
# Indique "0" para informar que as linhas sendo processadas estão em formato
# 'raw' (tal qual no arquivo original).
# Indique "1" para informar que há, no conteúdo de cada linha, há a informação
# de seu respectivo número dentro do arquivo alvo.
#
# @param string $5
# Argumento opcional para complementar a verificação.
# Conforme a implementação pode ser obrigatorio.
#
# @return
# Traz a string original transformada conforme indicado na descrição.
# ---
#




MSE_FUNCTION_MAN["param.1.type"]="assoc"
MSE_FUNCTION_MAN["param.1.name"]="AssocArrayName"
MSE_FUNCTION_MAN["param.1.required"]="1"
MSE_FUNCTION_MAN["param.1.default"]="${MSE_UNDEF}"
MSE_FUNCTION_MAN["param.1.min"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.1.max"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.1.options"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.1.description"]="Name of the associative array that will be populated."

MSE_FUNCTION_MAN["param.2.type"]="function"
MSE_FUNCTION_MAN["param.2.name"]="BlockStartCheck"
MSE_FUNCTION_MAN["param.2.required"]="0"
MSE_FUNCTION_MAN["param.2.default"]="${MSE_UNDEF}"
MSE_FUNCTION_MAN["param.2.min"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.2.max"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.2.options"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.2.description"]=""
MSE_FUNCTION_MAN["param.2.description"]+="[\"block_start_check\"]\n"
MSE_FUNCTION_MAN["param.2.description"]+="Indicates the name of a validator function that can identify the beginning\n"
MSE_FUNCTION_MAN["param.2.description"]+="of a \"valid\" part of a file that you want to return.\n"
MSE_FUNCTION_MAN["param.2.description"]+="\n"
MSE_FUNCTION_MAN["param.2.description"]+="Keeping this value empty will cause the entire contents of the file to be\n"
MSE_FUNCTION_MAN["param.2.description"]+="considered \"returnable\".\n"
MSE_FUNCTION_MAN["param.2.description"]+="On the contrary, by indicating a validator function will cause all lines to\n"
MSE_FUNCTION_MAN["param.2.description"]+="be considered \"non-returnable\" until reaching one whose test returns positive.\n"
MSE_FUNCTION_MAN["param.2.description"]+="\n"
MSE_FUNCTION_MAN["param.2.description"]+="See the \"VALIDATING FUNCTIONS\" section for the interface of the functions\n"
MSE_FUNCTION_MAN["param.2.description"]+="that can be defined here."

MSE_FUNCTION_MAN["param.3.type"]="string"
MSE_FUNCTION_MAN["param.3.name"]="BlockStartCheckArgs"
MSE_FUNCTION_MAN["param.3.required"]="0"
MSE_FUNCTION_MAN["param.3.default"]="${MSE_UNDEF}"
MSE_FUNCTION_MAN["param.3.min"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.3.max"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.3.options"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.3.description"]=""
MSE_FUNCTION_MAN["param.3.description"]+="[\"block_start_check_args\"]\n"
MSE_FUNCTION_MAN["param.3.description"]+="Allows you to pass some information that will be used in the validator function\n"
MSE_FUNCTION_MAN["param.3.description"]+="as an extra argument."

MSE_FUNCTION_MAN["param.4.type"]="string"
MSE_FUNCTION_MAN["param.4.name"]="BlockStartCheckArgsSep"
MSE_FUNCTION_MAN["param.4.required"]="0"
MSE_FUNCTION_MAN["param.4.default"]="${MSE_UNDEF}"
MSE_FUNCTION_MAN["param.4.min"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.4.max"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.4.options"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.4.description"]=""
MSE_FUNCTION_MAN["param.4.description"]+="[\"block_start_check_args_sep\"]\n"
MSE_FUNCTION_MAN["param.4.description"]+="Indica o caracter que deve ser usado para \"splitar\" a coleção de argumentos\n"
MSE_FUNCTION_MAN["param.4.description"]+="passados em \"block_start_check_args\"."

MSE_FUNCTION_MAN["param.5.type"]="bool"
MSE_FUNCTION_MAN["param.5.name"]="BlockStartGetFirstLine"
MSE_FUNCTION_MAN["param.5.required"]="0"
MSE_FUNCTION_MAN["param.5.default"]="0"
MSE_FUNCTION_MAN["param.5.min"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.5.max"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.5.options"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.5.description"]=""
MSE_FUNCTION_MAN["param.5.description"]+="[\"block_start_get_first_line\"]\n"
MSE_FUNCTION_MAN["param.5.description"]+="Indique \"\" ou "0" para que a linha inicial de um bloco válido seja omitida.\n"
MSE_FUNCTION_MAN["param.5.description"]+="Indique \"1\" para que esta primeira linha identificada seja também retornada.\n"

MSE_FUNCTION_MAN["param.6.type"]="function"
MSE_FUNCTION_MAN["param.6.name"]="BlockEndCheck"
MSE_FUNCTION_MAN["param.6.required"]="0"
MSE_FUNCTION_MAN["param.6.default"]="${MSE_UNDEF}"
MSE_FUNCTION_MAN["param.6.min"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.6.max"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.6.options"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.6.description"]=""
MSE_FUNCTION_MAN["param.6.description"]+="[\"block_end_check\"]\n"
MSE_FUNCTION_MAN["param.6.description"]+="Indica o nome de uma função validadora que marcará o final de uma parte\n"
MSE_FUNCTION_MAN["param.6.description"]+="\"válida\" de um arquivo que se deseja retornar."
MSE_FUNCTION_MAN["param.6.description"]+="\n"
MSE_FUNCTION_MAN["param.6.description"]+="Veja na seção \"FUNÇÕES VALIDADORAS\" a interface das funções que podem\n"
MSE_FUNCTION_MAN["param.6.description"]+="ser definidas aqui."



MSE_FUNCTION_MAN["param.7.type"]="string"
MSE_FUNCTION_MAN["param.7.name"]="BlockEndCheckArgs"
MSE_FUNCTION_MAN["param.7.required"]="0"
MSE_FUNCTION_MAN["param.7.default"]="${MSE_UNDEF}"
MSE_FUNCTION_MAN["param.7.min"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.7.max"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.7.options"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.7.description"]=""
MSE_FUNCTION_MAN["param.7.description"]+="[\"block_end_check_args\"]\n"
MSE_FUNCTION_MAN["param.7.description"]+="Permite passar alguma informação que será usada na função validadora como um\n"
MSE_FUNCTION_MAN["param.7.description"]+="argumento extra."

MSE_FUNCTION_MAN["param.8.type"]="string"
MSE_FUNCTION_MAN["param.8.name"]="BlockEndCheckArgsSep"
MSE_FUNCTION_MAN["param.8.required"]="0"
MSE_FUNCTION_MAN["param.8.default"]="${MSE_UNDEF}"
MSE_FUNCTION_MAN["param.8.min"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.8.max"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.8.options"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.8.description"]=""
MSE_FUNCTION_MAN["param.8.description"]+="[\"block_end_check_args_sep\"]\n"
MSE_FUNCTION_MAN["param.8.description"]+="Indica o caracter que deve ser usado para \"splitar\" a coleção de argumentos\n"
MSE_FUNCTION_MAN["param.8.description"]+="passados em \"block_end_check_args\"."

MSE_FUNCTION_MAN["param.9.type"]="bool"
MSE_FUNCTION_MAN["param.9.name"]="BlockEndGetLastLine"
MSE_FUNCTION_MAN["param.9.required"]="0"
MSE_FUNCTION_MAN["param.9.default"]="0"
MSE_FUNCTION_MAN["param.9.min"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.9.max"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.9.options"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.9.description"]=""
MSE_FUNCTION_MAN["param.9.description"]+="[\"block_end_get_last_line\"]\n"
MSE_FUNCTION_MAN["param.9.description"]+="Indique \"\" ou \"0\" para que a linha final de um bloco válido seja omitida.\n"
MSE_FUNCTION_MAN["param.9.description"]+="Indique \"1\" para que esta última linha identificada seja também retornada."

MSE_FUNCTION_MAN["param.10.type"]="bool"
MSE_FUNCTION_MAN["param.10.name"]="BlockCheckInvert"
MSE_FUNCTION_MAN["param.10.required"]="0"
MSE_FUNCTION_MAN["param.10.default"]="0"
MSE_FUNCTION_MAN["param.10.min"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.10.max"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.10.options"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.10.description"]=""
MSE_FUNCTION_MAN["param.10.description"]+="[\"block_check_invert\"]\n"
MSE_FUNCTION_MAN["param.10.description"]+="Indique \"1\" para inverter a saida da função definida em \"block_start_check\"\n"
MSE_FUNCTION_MAN["param.10.description"]+="e \"block_end_check\"."



MSE_FUNCTION_MAN["param.11.type"]="function"
MSE_FUNCTION_MAN["param.11.name"]="LineCheck"
MSE_FUNCTION_MAN["param.11.required"]="0"
MSE_FUNCTION_MAN["param.11.default"]="${MSE_UNDEF}"
MSE_FUNCTION_MAN["param.11.min"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.11.max"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.11.options"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.11.description"]=""
MSE_FUNCTION_MAN["param.11.description"]+="[\"line_check\"]\n"
MSE_FUNCTION_MAN["param.11.description"]+="Indica o nome de uma função validadora que permite identificar se a linha\n"
MSE_FUNCTION_MAN["param.11.description"]+="atualmente sendo processada deve ser retornada."
MSE_FUNCTION_MAN["param.11.description"]+="\n"
MSE_FUNCTION_MAN["param.11.description"]+="Manter este valor vazio fará com que todos linhas dentro de um bloco válido\n"
MSE_FUNCTION_MAN["param.11.description"]+="seja \"retornavél\".\n"
MSE_FUNCTION_MAN["param.11.description"]+="Já, ao contrário, ao indicar uma função validadora fará com que todas as\n"
MSE_FUNCTION_MAN["param.11.description"]+="linhas sejam consideradas \"não retornáveis\" exceto aquelas que passarem no\n"
MSE_FUNCTION_MAN["param.11.description"]+="teste proposto."
MSE_FUNCTION_MAN["param.11.description"]+="\n"
MSE_FUNCTION_MAN["param.11.description"]+="Veja na seção \"FUNÇÕES VALIDADORAS\" a interface das funções que podem\n"
MSE_FUNCTION_MAN["param.11.description"]+="ser definidas aqui."

MSE_FUNCTION_MAN["param.12.type"]="string"
MSE_FUNCTION_MAN["param.12.name"]="LineCheckArgs"
MSE_FUNCTION_MAN["param.12.required"]="0"
MSE_FUNCTION_MAN["param.12.default"]="${MSE_UNDEF}"
MSE_FUNCTION_MAN["param.12.min"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.12.max"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.12.options"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.12.description"]=""
MSE_FUNCTION_MAN["param.12.description"]+="[\"line_check_args\"]\n"
MSE_FUNCTION_MAN["param.12.description"]+="Permite passar alguma informação que será usada na função validadora como um\n"
MSE_FUNCTION_MAN["param.12.description"]+="argumento extra."

MSE_FUNCTION_MAN["param.13.type"]="string"
MSE_FUNCTION_MAN["param.13.name"]="LineCheckArgsSep"
MSE_FUNCTION_MAN["param.13.required"]="0"
MSE_FUNCTION_MAN["param.13.default"]="${MSE_UNDEF}"
MSE_FUNCTION_MAN["param.13.min"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.13.max"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.13.options"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.13.description"]=""
MSE_FUNCTION_MAN["param.13.description"]+="[\"line_check_args_sep\"]\n"
MSE_FUNCTION_MAN["param.13.description"]+="Indica o caracter que deve ser usado para \"splitar\" a coleção de argumentos\n"
MSE_FUNCTION_MAN["param.13.description"]+="passados em \"line_check_args\"."

MSE_FUNCTION_MAN["param.14.type"]="bool"
MSE_FUNCTION_MAN["param.14.name"]="LineCheckInvert"
MSE_FUNCTION_MAN["param.14.required"]="0"
MSE_FUNCTION_MAN["param.14.default"]="0"
MSE_FUNCTION_MAN["param.14.min"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.14.max"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.14.options"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.14.description"]=""
MSE_FUNCTION_MAN["param.14.description"]+="[\"line_check_invert\"]\n"
MSE_FUNCTION_MAN["param.14.description"]+="Indique \"1\" para inverter a saida da função definida em \"line_check\"."

MSE_FUNCTION_MAN["param.15.type"]="bool"
MSE_FUNCTION_MAN["param.15.name"]="LineCheckHasLineNumber"
MSE_FUNCTION_MAN["param.15.required"]="0"
MSE_FUNCTION_MAN["param.15.default"]="0"
MSE_FUNCTION_MAN["param.15.min"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.15.max"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.15.options"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.15.description"]=""
MSE_FUNCTION_MAN["param.15.description"]+="[\"line_check_has_linenumber\"]\n"
MSE_FUNCTION_MAN["param.15.description"]+="Use \"1\" para indicar que as linhas sendo processadas estão vindo com seus\n"
MSE_FUNCTION_MAN["param.15.description"]+="respectivos números em seu início."



MSE_FUNCTION_MAN["param.16.type"]="function"
MSE_FUNCTION_MAN["param.16.name"]="LineTransform"
MSE_FUNCTION_MAN["param.16.required"]="0"
MSE_FUNCTION_MAN["param.16.default"]="${MSE_UNDEF}"
MSE_FUNCTION_MAN["param.16.min"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.16.max"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.16.options"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.16.description"]=""
MSE_FUNCTION_MAN["param.16.description"]+="[\"line_transform\"]\n"
MSE_FUNCTION_MAN["param.16.description"]+="Indica o nome de uma função que irá receber como argumentos as mesmas\n"
MSE_FUNCTION_MAN["param.16.description"]+="informações que as funções validadoras mas, neste caso, irá promover uma\n"
MSE_FUNCTION_MAN["param.16.description"]+="transformação na linha, permitindo que ela seja vista de forma diferente\n"
MSE_FUNCTION_MAN["param.16.description"]+="daquela que está atualmente registrada no arquivo.\n"
MSE_FUNCTION_MAN["param.16.description"]+="Nenhuma alteração será feita no arquivo em si.\n"
MSE_FUNCTION_MAN["param.16.description"]+="\n"
MSE_FUNCTION_MAN["param.16.description"]+="Veja na seção \"FUNÇÕES VALIDADORAS\" a interface das funções que podem\n"
MSE_FUNCTION_MAN["param.16.description"]+="ser definidas aqui."

MSE_FUNCTION_MAN["param.17.type"]="string"
MSE_FUNCTION_MAN["param.17.name"]="LineTransformArgs"
MSE_FUNCTION_MAN["param.17.required"]="0"
MSE_FUNCTION_MAN["param.17.default"]="${MSE_UNDEF}"
MSE_FUNCTION_MAN["param.17.min"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.17.max"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.17.options"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.17.description"]=""
MSE_FUNCTION_MAN["param.17.description"]+="[\"line_transform_args\"]\n"
MSE_FUNCTION_MAN["param.17.description"]+="Permite passar alguma informação que será usada na função transformadora\n"
MSE_FUNCTION_MAN["param.17.description"]+="como um argumento extra."

MSE_FUNCTION_MAN["param.18.type"]="string"
MSE_FUNCTION_MAN["param.18.name"]="LineTransformArgsSep"
MSE_FUNCTION_MAN["param.18.required"]="0"
MSE_FUNCTION_MAN["param.18.default"]="${MSE_UNDEF}"
MSE_FUNCTION_MAN["param.18.min"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.18.max"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.18.options"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.18.description"]=""
MSE_FUNCTION_MAN["param.18.description"]+="[\"line_transform_args_sep\"]\n"
MSE_FUNCTION_MAN["param.18.description"]+="Indica o caracter que deve ser usado para \"splitar\" a coleção de argumentos\n"
MSE_FUNCTION_MAN["param.18.description"]+="passados em \"line_transform_args\"."

MSE_FUNCTION_MAN["param.19.type"]="bool"
MSE_FUNCTION_MAN["param.19.name"]="LineTransformLineNumber"
MSE_FUNCTION_MAN["param.19.required"]="0"
MSE_FUNCTION_MAN["param.19.default"]="0"
MSE_FUNCTION_MAN["param.19.min"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.19.max"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.19.options"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.19.description"]=""
MSE_FUNCTION_MAN["param.19.description"]+="[\"line_transform_has_linenumber\"]\n"
MSE_FUNCTION_MAN["param.19.description"]+="Use \"1\" para indicar que as linhas sendo processadas estão vindo com seus\n"
MSE_FUNCTION_MAN["param.19.description"]+="respectivos números em seu início."



MSE_FUNCTION_MAN["param.20.type"]="bool"
MSE_FUNCTION_MAN["param.20.name"]="LineHideEmpty"
MSE_FUNCTION_MAN["param.20.required"]="0"
MSE_FUNCTION_MAN["param.20.default"]="0"
MSE_FUNCTION_MAN["param.20.min"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.20.max"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.20.options"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.20.description"]=""
MSE_FUNCTION_MAN["param.20.description"]+="[\"line_hide_empty\"]\n"
MSE_FUNCTION_MAN["param.20.description"]+="Se \"\" ou \"0\" irá mostrar todas as linhas incluindo as vazias.\n"
MSE_FUNCTION_MAN["param.20.description"]+="Se \"1\" irá remover as linhas vazias."

MSE_FUNCTION_MAN["param.21.type"]="bool"
MSE_FUNCTION_MAN["param.21.name"]="LineShowNumber"
MSE_FUNCTION_MAN["param.21.required"]="0"
MSE_FUNCTION_MAN["param.21.default"]="0"
MSE_FUNCTION_MAN["param.21.min"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.21.max"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.21.options"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.21.description"]=""
MSE_FUNCTION_MAN["param.21.description"]+="[\"line_show_number\"]\n"
MSE_FUNCTION_MAN["param.21.description"]+="Se \"\" ou \"0\" irá trazer o valor bruto da linha, tal qual ela consta no\n"
MSE_FUNCTION_MAN["param.21.description"]+="Se \"1\" irá apresentar o número de cada linha em seu início.\n"
MSE_FUNCTION_MAN["param.21.description"]+="O número da linha será retornado como primeira informação e estará\n"
MSE_FUNCTION_MAN["param.21.description"]+="separada do início do texto por um caracter \"#\".\n"





MSE_FUNCTION_MAN["return.type"]="void"
MSE_FUNCTION_MAN["return.description"]=""