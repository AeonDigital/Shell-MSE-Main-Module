#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Permite editar um arquivo de configuração do tipo chave=valor e comentar uma
# variável indicada.
#
# Se o arquivo de configuração estiver mal formatado e existir dentro da mesma
# seção uma variável duplicada, apenas a primeira será levada em consideração.
#
# @param string $1
# Caminho até o arquivo alvo.
#
# @param string $2
# Nome da variável alvo.
#
# @param string $3
# Caracter usado para comentar a linha.
#
# @return
# Printa '1' se conseguir alterar o arquivo alvo ou se a variável
# já está no estado em que deveria ficar.
# Ou
# Printa a mensagem do erro ocorrido.
mse_conf_commentVariable()
{
  mse_conf_mainComment "$1" "" "$2" "$3" "1"
}





#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_conf_commentVariable_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=3
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="PathToFile :: r :: fileName"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="VariableName :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="CommentChar :: r :: char"
}
