#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


unset MSE_FUNCTION_MAN
declare -gA MSE_FUNCTION_MAN
MSE_FUNCTION_MAN["description"]="Counts the lines of the file or string and prints the result."



MSE_FUNCTION_MAN["param.1.type"]="string"
MSE_FUNCTION_MAN["param.1.name"]="PathToFile"
MSE_FUNCTION_MAN["param.1.required"]="1"
MSE_FUNCTION_MAN["param.1.default"]="${MSE_UNDEF}"
MSE_FUNCTION_MAN["param.1.min"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.1.max"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.1.options"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.1.description"]="Path to the file or string that will be used."


MSE_FUNCTION_MAN["return.type"]="int"
MSE_FUNCTION_MAN["return.description"]=""
MSE_FUNCTION_MAN["return.description"]+="Total file lines.\n"
MSE_FUNCTION_MAN["return.description"]+="Because of the way bash works with respect to handling empty lines\n"
MSE_FUNCTION_MAN["return.description"]+="at the end of files, keep in mind that the line count will only go up to\n"
MSE_FUNCTION_MAN["return.description"]+="the last non-empty line of the indicated file."
