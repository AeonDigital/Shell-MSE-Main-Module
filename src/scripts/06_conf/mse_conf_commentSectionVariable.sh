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
# Nome da seção alvo.
#
# @param string $3
# Nome da variável alvo.
#
# @param string $4
# Caracter usado para comentar a linha.
#
# @return
# Printa '1' se conseguir alterar o arquivo alvo ou se a variável
# já está no estado em que deveria ficar.
# Ou
# Printa a mensagem do erro ocorrido.
mse_conf_commentSectionVariable()
{
  mse_conf_mainComment "$1" "$2" "$3" "$4" "1"
}





#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_conf_commentSectionVariable_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=4
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="PathToFile :: r :: fileName"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="SectionName :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="VariableName :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_3"]="CommentChar :: r :: char"
}
