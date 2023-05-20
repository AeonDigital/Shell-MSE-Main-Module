#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


MSE_FUNCTION_MAN["description"]="Preenche uma string com o caractere indicado.\n"
MSE_FUNCTION_MAN["description"]+="Adiciona na string original um total de caracteres \$2 à esquerda\n"
MSE_FUNCTION_MAN["description"]+="ou direita (conforme \$4) até que ela tenha o total de caracteres indicado em \$3."


MSE_FUNCTION_MAN["param.1.description"]="String que será preenchida."

MSE_FUNCTION_MAN["param.2.description"]="que será usada para fazer o preenchimento."

MSE_FUNCTION_MAN["param.3.description"]="Total de caracteres que a string final deve ter."

MSE_FUNCTION_MAN["param.4.options"]=""
MSE_FUNCTION_MAN["param.4.options"]+="l: e, esq, esquerda\n"
MSE_FUNCTION_MAN["param.4.options"]+="r: d, dir, direita"
MSE_FUNCTION_MAN["param.4.description"]=""
MSE_FUNCTION_MAN["param.4.description"]+="Posição em que o preenchimento deve ser feito.\n"
MSE_FUNCTION_MAN["param.4.description"]+="Use \"l\" para preencher à esquerda ou \"r\" para preencher à direita."


MSE_FUNCTION_MAN["return.description"]="Retorna a string alterada."