#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Permite mostrar uma mensagem para o usuário oferecendo uma série de recursos
# padronizados que permitem a montagem de uma interface padrão para seus
# scripts.
#
# @param string $1
# Tipo de mensagem.
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
# @param bool $2
# Mostrar título.
# Use "0" para omitir o título.
# Use "1" para mostrar o título.
#
# @param string $3
# Indentação para o título.
#
# @param string $4
# Bullet para o título.
#
# @param char $5
# Mostrar título com cor.
#   - "0" para não usar cores.
#   - "1" para usar cores na parte textual do título.
#   - "2" para usar cores em todo o título, incluindo o bullet.
#
# A cor do bullet e título são definidas conforme o "tema" selecionado
# para a mensagem. Se uma cor for definida diretamente para a string do
# bullet ou do título, estas, se sobreporão ao que é indicado pelo "tema"
# selecionado.
#
# @param string $6
# Título.
# Se "", usará o título padrão conforme o tipo de mensagem, ou, deixará a linha
# do título vazia em caso de tipo de mensagem "none".
#
# @param string $7
# Espaços (use um ou mais "\n") entre o título e o corpo da mensagem.
#
#
# @param bool $8
# Mostrar mensagem.
# Use "0" para omitir o corpo da mensagem.
# Use "1" para mostrar o corpo da mensagem.
#
# @param string $9
# Indentação para as linhas do corpo da mensagem.
#
# @param string $10
# Bullet para a primeira linha do corpo das mensagens.
#
# @param string $11
# Bullet para a todas as linhas do corpo das mensagens (exceto a primeira).
#
# @param char $12
# Mostrar mensagens com cor.
#   - "0" para não usar cores.
#   - "1" para usar cores na parte textual das linhas.
#   - "2" para usar cores em toda a linha, incluindo o bullet.
#
# @param string $13
# Nome de um array unidimensional em que estão as frases que devem ser
# mostradas para o usuário.
#
# @param string $14
# Espaços (use um ou mais "\n") entre o corpo da mensagem e a próxima linha
# do prompt do terminal.
#
#
# @param string $15
# Nome da função/tema usada para renderizar as mensagens a serem mostradas
# na tela.
#
# @return
# Printa na tela as informações desejadas conforme as configurações definidas.
# Em caso de erro, suprimirá qualquer saída e a mensagem de erro ficará
# registrada na variável global 'MSE_GLOBAL_LASTERR'.
mse_inter_showMessage() {
  printf ""
}





#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_inter_alertUser_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=4
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="ArrayName :: r :: arrayName"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="AlertType :: o :: list :: i"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1_labels"]="none, info, attention, warning, error, fail, success"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1_values"]="n, i, a, w, e, f, s"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="UseColors :: o :: char :: 1"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_3"]="Theme :: o :: functionName :: mse_inter_theme_default"
}
