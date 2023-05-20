#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


MSE_FUNCTION_MAN["description"]=""
MSE_FUNCTION_MAN["description"]+="Efetua um split na string passada em um array onde cada linha terá no máximo o número de caracteres informados.\n"
MSE_FUNCTION_MAN["description"]+="As palavras identificadas serão mantidas sem serem separadas entre as linhas."


MSE_FUNCTION_MAN["param.1.description"]="String original."

MSE_FUNCTION_MAN["param.2.description"]=""
MSE_FUNCTION_MAN["param.2.description"]+="Número máximo de caracteres por linha.\n"
MSE_FUNCTION_MAN["param.2.description"]+="Se não for definido, ou, se inválido, usará o valor atual da variável \"\$COLUMNS\".\n"


MSE_FUNCTION_MAN["return.description"]="O resultado será definido na variável \"MSE_LAST_FUNCTION_RETURN\"."