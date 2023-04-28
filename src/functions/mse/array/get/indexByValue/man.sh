#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


unset MSE_FUNCTION_MAN
declare -gA MSE_FUNCTION_MAN
MSE_FUNCTION_MAN["description"]="Identifies the index corresponding to the value passed in the indicated array."


MSE_FUNCTION_MAN["param.1.type"]="string"
MSE_FUNCTION_MAN["param.1.name"]="Value"
MSE_FUNCTION_MAN["param.1.required"]="1"
MSE_FUNCTION_MAN["param.1.default"]="${MSE_UNDEF}"
MSE_FUNCTION_MAN["param.1.min"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.1.max"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.1.options"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.1.description"]="Value being searched for."


MSE_FUNCTION_MAN["param.2.type"]="array"
MSE_FUNCTION_MAN["param.2.name"]="ArrayName"
MSE_FUNCTION_MAN["param.2.required"]="1"
MSE_FUNCTION_MAN["param.2.default"]="${MSE_UNDEF}"
MSE_FUNCTION_MAN["param.2.min"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.2.max"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.2.options"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.2.description"]="Name of the array where the search is to be made."


MSE_FUNCTION_MAN["param.3.type"]="bool"
MSE_FUNCTION_MAN["param.3.name"]="CaseInsensitive"
MSE_FUNCTION_MAN["param.3.required"]="0"
MSE_FUNCTION_MAN["param.3.default"]="0"
MSE_FUNCTION_MAN["param.3.min"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.3.max"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.3.options"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.3.description"]="Indicates whether the check should be done in \"insensitive case\".\n"
MSE_FUNCTION_MAN["param.3.description"]+="- Omit or indicate "0" for \"case sensitive\" (default)\n"
MSE_FUNCTION_MAN["param.3.description"]+="- Indicate "1" for \"insensitive case\""


MSE_FUNCTION_MAN["return.type"]="int"
MSE_FUNCTION_MAN["return.description"]=""
MSE_FUNCTION_MAN["return.description"]+="Returns the index on the array that corresponds to the indicated value.\n"
MSE_FUNCTION_MAN["return.description"]+="An empty value is returned if nothing is found."