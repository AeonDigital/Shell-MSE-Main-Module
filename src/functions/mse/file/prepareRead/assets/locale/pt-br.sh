#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


MSE_FUNCTION_MAN["description"]=""
MSE_FUNCTION_MAN["description"]+="Prepara um array associativo preenchendo as chaves necessárias para a\n"
MSE_FUNCTION_MAN["description"]+="execução de um comando \"mse_file_read\".\n"
MSE_FUNCTION_MAN["description"]+="\n"
MSE_FUNCTION_MAN["description"]+="A leitura de um arquivo permite filtrar e transformar as partes desejadas\n"
MSE_FUNCTION_MAN["description"]+="conforme as configurações definidas.\n"
MSE_FUNCTION_MAN["description"]+="\n"
MSE_FUNCTION_MAN["description"]+="São quatro conjuntos de configuração que podem ser utilizado, abaixo segue a\n"
MSE_FUNCTION_MAN["description"]+="descrição de cada um e quais configurações fazem parte do mesmo.\n"
MSE_FUNCTION_MAN["description"]+="A descrição de cada configuração pode ser vista nas informações sobre os\n"
MSE_FUNCTION_MAN["description"]+="parametros usados para esta função.\n"
MSE_FUNCTION_MAN["description"]+="\n"
MSE_FUNCTION_MAN["description"]+="- Parte 01: Controle em nível de bloco de texto\n"
MSE_FUNCTION_MAN["description"]+="  Permite identificar quais trechos do documento devem ser retornados ou a\n"
MSE_FUNCTION_MAN["description"]+="  partir de onde que ele deve passar a ser ignorado.\n"
MSE_FUNCTION_MAN["description"]+="  Chaves definidas nesta parte:\n"
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
MSE_FUNCTION_MAN["description"]+="- Parte 02: Controle em nível de linha\n"
MSE_FUNCTION_MAN["description"]+="  Permite passar regras que farão a validação linha a linha para identificar aquelas\n"
MSE_FUNCTION_MAN["description"]+="  que devem ser retornadas.\n"
MSE_FUNCTION_MAN["description"]+="  Chaves definidas nesta parte:\n"
MSE_FUNCTION_MAN["description"]+="  - line_check\n"
MSE_FUNCTION_MAN["description"]+="  - line_check_args\n"
MSE_FUNCTION_MAN["description"]+="  - line_check_args_sep\n"
MSE_FUNCTION_MAN["description"]+="  - line_check_invert\n"
MSE_FUNCTION_MAN["description"]+="  - line_check_has_linenumber\n"
MSE_FUNCTION_MAN["description"]+="\n"
MSE_FUNCTION_MAN["description"]+="- Parte 03: Controles de transformação\n"
MSE_FUNCTION_MAN["description"]+="  Configura transformações a serem aplicadas nas linhas que serão retornadas.\n"
MSE_FUNCTION_MAN["description"]+="  Chaves definidas nesta parte:\n"
MSE_FUNCTION_MAN["description"]+="  - line_transform\n"
MSE_FUNCTION_MAN["description"]+="  - line_transform_args\n"
MSE_FUNCTION_MAN["description"]+="  - line_transform_args_sep\n"
MSE_FUNCTION_MAN["description"]+="  - line_transform_has_linenumber\n"
MSE_FUNCTION_MAN["description"]+="\n"
MSE_FUNCTION_MAN["description"]+="- Parte 04: Outras configurações\n"
MSE_FUNCTION_MAN["description"]+="  Uso geral para configurações que não se enquadram necessariamente em alguma\n"
MSE_FUNCTION_MAN["description"]+="  das citadas acima.\n"
MSE_FUNCTION_MAN["description"]+="  Chaves definidas nesta parte:\n"
MSE_FUNCTION_MAN["description"]+="  - line_hide_empty\n"
MSE_FUNCTION_MAN["description"]+="  - line_show_number\n"



MSE_FUNCTION_MAN["param.1.description"]="Nome do array associativo que será preenchido."



MSE_FUNCTION_MAN["param.2.description"]=""
MSE_FUNCTION_MAN["param.2.description"]+="[\"block_start_check\"]\n"
MSE_FUNCTION_MAN["param.2.description"]+="Indica o nome de uma função validadora que pode identificar o início de uma\n"
MSE_FUNCTION_MAN["param.2.description"]+="parte \"válida\" de um arquivo que se deseja retornar.\n"
MSE_FUNCTION_MAN["param.2.description"]+="\n"
MSE_FUNCTION_MAN["param.2.description"]+="Manter este valor vazio fará com que todo o conteúdo do arquivo seja\n"
MSE_FUNCTION_MAN["param.2.description"]+="considerado como \"retornável\".\n"
MSE_FUNCTION_MAN["param.2.description"]+="Já, ao contrário, ao indicar uma função validadora fará com que todas as\n"
MSE_FUNCTION_MAN["param.2.description"]+="linhas sejam consideradas \"não retornáveis\" até chegar em alguma cujo teste retorne positivo.\n"
MSE_FUNCTION_MAN["param.2.description"]+="\n"
MSE_FUNCTION_MAN["param.2.description"]+="Veja na seção \"FUNÇÕES VALIDADORAS\" abaixo a interface das funções que podem\n"
MSE_FUNCTION_MAN["param.2.description"]+="ser definidas aqui."

MSE_FUNCTION_MAN["param.3.description"]=""
MSE_FUNCTION_MAN["param.3.description"]+="[\"block_start_check_args\"]\n"
MSE_FUNCTION_MAN["param.3.description"]+="Permite passar alguma informação que será usada na função validadora como um\n"
MSE_FUNCTION_MAN["param.3.description"]+="argumento extra."

MSE_FUNCTION_MAN["param.4.description"]=""
MSE_FUNCTION_MAN["param.4.description"]+="[\"block_start_check_args_sep\"]\n"
MSE_FUNCTION_MAN["param.4.description"]+="Indica o caracter que deve ser usado para \"splitar\" a coleção de argumentos\n"
MSE_FUNCTION_MAN["param.4.description"]+="passados em \"block_start_check_args\"."

MSE_FUNCTION_MAN["param.5.description"]=""
MSE_FUNCTION_MAN["param.5.description"]+="[\"block_start_get_first_line\"]\n"
MSE_FUNCTION_MAN["param.5.description"]+="Indique \"\" ou "0" para que a linha inicial de um bloco válido seja omitida.\n"
MSE_FUNCTION_MAN["param.5.description"]+="Indique \"1\" para que esta primeira linha identificada seja também retornada.\n"

MSE_FUNCTION_MAN["param.6.description"]=""
MSE_FUNCTION_MAN["param.6.description"]+="[\"block_end_check\"]\n"
MSE_FUNCTION_MAN["param.6.description"]+="Indica o nome de uma função validadora que marcará o final de uma parte\n"
MSE_FUNCTION_MAN["param.6.description"]+="\"válida\" de um arquivo que se deseja retornar."
MSE_FUNCTION_MAN["param.6.description"]+="\n"
MSE_FUNCTION_MAN["param.6.description"]+="Veja na seção \"FUNÇÕES VALIDADORAS\" a interface das funções que podem\n"
MSE_FUNCTION_MAN["param.6.description"]+="ser definidas aqui."



MSE_FUNCTION_MAN["param.7.description"]=""
MSE_FUNCTION_MAN["param.7.description"]+="[\"block_end_check_args\"]\n"
MSE_FUNCTION_MAN["param.7.description"]+="Permite passar alguma informação que será usada na função validadora como um\n"
MSE_FUNCTION_MAN["param.7.description"]+="argumento extra."

MSE_FUNCTION_MAN["param.8.description"]=""
MSE_FUNCTION_MAN["param.8.description"]+="[\"block_end_check_args_sep\"]\n"
MSE_FUNCTION_MAN["param.8.description"]+="Indica o caracter que deve ser usado para \"splitar\" a coleção de argumentos\n"
MSE_FUNCTION_MAN["param.8.description"]+="passados em \"block_end_check_args\"."

MSE_FUNCTION_MAN["param.9.description"]=""
MSE_FUNCTION_MAN["param.9.description"]+="[\"block_end_get_last_line\"]\n"
MSE_FUNCTION_MAN["param.9.description"]+="Indique \"\" ou \"0\" para que a linha final de um bloco válido seja omitida.\n"
MSE_FUNCTION_MAN["param.9.description"]+="Indique \"1\" para que esta última linha identificada seja também retornada."

MSE_FUNCTION_MAN["param.10.description"]=""
MSE_FUNCTION_MAN["param.10.description"]+="[\"block_check_invert\"]\n"
MSE_FUNCTION_MAN["param.10.description"]+="Indique \"1\" para inverter a saida da função definida em \"block_start_check\"\n"
MSE_FUNCTION_MAN["param.10.description"]+="e \"block_end_check\"."



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

MSE_FUNCTION_MAN["param.12.description"]=""
MSE_FUNCTION_MAN["param.12.description"]+="[\"line_check_args\"]\n"
MSE_FUNCTION_MAN["param.12.description"]+="Permite passar alguma informação que será usada na função validadora como um\n"
MSE_FUNCTION_MAN["param.12.description"]+="argumento extra."

MSE_FUNCTION_MAN["param.13.description"]=""
MSE_FUNCTION_MAN["param.13.description"]+="[\"line_check_args_sep\"]\n"
MSE_FUNCTION_MAN["param.13.description"]+="Indica o caracter que deve ser usado para \"splitar\" a coleção de argumentos\n"
MSE_FUNCTION_MAN["param.13.description"]+="passados em \"line_check_args\"."

MSE_FUNCTION_MAN["param.14.description"]=""
MSE_FUNCTION_MAN["param.14.description"]+="[\"line_check_invert\"]\n"
MSE_FUNCTION_MAN["param.14.description"]+="Indique \"1\" para inverter a saida da função definida em \"line_check\"."

MSE_FUNCTION_MAN["param.15.description"]=""
MSE_FUNCTION_MAN["param.15.description"]+="[\"line_check_has_linenumber\"]\n"
MSE_FUNCTION_MAN["param.15.description"]+="Use \"1\" para indicar que as linhas sendo processadas estão vindo com seus\n"
MSE_FUNCTION_MAN["param.15.description"]+="respectivos números em seu início."



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

MSE_FUNCTION_MAN["param.17.description"]=""
MSE_FUNCTION_MAN["param.17.description"]+="[\"line_transform_args\"]\n"
MSE_FUNCTION_MAN["param.17.description"]+="Permite passar alguma informação que será usada na função transformadora\n"
MSE_FUNCTION_MAN["param.17.description"]+="como um argumento extra."

MSE_FUNCTION_MAN["param.18.description"]=""
MSE_FUNCTION_MAN["param.18.description"]+="[\"line_transform_args_sep\"]\n"
MSE_FUNCTION_MAN["param.18.description"]+="Indica o caracter que deve ser usado para \"splitar\" a coleção de argumentos\n"
MSE_FUNCTION_MAN["param.18.description"]+="passados em \"line_transform_args\"."

MSE_FUNCTION_MAN["param.19.description"]=""
MSE_FUNCTION_MAN["param.19.description"]+="[\"line_transform_has_linenumber\"]\n"
MSE_FUNCTION_MAN["param.19.description"]+="Use \"1\" para indicar que as linhas sendo processadas estão vindo com seus\n"
MSE_FUNCTION_MAN["param.19.description"]+="respectivos números em seu início."



MSE_FUNCTION_MAN["param.20.description"]=""
MSE_FUNCTION_MAN["param.20.description"]+="[\"line_hide_empty\"]\n"
MSE_FUNCTION_MAN["param.20.description"]+="Se \"\" ou \"0\" irá mostrar todas as linhas incluindo as vazias.\n"
MSE_FUNCTION_MAN["param.20.description"]+="Se \"1\" irá remover as linhas vazias."

MSE_FUNCTION_MAN["param.21.description"]=""
MSE_FUNCTION_MAN["param.21.description"]+="[\"line_show_number\"]\n"
MSE_FUNCTION_MAN["param.21.description"]+="Se \"\" ou \"0\" irá trazer o valor bruto da linha, tal qual ela consta no\n"
MSE_FUNCTION_MAN["param.21.description"]+="Se \"1\" irá apresentar o número de cada linha em seu início.\n"
MSE_FUNCTION_MAN["param.21.description"]+="O número da linha será retornado como primeira informação e estará\n"
MSE_FUNCTION_MAN["param.21.description"]+="separada do início do texto por um caracter \"#\".\n"






MSE_FUNCTION_MAN["return.description"]=""
MSE_FUNCTION_MAN["return.description"]+="Preenche o array associativo de nome passado com as chaves necessárias\n"
MSE_FUNCTION_MAN["return.description"]+="para a execução da função \"mse_file_read\"."
