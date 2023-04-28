#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


MSE_FUNCTION_MAN["description"]="Identifica o índice correspondente ao valor passado no array indicado."


MSE_FUNCTION_MAN["param.1.description"]="Valor que está sendo pesquisado."

MSE_FUNCTION_MAN["param.2.description"]="Nome do array onde a pesquisa deve ser feita."

MSE_FUNCTION_MAN["param.3.description"]="Indica se a verificação deve ser feita em \"insensitive case\".\n"
MSE_FUNCTION_MAN["param.3.description"]+="- Omitir ou indicar "0" para \"case sensitive\" (padrão)\n"
MSE_FUNCTION_MAN["param.3.description"]+="- Indique "1" para \"insensitive case\""


MSE_FUNCTION_MAN["return.description"]=""
MSE_FUNCTION_MAN["return.description"]+="Retorna o índice no array que corresponde ao valor indicado.\n"
MSE_FUNCTION_MAN["return.description"]+="Um valor vazio é retornado se nada for encontrado."