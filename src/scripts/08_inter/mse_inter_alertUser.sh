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
# Cada tema pode fornecer vários formatos de mensagem, se for o caso, neste
# parametro deve ser indicado qual deve ser usado. De outra forma o formato
# padrão será utilizado.
#
#
# @param string $3
# Título a ser usado na mensagem.
# Se não for indicado, buscará a mensagem correspondente ao tipo definido para
# a mensagem.
# Use "::" como separador entre um código identificador da mensagem e o título
# propriamente dito. Internamente o tipo de título usado será alterado para o
# formato "3".
#
#
# @param string $4
# Nome de um array unidimensional em que estão as frases que devem ser
# usadas para montar o corpo da mensagem.
# Esta informação será mostrada caso o formato da mensagem esteja configurada
# para tal. Da mesma forma, se não for indicado um valor válido e o formato
# exija tal valor, um erro pode ser causado.
#
# @return
# Printa na tela a mensagem indicada conforme configuração passada.
mse_inter_alertUser() {
  if [ $# -ge 4 ]; then
    #
    # Melhorar este ponto... esta variável deve ser global e apenas ser redefinida
    # quando um novo theme for carregado ?!
    declare -A mseTmpMsgConfig
    mse_inter_prepareMessage "mseTmpMsgConfig" "${1}" "${MSE_GLOBAL_THEME_NAME}" "${2}"

    #
    # Ajusta o tipo do título a partir da presença do separador "::"
    if [[ "${3}" == *"::"* ]]; then
      mseTmpMsgConfig["title_type"]="3"
    fi

    mseTmpMsgConfig["body_lines"]="${4}"

    mse_inter_showMessage "mseTmpMsgConfig"
  fi
}





#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_inter_alertUser_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=4
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="MetaType :: r :: list"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0_labels"]="none, info, attention, warning, error, fail, success"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0_values"]="n, i, a, w, e, f, s, fr, or, ca, im"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="MetaFormat :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="TitleString :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_3"]="BodyLines :: r :: arrayName"
}
