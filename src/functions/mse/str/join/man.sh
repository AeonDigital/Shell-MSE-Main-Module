#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


unset MSE_FUNCTION_MAN
declare -gA MSE_FUNCTION_MAN
MSE_FUNCTION_MAN["description"]="Joins the items in an array using a special string indicated."


MSE_FUNCTION_MAN["param.1.type"]="string"
MSE_FUNCTION_MAN["param.1.name"]="Glue"
MSE_FUNCTION_MAN["param.1.required"]="1"
MSE_FUNCTION_MAN["param.1.default"]="${MSE_UNDEF}"
MSE_FUNCTION_MAN["param.1.min"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.1.max"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.1.options"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.1.description"]="String that will be used as 'glue' for the join."


MSE_FUNCTION_MAN["param.2.type"]="array"
MSE_FUNCTION_MAN["param.2.name"]="ArrayName"
MSE_FUNCTION_MAN["param.2.required"]="1"
MSE_FUNCTION_MAN["param.2.default"]="${MSE_UNDEF}"
MSE_FUNCTION_MAN["param.2.min"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.2.max"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.2.options"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.2.description"]="Array name."


MSE_FUNCTION_MAN["return.type"]="bool"
MSE_FUNCTION_MAN["return.description"]=""
MSE_FUNCTION_MAN["return.description"]+="Prints the array values separated by the string set at \$1."


MSE_FUNCTION_MAN["example.0"]=""
MSE_FUNCTION_MAN["example.0"]+="myArray=("2022" "12" "22")\n"
MSE_FUNCTION_MAN["example.0"]+="mse_str_join '-' "myArray"\n"
MSE_FUNCTION_MAN["example.0"]+="2022-12-22"