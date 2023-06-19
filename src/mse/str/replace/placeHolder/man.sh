#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


unset MSE_FUNCTION_MAN
declare -gA MSE_FUNCTION_MAN
MSE_FUNCTION_MAN["description"]="Replaces one or more \"placeholder\" in a string with the given values.\n"
MSE_FUNCTION_MAN["description"]+="The \"placeholders\" need to be defined using the following pattern: [[PHNAME]]\n"
MSE_FUNCTION_MAN["description"]+="After the third argument, new argument pairs can be passed to be\n"
MSE_FUNCTION_MAN["description"]+="used in place of a new placeholder within the same original string."


MSE_FUNCTION_MAN["param.1.type"]="string"
MSE_FUNCTION_MAN["param.1.name"]="String"
MSE_FUNCTION_MAN["param.1.required"]="1"
MSE_FUNCTION_MAN["param.1.default"]="${MSE_UNDEF}"
MSE_FUNCTION_MAN["param.1.min"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.1.max"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.1.options"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.1.description"]=""
MSE_FUNCTION_MAN["param.1.description"]="Original string that contains the \"placeholders\" and that will be returned\n"
MSE_FUNCTION_MAN["param.1.description"]="with the appropriate substitutions."


MSE_FUNCTION_MAN["param.2.type"]="string"
MSE_FUNCTION_MAN["param.2.name"]="PlaceHolderName"
MSE_FUNCTION_MAN["param.2.required"]="1"
MSE_FUNCTION_MAN["param.2.default"]="${MSE_UNDEF}"
MSE_FUNCTION_MAN["param.2.min"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.2.max"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.2.options"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.2.description"]="Name of a placeholder to be replaced (enter the name without the square brackets)."


MSE_FUNCTION_MAN["param.3.type"]="string"
MSE_FUNCTION_MAN["param.3.name"]="PlaceHolderValue"
MSE_FUNCTION_MAN["param.3.required"]="1"
MSE_FUNCTION_MAN["param.3.default"]="${MSE_UNDEF}"
MSE_FUNCTION_MAN["param.3.min"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.3.max"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.3.options"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.3.description"]="Value to use in place of the placeholder."


MSE_FUNCTION_MAN["return.type"]="string"
MSE_FUNCTION_MAN["return.description"]=""
MSE_FUNCTION_MAN["return.description"]="Prints the original string with the replacement of the placeholders\n"
MSE_FUNCTION_MAN["return.description"]="by the new indicated contents.


MSE_FUNCTION_MAN["example.0"]=""
MSE_FUNCTION_MAN["example.0"]+="mse_str_replacePlaceHolder \"my name is [[NAME]]\" \"NAME\" \"Katze\"\n"
MSE_FUNCTION_MAN["example.0"]+="\"my name is Katze\""
MSE_FUNCTION_MAN["example.1"]=""
MSE_FUNCTION_MAN["example.1"]+="mse_str_replacePlaceHolder \"my name is [[NAME]] and i living in [[COUNTRY]]\" \"NAME\" \"Katze\" \"COUNTRY\" \"Brasil\"\n"
MSE_FUNCTION_MAN["example.1"]+="\"my name is Katze and i living in Brasil\""