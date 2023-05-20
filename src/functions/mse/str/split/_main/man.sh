#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


unset MSE_FUNCTION_MAN
declare -gA MSE_FUNCTION_MAN
MSE_FUNCTION_MAN["description"]="Splits the passed string into an array using the indicated separator."


MSE_FUNCTION_MAN["param.1.type"]="string"
MSE_FUNCTION_MAN["param.1.name"]="separator"
MSE_FUNCTION_MAN["param.1.required"]="1"
MSE_FUNCTION_MAN["param.1.default"]="${MSE_UNDEF}"
MSE_FUNCTION_MAN["param.1.min"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.1.max"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.1.options"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.1.description"]="Separator."


MSE_FUNCTION_MAN["param.2.type"]="string"
MSE_FUNCTION_MAN["param.2.name"]="string"
MSE_FUNCTION_MAN["param.2.required"]="1"
MSE_FUNCTION_MAN["param.2.default"]="${MSE_UNDEF}"
MSE_FUNCTION_MAN["param.2.min"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.2.max"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.2.options"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.2.description"]="Original string (which will be \"splited\")."


MSE_FUNCTION_MAN["param.3.type"]="bool"
MSE_FUNCTION_MAN["param.3.name"]="removeEmpty"
MSE_FUNCTION_MAN["param.3.required"]="1"
MSE_FUNCTION_MAN["param.3.default"]="0"
MSE_FUNCTION_MAN["param.3.min"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.3.max"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.3.options"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.3.description"]="Indicates when empty values should be kept in the resulting array."


MSE_FUNCTION_MAN["param.4.type"]="bool"
MSE_FUNCTION_MAN["param.4.name"]="trim"
MSE_FUNCTION_MAN["param.4.required"]="1"
MSE_FUNCTION_MAN["param.4.default"]="0"
MSE_FUNCTION_MAN["param.4.min"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.4.max"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.4.options"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.4.description"]="indicates when to perform a \"trim\" on each of the values found."


MSE_FUNCTION_MAN["return.type"]="array"
MSE_FUNCTION_MAN["return.description"]="The result will be defined in the variable \"MSE_LAST_FUNCTION_RETURN\"."


MSE_FUNCTION_MAN["example.0"]=""
MSE_FUNCTION_MAN["example.0"]+="mse_str_split \"-\" \"2022-12-22\"\n"
MSE_FUNCTION_MAN["example.0"]+="echo \"\${MSE_LAST_FUNCTION_RETURN[0]}\""
MSE_FUNCTION_MAN["example.0"]="\"2022\""
MSE_FUNCTION_MAN["example.0"]+="echo \"\${MSE_LAST_FUNCTION_RETURN[1]}\""
MSE_FUNCTION_MAN["example.0"]="\"12\""
