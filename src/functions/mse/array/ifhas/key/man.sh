#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


unset MSE_FUNCTION_MAN
declare -gA MSE_FUNCTION_MAN
MSE_FUNCTION_MAN["description"]="Identifies whether the given key exists in the target associative array."


MSE_FUNCTION_MAN["param.1.type"]="string"
MSE_FUNCTION_MAN["param.1.name"]="KeyName"
MSE_FUNCTION_MAN["param.1.required"]="1"
MSE_FUNCTION_MAN["param.1.default"]="${MSE_UNDEF}"
MSE_FUNCTION_MAN["param.1.min"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.1.max"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.1.options"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.1.description"]="Searched key name."


MSE_FUNCTION_MAN["param.2.type"]="assoc"
MSE_FUNCTION_MAN["param.2.name"]="AssocArrayName"
MSE_FUNCTION_MAN["param.2.required"]="1"
MSE_FUNCTION_MAN["param.2.default"]="${MSE_UNDEF}"
MSE_FUNCTION_MAN["param.2.min"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.2.max"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.2.options"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.2.description"]="Name of the associative array where the search will be done."


MSE_FUNCTION_MAN["return.type"]="bool"
MSE_FUNCTION_MAN["return.description"]=""
MSE_FUNCTION_MAN["return.description"]+="'1' if 'true'\n"
MSE_FUNCTION_MAN["return.description"]+="'0' if 'false'"