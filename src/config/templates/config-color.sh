#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Array associativo que armazena as definições de cores a serem usadas.
unset MSE_GLOBAL_MAIN_THEME_COLORS
declare -gA MSE_GLOBAL_MAIN_THEME_COLORS



#
# Mensagens
#
# As mensagens apresentadas para o usuário podem ser classificadas de 6
# formas diferentes.
# Cada uma exibirá o título com uma cor conforme sua classificação.
# Cada classificação possui uma variação "a1" que é usada para informações
# de destaque e que se fornecidas (ou conforme o contexto) aparecerão ao lado
# do título.

#
# informativa|genérica|padrão
# - padrão      : cinza, negrito
# - variação a1 : cinza, negrito, baixa intensidade
#
# Usadas com intuito meramente informativo sem qualquer criticidade.
MSE_GLOBAL_MAIN_THEME_COLORS["info"]=$(mse_font_createStyle "4" "BOLD" "NONE" "LBLACK" "1")
MSE_GLOBAL_MAIN_THEME_COLORS["info_a1"]=$(mse_font_createStyle "4" "BOLD,DARK" "NONE" "LBLACK" "1")

#
# atenção
# - padrão      : azul claro, negrito
# - variação a1 : azul claro, negrito, baixa intensidade
#
# Geralmente usadas para indicar o início de um processamento já aceito pelo
# usuário ou o fim do mesmo caso nada de grave ou fora do esperado tenha
# ocorrido.
MSE_GLOBAL_MAIN_THEME_COLORS["attention"]=$(mse_font_createStyle "4" "BOLD" "NONE" "LBLUE" "1")
MSE_GLOBAL_MAIN_THEME_COLORS["attention_a1"]=$(mse_font_createStyle "4" "BOLD,DARK" "NONE" "LBLUE" "1")

#
# alerta
# - padrão      : amarelo claro, negrito
# - variação a1 : amarelo claro, negrito, baixa intensidade
#
# Usado como forma de chamar atenção do usuário para o que está ocorrendo.
# É o caso de, quando possível, oferecer um prompt para que o usuário possa
# optar por não seguir adiante com a ação. Também é usado quando uma ação foi
# realizada mas seu encerramento não foi um erro e nem exatamente o esperado.
MSE_GLOBAL_MAIN_THEME_COLORS["warning"]=$(mse_font_createStyle "4" "BOLD" "NONE" "LYELLOW" "1")
MSE_GLOBAL_MAIN_THEME_COLORS["warning_a1"]=$(mse_font_createStyle "4" "BOLD,DARK" "NONE" "LYELLOW" "1")

#
# erro
# - padrão      : vermelho claro, negrito
# - variação a1 : vermelho claro, negrito, baixa intensidade
#
# Chama a atenção para algum erro que ocorreu durante o processamento de uma
# ação.
# Também pode ter sido um erro causado pelo próprio usuário ao falhar na
# entrada de uma informação requerida ou omitir alguma que fosse obrigatória.
MSE_GLOBAL_MAIN_THEME_COLORS["error"]=$(mse_font_createStyle "4" "BOLD" "NONE" "LRED" "1")
MSE_GLOBAL_MAIN_THEME_COLORS["error_a1"]=$(mse_font_createStyle "4" "BOLD,DARK" "NONE" "LRED" "1")

#
# falha
# - padrão      : vermelho claro, negrito
# - variação a1 : vermelho, negrito, baixa intensidade
#
# Informa o usuário de uma falha ocorrida num processamento e que é
# independente de alguma ação que ele tenha tomado.
MSE_GLOBAL_MAIN_THEME_COLORS["fail"]=$(mse_font_createStyle "4" "BOLD" "NONE" "RED" "1")
MSE_GLOBAL_MAIN_THEME_COLORS["fail_a1"]=$(mse_font_createStyle "4" "BOLD,DARK" "NONE" "RED" "1")

#
# sucesso
# - padrão      : verde, negrito
# - variação a1 : verde, baixa intensidade
#
# Mensagem que indica o sucesso de uma ação.
MSE_GLOBAL_MAIN_THEME_COLORS["success"]=$(mse_font_createStyle "4" "BOLD" "NONE" "GREEN" "1")
MSE_GLOBAL_MAIN_THEME_COLORS["success_a1"]=$(mse_font_createStyle "4" "BOLD,DARK" "NONE" "GREEN" "1")



#
# Prompt
#
# Quando um prompt é lançado para o usuário a espera de sua resposta há 4
# classificações que podem ser usadas.
# Da mesma forma que para as mensagens, há uma variação "a1" para cada
# classificação e que é usada da mesma forma, junto ao título como um destaque
# em relação ao mesmo.
#
# Importante salientar que, dentro de um formulário maior, estes padrões não
# precisam ser seguidos pois pode-se, no início do mesmo informar ao usuário
# que tudo ali é importante e depois, usar a classificação padrão em cada
# prompt lançado.
# A classificação dos prompts existe apenas para dar ao usuário uma orientação
# e contexto visual estéticamente agradável.

#
# trivial|padrão
# - padrão      : azul claro, negrito
# - variação a1 : azul claro, baixa intensidade
#
# Informação requerida não é obrigatória ou não é essencial dentro do contexto
# para que faça alguma diferença grande a sua obtenção.
MSE_GLOBAL_MAIN_THEME_COLORS["ordinary"]=$(mse_font_createStyle "4" "BOLD" "NONE" "LBLUE" "1")
MSE_GLOBAL_MAIN_THEME_COLORS["ordinary_a1"]=$(mse_font_createStyle "4" "BOLD,DARK" "NONE" "LBLUE" "1")

#
# amigável
# - padrão      : verde claro, negrito
# - variação a1 : verde claro, baixa intensidade
#
# Assim como a classificação 'trivial', este tipo de contexto indica uma
# informação que não visa ser obrigatória nem essencial mas usa um destaque
# colorido diferenciado como uma forma de variação ao padrão.
MSE_GLOBAL_MAIN_THEME_COLORS["friendly"]=$(mse_font_createStyle "4" "BOLD" "NONE" "LGREEN" "1")
MSE_GLOBAL_MAIN_THEME_COLORS["friendly_a1"]=$(mse_font_createStyle "4" "BOLD,DARK" "NONE" "LGREEN" "1")

#
# cuidado
# - padrão      : amarelo claro, negrito
# - variação a1 : amarelo claro, baixa intensidade
#
# Indica que a informação requerida é obrigatória ou sensível e exige do
# usuário alguma forma de cautela em seu registro.
MSE_GLOBAL_MAIN_THEME_COLORS["caution"]=$(mse_font_createStyle "4" "BOLD" "NONE" "LYELLOW" "1")
MSE_GLOBAL_MAIN_THEME_COLORS["caution_a1"]=$(mse_font_createStyle "4" "BOLD,DARK" "NONE" "LYELLOW" "1")

#
# importante
# - padrão      : vermelho claro, negrito
# - variação a1 : vermelho claro, baixa intensidade
#
# Indica que a informação requerida é obrigatória essencial e/ou sensível e
# requer do usuário uma atenção especial em seu preenchimento.
MSE_GLOBAL_MAIN_THEME_COLORS["important"]=$(mse_font_createStyle "4" "BOLD" "NONE" "LRED" "1")
MSE_GLOBAL_MAIN_THEME_COLORS["important_a1"]=$(mse_font_createStyle "4" "BOLD,DARK" "NONE" "LRED" "1")





#
# Corpo de mensagems
#
# Como forma de manter a identidade visual das mensagens e prompts, todos
# utilizam esta mesma cor no corpo de seus textos.
MSE_GLOBAL_MAIN_THEME_COLORS["body"]=$(mse_font_createStyle "4" "BOLD" "NONE" "LBLACK" "1")





#
# Barra de progresso
#
# Utilize as entradas abaixo para configurar a aparencia das barras de
# progresso.
#
# [###############               ] ( 50%)
# b01_char      : #
# b01_delimiter : []
# b01_data      : 50%
# b02_delimiter : ()
MSE_GLOBAL_MAIN_THEME_COLORS["b01_char"]=$(mse_font_createStyle "4" "BOLD" "NONE" "LBLUE" "1")
MSE_GLOBAL_MAIN_THEME_COLORS["b01_delimiter"]=$(mse_font_createStyle "4" "DARK" "NONE" "WHITE" "1")

MSE_GLOBAL_MAIN_THEME_COLORS["b01_data"]=$(mse_font_createStyle "4" "" "NONE" "WHITE" "1")
MSE_GLOBAL_MAIN_THEME_COLORS["b02_delimiter"]=$(mse_font_createStyle "4" "BOLD" "NONE" "LBLACK" "1")





#
# Reseta todos os arrays associativos que estão correlacionados
# as cores usadas nas mensagens
# MSE_GSMCTC = MSE_GLOBAL_SHOW_MESSAGE_CONFIG_THEME_COLOR

#
# [Bloco 01: Separador superior da mensagem]
unset MSE_GSMCTC_B01_TOP_SEPARATOR
declare -gA MSE_GSMCTC_B01_TOP_SEPARATOR

#
# [Bloco 02: Título]
unset MSE_GSMCTC_B02_TOP_SEPARATOR
unset MSE_GSMCTC_B02_BULLET
unset MSE_GSMCTC_B02_TEXT
unset MSE_GSMCTC_B02_BOTTOM_SEPARATOR

declare -gA MSE_GSMCTC_B02_TOP_SEPARATOR
declare -gA MSE_GSMCTC_B02_BULLET
declare -gA MSE_GSMCTC_B02_TEXT
declare -gA MSE_GSMCTC_B02_BOTTOM_SEPARATOR

#
# [Bloco 03: Corpo da mensagem]
unset MSE_GSMCTC_B03_TOP_SEPARATOR
unset MSE_GSMCTC_B03_FIRST_LINE_BULLET
unset MSE_GSMCTC_B03_ANOTHER_LINES_BULLET
unset MSE_GSMCTC_B03_FIRST_LINE_TEXT
unset MSE_GSMCTC_B03_ANOTHER_LINES_TEXT
unset MSE_GSMCTC_B03_BOTTOM_SEPARATOR

declare -gA MSE_GSMCTC_B03_TOP_SEPARATOR
declare -gA MSE_GSMCTC_B03_FIRST_LINE_BULLET
declare -gA MSE_GSMCTC_B03_ANOTHER_LINES_BULLET
declare -gA MSE_GSMCTC_B03_FIRST_LINE_TEXT
declare -gA MSE_GSMCTC_B03_ANOTHER_LINES_TEXT
declare -gA MSE_GSMCTC_B03_BOTTOM_SEPARATOR

#
# [Bloco 04: Separador inferior da mensagem]
unset MSE_GSMCTC_B04_BOTTOM_SEPARATOR
declare -gA MSE_GSMCTC_B04_BOTTOM_SEPARATOR



#
# Reseta todos os arrays associativos que estão correlacionados
# as cores usadas nas barras de progresso
# MSE_GSPBCTC   : MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG_THEME_COLOR

#
# [Bloco 01: Barra de progresso]
unset MSE_GSPBCTC_B01_CHAR
unset MSE_GSPBCTC_B01_DELIMITERS

declare -gA MSE_GSPBCTC_B01_CHAR
declare -gA MSE_GSPBCTC_B01_DELIMITERS

#
# [Bloco 02: Área informativa]
unset MSE_GSPBCTC_B02_DATA
unset MSE_GSPBCTC_B02_DELIMITERS

declare -gA MSE_GSPBCTC_B02_DATA
declare -gA MSE_GSPBCTC_B02_DELIMITERS





#
# Carrega cada um dos arraya associativos com as informações
# das cores
mseTmpMessageType
for mseTmpMessageType in "${!MSE_GLOBAL_MAIN_THEME_COLORS[@]}"; do
  #
  # [Bloco 01: Separador superior da mensagem]
  MSE_GSMCTC_B01_TOP_SEPARATOR[$mseTmpMessageType]=${MSE_GLOBAL_MAIN_THEME_COLORS[$mseTmpMessageType]}

  #
  # [Bloco 02: Título]
  MSE_GSMCTC_B02_TOP_SEPARATOR[$mseTmpMessageType]=${MSE_GLOBAL_MAIN_THEME_COLORS[$mseTmpMessageType]}
  MSE_GSMCTC_B02_BULLET[$mseTmpMessageType]=${MSE_GLOBAL_MAIN_THEME_COLORS[$mseTmpMessageType]}
  MSE_GSMCTC_B02_TEXT[$mseTmpMessageType]=${MSE_GLOBAL_MAIN_THEME_COLORS[$mseTmpMessageType]}
  MSE_GSMCTC_B02_BOTTOM_SEPARATOR[$mseTmpMessageType]=${MSE_GLOBAL_MAIN_THEME_COLORS[$mseTmpMessageType]}

  #
  # [Bloco 03: Corpo da mensagem]
  MSE_GSMCTC_B03_TOP_SEPARATOR[$mseTmpMessageType]=${MSE_GLOBAL_MAIN_THEME_COLORS[$mseTmpMessageType]}
  MSE_GSMCTC_B03_FIRST_LINE_BULLET[$mseTmpMessageType]=${MSE_GLOBAL_MAIN_THEME_COLORS[$mseTmpMessageType]}
  MSE_GSMCTC_B03_ANOTHER_LINES_BULLET[$mseTmpMessageType]=${MSE_GLOBAL_MAIN_THEME_COLORS[$mseTmpMessageType]}
  MSE_GSMCTC_B03_FIRST_LINE_TEXT[$mseTmpMessageType]=${MSE_GLOBAL_MAIN_THEME_COLORS[$mseTmpMessageType]}
  MSE_GSMCTC_B03_ANOTHER_LINES_TEXT[$mseTmpMessageType]=${MSE_GLOBAL_MAIN_THEME_COLORS[$mseTmpMessageType]}
  MSE_GSMCTC_B03_BOTTOM_SEPARATOR[$mseTmpMessageType]=${MSE_GLOBAL_MAIN_THEME_COLORS[$mseTmpMessageType]}

  #
  # [Bloco 04: Separador inferior da mensagem]
  MSE_GSMCTC_B04_BOTTOM_SEPARATOR[$mseTmpMessageType]=${MSE_GLOBAL_MAIN_THEME_COLORS[$mseTmpMessageType]}


  #
  # Barra de progresso
  # [Bloco 01: Barra de progresso]
  MSE_GSPBCTC_B01_CHAR[$mseTmpMessageType]=${MSE_GLOBAL_MAIN_THEME_COLORS[$mseTmpMessageType]}
  MSE_GSPBCTC_B01_DELIMITERS[$mseTmpMessageType]=${MSE_GLOBAL_MAIN_THEME_COLORS[$mseTmpMessageType]}

  #
  # [Bloco 02: Área informativa]
  MSE_GSPBCTC_B02_DATA[$mseTmpMessageType]=${MSE_GLOBAL_MAIN_THEME_COLORS[$mseTmpMessageType]}
  MSE_GSPBCTC_B02_DELIMITERS[$mseTmpMessageType]=${MSE_GLOBAL_MAIN_THEME_COLORS[$mseTmpMessageType]}
done
unset mseTmpMessageType









#
# Define as cores usadas para o comando "man"
unset MSE_GLOBAL_THEME_CMD_MAN_COLORS
declare -gA MSE_GLOBAL_THEME_CMD_MAN_COLORS

MSE_GLOBAL_THEME_CMD_MAN_COLORS["at"]=$(mse_font_createStyle "4" "BOLD,DARK" "NONE" "BLUE" "1")
MSE_GLOBAL_THEME_CMD_MAN_COLORS["tagName"]=$(mse_font_createStyle "4" "BOLD,DARK" "NONE" "BLUE" "1")
MSE_GLOBAL_THEME_CMD_MAN_COLORS["tagCommom"]=$(mse_font_createStyle "4" "BOLD,DARK" "NONE" "LCYAN" "1")
MSE_GLOBAL_THEME_CMD_MAN_COLORS["param"]=$(mse_font_createStyle "8" "BOLD" "NONE" "250" "1")





#
# Define as cores usadas para o comando "showMetaData"
unset MSE_GLOBAL_THEME_CMD_SHOTMETADATA_COLORS
declare -gA MSE_GLOBAL_THEME_CMD_SHOTMETADATA_COLORS

MSE_GLOBAL_THEME_CMD_SHOTMETADATA_COLORS["Module"]=$(mse_font_createStyle "4" "BOLD" "NONE" "BLUE" "1")
MSE_GLOBAL_THEME_CMD_SHOTMETADATA_COLORS["SubModule"]=$(mse_font_createStyle "4" "BOLD" "NONE" "BLUE" "1")
MSE_GLOBAL_THEME_CMD_SHOTMETADATA_COLORS["Functions"]=$(mse_font_createStyle "4" "" "NONE" "LBLACK" "1")

MSE_GLOBAL_THEME_CMD_SHOTMETADATA_COLORS["Separator"]=$(mse_font_createStyle "4" "" "NONE" "WHITE" "1")
MSE_GLOBAL_THEME_CMD_SHOTMETADATA_COLORS["SeparatorBar"]=$(mse_font_createStyle "4" "DARK" "NONE" "WHITE" "1")
MSE_GLOBAL_THEME_CMD_SHOTMETADATA_COLORS["SelectedElements"]=$(mse_font_createStyle "4" "" "NONE" "LBLACK" "1")
MSE_GLOBAL_THEME_CMD_SHOTMETADATA_COLORS["TotalElements"]=$(mse_font_createStyle "4" "" "NONE" "LBLACK" "1")