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
