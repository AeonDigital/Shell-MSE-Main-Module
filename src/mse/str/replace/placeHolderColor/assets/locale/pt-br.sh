#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


MSE_FUNCTION_MAN["description"]=""
MSE_FUNCTION_MAN["description"]+="Substitui um ou mais \"placeholder\" em uma string pelos valores indicados\n"
MSE_FUNCTION_MAN["description"]+="adicionando ao mesmo a cor informada.\n"
MSE_FUNCTION_MAN["description"]+="Os \"placeholders\" precisam ser definidos usando o seguinte padrão: [[PHNAME]]\n"
MSE_FUNCTION_MAN["description"]+="Após o terceiro argumento, novos pares de argumentos podem ser passados para serem usados em\n"
MSE_FUNCTION_MAN["description"]+="substituição a um novo placeholder dentro da mesma string original."


MSE_FUNCTION_MAN["param.1.description"]=""
MSE_FUNCTION_MAN["param.1.description"]+="String original que contém os \"placeholders\" e que será\n"
MSE_FUNCTION_MAN["param.1.description"]+="retornada com as devidas substituições."

MSE_FUNCTION_MAN["param.2.description"]="Nome de um placeholder a ser substituído (informe o nome sem os colchetes)."

MSE_FUNCTION_MAN["param.3.description"]="Valor a ser usado no lugar do placeholder."

MSE_FUNCTION_MAN["param.4.description"]="Código da cor que será usada."


MSE_FUNCTION_MAN["return.description"]="Printa a string original com a substituição dos placeholders pelos novos conteúdos indicados."