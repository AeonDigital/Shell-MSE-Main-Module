#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


unset MSE_FUNCTION_MAN
declare -gA MSE_FUNCTION_MAN
MSE_FUNCTION_MAN["description"]="Allows you to identify whether a passed value is a valid octal representation of a single character (UTF-8 safe)."


MSE_FUNCTION_MAN["param.1.type"]="string"
MSE_FUNCTION_MAN["param.1.name"]="Value"
MSE_FUNCTION_MAN["param.1.required"]="1"
MSE_FUNCTION_MAN["param.1.default"]="${MSE_UNDEF}"
MSE_FUNCTION_MAN["param.1.min"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.1.max"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.1.options"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.1.description"]="Value that will be tested."


MSE_FUNCTION_MAN["return.type"]="bool"
MSE_FUNCTION_MAN["return.description"]=""
MSE_FUNCTION_MAN["return.description"]+="'1' if 'true'\n"
MSE_FUNCTION_MAN["return.description"]+="'0' if 'false'"