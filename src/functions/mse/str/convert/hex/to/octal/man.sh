#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


unset MSE_FUNCTION_MAN
declare -gA MSE_FUNCTION_MAN
MSE_FUNCTION_MAN["description"]="Converts a \"hex\" to its respective \"octal\"."


MSE_FUNCTION_MAN["param.1.type"]="charHex"
MSE_FUNCTION_MAN["param.1.name"]="CharHex"
MSE_FUNCTION_MAN["param.1.required"]="1"
MSE_FUNCTION_MAN["param.1.default"]="${MSE_UNDEF}"
MSE_FUNCTION_MAN["param.1.min"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.1.max"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.1.options"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.1.description"]="Value that will be converted."


MSE_FUNCTION_MAN["return.type"]="charOctal"
MSE_FUNCTION_MAN["return.description"]=""
MSE_FUNCTION_MAN["return.description"]+="\"Octal\" representation of the reported \"hexadecimal\"."
MSE_FUNCTION_MAN["return.description"]+="Multibyte values will return more than one value, \n"
MSE_FUNCTION_MAN["return.description"]+="each representing one of its bytes."


MSE_FUNCTION_MAN["example.0"]=""
MSE_FUNCTION_MAN["example.0"]+="mse_str_convert_hex_to_char \"C3 AD\"\n"
MSE_FUNCTION_MAN["example.0"]+="\"303 255\""