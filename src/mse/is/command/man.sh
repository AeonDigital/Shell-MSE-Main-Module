#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


unset MSE_FUNCTION_MAN
declare -gA MSE_FUNCTION_MAN
MSE_FUNCTION_MAN["description"]="From a command that executes a program, it identifies whether it is available for use."


MSE_FUNCTION_MAN["param.1.type"]="string"
MSE_FUNCTION_MAN["param.1.name"]="Value"
MSE_FUNCTION_MAN["param.1.required"]="1"
MSE_FUNCTION_MAN["param.1.default"]="${MSE_UNDEF}"
MSE_FUNCTION_MAN["param.1.min"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.1.max"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.1.options"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.1.description"]=""
MSE_FUNCTION_MAN["param.1.description"]+="Command that will be used to test program availability.\n"
MSE_FUNCTION_MAN["param.1.description"]+="It is recommended to use some low-impact command like the\n"
MSE_FUNCTION_MAN["param.1.description"]+="typical \"-v | --version\""


MSE_FUNCTION_MAN["return.type"]="bool"
MSE_FUNCTION_MAN["return.description"]=""
MSE_FUNCTION_MAN["return.description"]+="\"1\" if \"true\"\n"
MSE_FUNCTION_MAN["return.description"]+="\"0\" if \"false\""