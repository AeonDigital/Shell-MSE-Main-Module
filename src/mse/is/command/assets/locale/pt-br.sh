#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


MSE_FUNCTION_MAN["description"]="A partir de um comando que executa um programa, identifica se o mesmo está disponível para uso."


MSE_FUNCTION_MAN["param.1.description"]=""
MSE_FUNCTION_MAN["param.1.description"]+="Comando que será usado para testar a disponibilidade do programa.\n"
MSE_FUNCTION_MAN["param.1.description"]+="É recomendado o uso de algum comando de baixo impacto como os\n"
MSE_FUNCTION_MAN["param.1.description"]+="típicos \"-v | --version\""


MSE_FUNCTION_MAN["return.description"]=""
MSE_FUNCTION_MAN["return.description"]+="\"1\" se \"true\"\n"
MSE_FUNCTION_MAN["return.description"]+="\"0\" se \"false\""