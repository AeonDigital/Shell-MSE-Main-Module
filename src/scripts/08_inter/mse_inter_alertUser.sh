#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Mostra uma mensagem de alerta para o usuário usando o tema que está
# atualmente configurado na variável "MSE_GLOBAL_THEME_NAME".
#
# @param string $1
# Tipo de mensagem.
#
# [[ Mensagens de Alerta ]]
#
#   - ""        | ""  : Não definido (valor padrão).
#   - none      | n   : Não definido (mesmo que acima).
#   - info      | i   : Informação genérica.
#   - attention | a   : Atenção.
#   - warning   | w   : Alerta.
#   - error     | e   : Erro em uma operação.
#   - fail      | f   : Falha em uma operação.
#   - success   | s   : Sucesso em uma operação.
#
#
# @param string $2
# Formato da mensagem.
# Deve estar de acordo com um dos formatos fornecidos pelo tema que está sendo
# usado no momento. Em caso de um valor inválido, será usado o formato padrão
# indicado pelo próprio tema.
#
#
# @param string $3
# Opcional (para o tema padrão)
# Título da mensagem.
#
#
# @param string $4
# Opcional (para o tema padrão)
# Nome de um array unidimensional em que estão as linhas da mensagem.
#
#
# @return
# Printa na tela a mensagem indicada conforme configuração passada.
mse_inter_alertUser() {
  mse_inter_showMessage "MSE_GLOBAL_SHOW_MESSAGE_CONFIG" "${1}" "${2}" "${3}" "${4}"
}





#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_inter_alertUser_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=4
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="MetaType :: r :: list"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0_labels"]="none, info, attention, warning, error, fail, success"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0_values"]="n, i, a, w, e, f, s"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="MetaFormat :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="TitleString :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_3"]="BodyLines :: o :: arrayName"
}
