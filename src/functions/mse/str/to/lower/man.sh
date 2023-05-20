#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


unset MSE_FUNCTION_MAN
declare -gA MSE_FUNCTION_MAN
MSE_FUNCTION_MAN["description"]="Converts the passed string to its lowercase version."


MSE_FUNCTION_MAN["param.1.type"]="string"
MSE_FUNCTION_MAN["param.1.name"]="String"
MSE_FUNCTION_MAN["param.1.required"]="1"
MSE_FUNCTION_MAN["param.1.default"]="${MSE_UNDEF}"
MSE_FUNCTION_MAN["param.1.min"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.1.max"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.1.options"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.1.description"]="String that will be converted."


MSE_FUNCTION_MAN["return.type"]="string"
MSE_FUNCTION_MAN["return.description"]="String changed."


MSE_FUNCTION_MAN["example.0"]=""
MSE_FUNCTION_MAN["example.0"]+="mse_str_to_lower \"TEXT\"\n"
MSE_FUNCTION_MAN["example.0"]+="\"text\""