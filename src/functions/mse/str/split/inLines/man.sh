#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


unset MSE_FUNCTION_MAN
declare -gA MSE_FUNCTION_MAN
MSE_FUNCTION_MAN["description"]=""
MSE_FUNCTION_MAN["description"]+="Splits the string passed in an array where each line will have at most the number of characters entered.\n"
MSE_FUNCTION_MAN["description"]+="The identified words will be kept without being separated between the lines."


MSE_FUNCTION_MAN["param.1.type"]="string"
MSE_FUNCTION_MAN["param.1.name"]="string"
MSE_FUNCTION_MAN["param.1.required"]="1"
MSE_FUNCTION_MAN["param.1.default"]="${MSE_UNDEF}"
MSE_FUNCTION_MAN["param.1.min"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.1.max"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.1.options"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.1.description"]="Original string."


MSE_FUNCTION_MAN["param.2.type"]="int"
MSE_FUNCTION_MAN["param.2.name"]="maxLineLength"
MSE_FUNCTION_MAN["param.2.required"]="1"
MSE_FUNCTION_MAN["param.2.default"]="${MSE_UNDEF}"
MSE_FUNCTION_MAN["param.2.min"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.2.max"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.2.options"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.2.description"]=""
MSE_FUNCTION_MAN["param.2.description"]+="Maximum number of characters per line.\n"
MSE_FUNCTION_MAN["param.2.description"]+="If not set, or, if invalid, uses the current value of the variable \"\$COLUMNS\".\n"


MSE_FUNCTION_MAN["return.type"]="array"
MSE_FUNCTION_MAN["return.description"]="The result will be defined in the variable \"MSE_LAST_FUNCTION_RETURN\"."