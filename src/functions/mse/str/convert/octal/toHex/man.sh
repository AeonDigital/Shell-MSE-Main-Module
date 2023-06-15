#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


unset MSE_FUNCTION_MAN
declare -gA MSE_FUNCTION_MAN
MSE_FUNCTION_MAN["description"]="Converts a \"octal\" to its respective \"hex\"."


MSE_FUNCTION_MAN["param.1.type"]="charOctal"
MSE_FUNCTION_MAN["param.1.name"]="CharOctal"
MSE_FUNCTION_MAN["param.1.required"]="1"
MSE_FUNCTION_MAN["param.1.default"]="${MSE_UNDEF}"
MSE_FUNCTION_MAN["param.1.min"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.1.max"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.1.options"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.1.description"]="Value that will be converted."


MSE_FUNCTION_MAN["return.type"]="charHex"
MSE_FUNCTION_MAN["return.description"]=""
MSE_FUNCTION_MAN["return.description"]+="\"Hexadecimal\" representation of the reported \"octal\"."
MSE_FUNCTION_MAN["return.description"]+="Multibyte values will return more than one value, \n"
MSE_FUNCTION_MAN["return.description"]+="each representing one of its bytes."


MSE_FUNCTION_MAN["example.0"]=""
MSE_FUNCTION_MAN["example.0"]+="mse_str_convert_octal_to_char \"303 255\"\n"
MSE_FUNCTION_MAN["example.0"]+="\"C3 AD\""