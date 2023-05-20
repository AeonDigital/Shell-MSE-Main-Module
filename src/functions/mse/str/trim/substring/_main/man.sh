#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


unset MSE_FUNCTION_MAN
declare -gA MSE_FUNCTION_MAN
MSE_FUNCTION_MAN["description"]="Eliminates any existing white space immediately BEFORE and AFTER the indicated substring."


MSE_FUNCTION_MAN["param.1.type"]="string"
MSE_FUNCTION_MAN["param.1.name"]="Subtring"
MSE_FUNCTION_MAN["param.1.required"]="1"
MSE_FUNCTION_MAN["param.1.default"]="${MSE_UNDEF}"
MSE_FUNCTION_MAN["param.1.min"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.1.max"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.1.options"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.1.description"]="Target substring."


MSE_FUNCTION_MAN["param.2.type"]="string"
MSE_FUNCTION_MAN["param.2.name"]="String"
MSE_FUNCTION_MAN["param.2.required"]="1"
MSE_FUNCTION_MAN["param.2.default"]="${MSE_UNDEF}"
MSE_FUNCTION_MAN["param.2.min"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.2.max"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.2.options"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.2.description"]="String that will be changed."


MSE_FUNCTION_MAN["param.3.type"]="string"
MSE_FUNCTION_MAN["param.3.name"]="Type"
MSE_FUNCTION_MAN["param.3.required"]="0"
MSE_FUNCTION_MAN["param.3.default"]="${MSE_UNDEF}"
MSE_FUNCTION_MAN["param.3.min"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.3.max"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.3.options"]=""
MSE_FUNCTION_MAN["param.3.options"]+="l: left\n"
MSE_FUNCTION_MAN["param.3.options"]+="r: right"
MSE_FUNCTION_MAN["param.3.description"]=""
MSE_FUNCTION_MAN["param.3.description"]+="Indicates when the change should be made only on one side of the target substring.\n"
MSE_FUNCTION_MAN["param.3.description"]+="Use \"l\" to remove only on the left or \"r\" to remove only on the right."


MSE_FUNCTION_MAN["return.type"]="string"
MSE_FUNCTION_MAN["return.description"]="Prints the altered string."


MSE_FUNCTION_MAN["example.0"]=""
MSE_FUNCTION_MAN["example.0"]+="mse_str_trim_substring \":\" \"  Keep  calm   :   and   ... :   think  \"\n"
MSE_FUNCTION_MAN["example.0"]+="\"  Keep  calm:and   ...:think\""