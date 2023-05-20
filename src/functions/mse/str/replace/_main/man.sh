#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


unset MSE_FUNCTION_MAN
declare -gA MSE_FUNCTION_MAN
MSE_FUNCTION_MAN["description"]="Replaces every occurrence of the old substring with the new substring in the original string."


MSE_FUNCTION_MAN["param.1.type"]="string"
MSE_FUNCTION_MAN["param.1.name"]="old"
MSE_FUNCTION_MAN["param.1.required"]="1"
MSE_FUNCTION_MAN["param.1.default"]="${MSE_UNDEF}"
MSE_FUNCTION_MAN["param.1.min"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.1.max"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.1.options"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.1.description"]="Old string (which will be replaced)."


MSE_FUNCTION_MAN["param.2.type"]="string"
MSE_FUNCTION_MAN["param.2.name"]="new"
MSE_FUNCTION_MAN["param.2.required"]="1"
MSE_FUNCTION_MAN["param.2.default"]="${MSE_UNDEF}"
MSE_FUNCTION_MAN["param.2.min"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.2.max"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.2.options"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.2.description"]="New string (which will be added in place of the old one)."


MSE_FUNCTION_MAN["param.3.type"]="string"
MSE_FUNCTION_MAN["param.3.name"]="string"
MSE_FUNCTION_MAN["param.3.required"]="1"
MSE_FUNCTION_MAN["param.3.default"]="${MSE_UNDEF}"
MSE_FUNCTION_MAN["param.3.min"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.3.max"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.3.options"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.3.description"]="Original string."


MSE_FUNCTION_MAN["return.type"]="string"
MSE_FUNCTION_MAN["return.description"]="Prints the result of the performed substitution."


MSE_FUNCTION_MAN["example.0"]=""
MSE_FUNCTION_MAN["example.0"]+="mse_str_replace \"22\" \"20\" \"2022-12-22\"\n"
MSE_FUNCTION_MAN["example.0"]+="\"2020-12-20\""