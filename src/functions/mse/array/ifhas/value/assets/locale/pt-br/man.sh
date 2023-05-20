#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


MSE_FUNCTION_MAN["description"]="Identifica quando o valor indicado existe no array alvo."

MSE_FUNCTION_MAN["param.1.description"]="Valor procurado."
MSE_FUNCTION_MAN["param.2.description"]="Nome do array em que a pesquisa deve ser feita."
MSE_FUNCTION_MAN["param.3.description"]="Indica quando a verificação deve ser feita em \"insensitive case\".\n"
MSE_FUNCTION_MAN["param.3.description"]+="- Omita ou indique \"0\" para \"case sensitive\" (padrão)\n"
MSE_FUNCTION_MAN["param.3.description"]+="- Indique \"1\" para \"insensitive case\""

MSE_FUNCTION_MAN["return.description"]=""
MSE_FUNCTION_MAN["return.description"]+="\"1\" se \"true\"\n"
MSE_FUNCTION_MAN["return.description"]+="\"0\" se \"false\""