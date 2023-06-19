#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


unset MSE_FUNCTION_MAN
declare -gA MSE_FUNCTION_MAN
MSE_FUNCTION_MAN["description"]="Fills a string with the indicated character.\n"
MSE_FUNCTION_MAN["description"]+="Adds to the original string a total of \$2 characters to the left\n"
MSE_FUNCTION_MAN["description"]+="or right (as per \$4) until it has the total characters indicated at \$3."


MSE_FUNCTION_MAN["param.1.type"]="string"
MSE_FUNCTION_MAN["param.1.name"]="String"
MSE_FUNCTION_MAN["param.1.required"]="1"
MSE_FUNCTION_MAN["param.1.default"]="${MSE_UNDEF}"
MSE_FUNCTION_MAN["param.1.min"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.1.max"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.1.options"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.1.description"]="String that will be populated."


MSE_FUNCTION_MAN["param.2.type"]="char"
MSE_FUNCTION_MAN["param.2.name"]="PadChar"
MSE_FUNCTION_MAN["param.2.required"]="1"
MSE_FUNCTION_MAN["param.2.default"]="${MSE_UNDEF}"
MSE_FUNCTION_MAN["param.2.min"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.2.max"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.2.options"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.2.description"]="String that will be used to populate."


MSE_FUNCTION_MAN["param.3.type"]="int"
MSE_FUNCTION_MAN["param.3.name"]="TotalLength"
MSE_FUNCTION_MAN["param.3.required"]="1"
MSE_FUNCTION_MAN["param.3.default"]="${MSE_UNDEF}"
MSE_FUNCTION_MAN["param.3.min"]="2"
MSE_FUNCTION_MAN["param.3.max"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.3.options"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.3.description"]="Total characters that the final string should have."


MSE_FUNCTION_MAN["param.4.type"]="string"
MSE_FUNCTION_MAN["param.4.name"]="PadPosition"
MSE_FUNCTION_MAN["param.4.required"]="1"
MSE_FUNCTION_MAN["param.4.default"]="${MSE_UNDEF}"
MSE_FUNCTION_MAN["param.4.min"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.4.max"]="${MSE_NULL}"
MSE_FUNCTION_MAN["param.4.options"]=""
MSE_FUNCTION_MAN["param.4.options"]+="l: left\n"
MSE_FUNCTION_MAN["param.4.options"]+="r: right"
MSE_FUNCTION_MAN["param.4.description"]=""
MSE_FUNCTION_MAN["param.4.description"]+="Position in which the filling should be done.\n"
MSE_FUNCTION_MAN["param.4.description"]+="Use \"l\" to fill on the left or \"r\" to fill on the right."


MSE_FUNCTION_MAN["return.type"]="string"
MSE_FUNCTION_MAN["return.description"]="Returns the changed string."


MSE_FUNCTION_MAN["example.0"]=""
MSE_FUNCTION_MAN["example.0"]+="mse_str_pad \"32\" \"0\" \"5\" \"l\"\n"
MSE_FUNCTION_MAN["example.0"]+="\"00032\""