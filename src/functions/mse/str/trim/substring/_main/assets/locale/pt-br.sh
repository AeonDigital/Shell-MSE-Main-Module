#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


MSE_FUNCTION_MAN["description"]="Elimina qualquer espaço em branco existente imediatamente ANTES e APÓS a substring indicada."


MSE_FUNCTION_MAN["param.1.description"]="Substring alvo."

MSE_FUNCTION_MAN["param.2.description"]="String que será alterada."

MSE_FUNCTION_MAN["param.3.options"]=""
MSE_FUNCTION_MAN["param.3.options"]+="l: e, esq, esquerda\n"
MSE_FUNCTION_MAN["param.3.options"]+="r: d, dir, direita"
MSE_FUNCTION_MAN["param.3.description"]=""
MSE_FUNCTION_MAN["param.3.description"]+="Indica quando a alteração deve ser feita apenas em um dos lados da substring alvo.\n"
MSE_FUNCTION_MAN["param.3.description"]+="Use \"l\" para remover apenas à esquerda ou \"r\" para remover apenas à direita."


MSE_FUNCTION_MAN["return.description"]="Printa a string tratada."