#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Array associativo que armazena as definições de cores a serem usadas
# pelo tema atualmente ativo.
unset MSE_GLOBAL_MAIN_THEME_COLORS
declare -gA MSE_GLOBAL_MAIN_THEME_COLORS









# #
# # Barra de progresso
# #
# # Utilize as entradas abaixo para configurar a aparencia das barras de
# # progresso.
# #
# # [###############               ] ( 50%)
# # b01_char      : #
# # b01_delimiter : []
# # b01_data      : 50%
# # b02_delimiter : ()
# MSE_GLOBAL_MAIN_THEME_COLORS["b01_char"]=$(mse_font_createStyle "4" "BOLD" "NONE" "LBLUE" "1")
# MSE_GLOBAL_MAIN_THEME_COLORS["b01_delimiter"]=$(mse_font_createStyle "4" "DARK" "NONE" "WHITE" "1")

# MSE_GLOBAL_MAIN_THEME_COLORS["b01_data"]=$(mse_font_createStyle "4" "" "NONE" "WHITE" "1")
# MSE_GLOBAL_MAIN_THEME_COLORS["b02_delimiter"]=$(mse_font_createStyle "4" "BOLD" "NONE" "LBLACK" "1")





# #
# # Reseta todos os arrays associativos que estão correlacionados
# # as cores usadas nas mensagens
# # MSE_GSMCTC = MSE_GLOBAL_SHOW_MESSAGE_CONFIG_THEME_COLOR

# #
# # [Bloco 01: Separador superior da mensagem]
# unset MSE_GSMCTC_B01_TOP_SEPARATOR
# declare -gA MSE_GSMCTC_B01_TOP_SEPARATOR

# #
# # [Bloco 02: Título]
# unset MSE_GSMCTC_B02_TOP_SEPARATOR
# unset MSE_GSMCTC_B02_BULLET
# unset MSE_GSMCTC_B02_TEXT
# unset MSE_GSMCTC_B02_BOTTOM_SEPARATOR

# declare -gA MSE_GSMCTC_B02_TOP_SEPARATOR
# declare -gA MSE_GSMCTC_B02_BULLET
# declare -gA MSE_GSMCTC_B02_TEXT
# declare -gA MSE_GSMCTC_B02_BOTTOM_SEPARATOR

# #
# # [Bloco 03: Corpo da mensagem]
# unset MSE_GSMCTC_B03_TOP_SEPARATOR
# unset MSE_GSMCTC_B03_FIRST_LINE_BULLET
# unset MSE_GSMCTC_B03_ANOTHER_LINES_BULLET
# unset MSE_GSMCTC_B03_FIRST_LINE_TEXT
# unset MSE_GSMCTC_B03_ANOTHER_LINES_TEXT
# unset MSE_GSMCTC_B03_BOTTOM_SEPARATOR

# declare -gA MSE_GSMCTC_B03_TOP_SEPARATOR
# declare -gA MSE_GSMCTC_B03_FIRST_LINE_BULLET
# declare -gA MSE_GSMCTC_B03_ANOTHER_LINES_BULLET
# declare -gA MSE_GSMCTC_B03_FIRST_LINE_TEXT
# declare -gA MSE_GSMCTC_B03_ANOTHER_LINES_TEXT
# declare -gA MSE_GSMCTC_B03_BOTTOM_SEPARATOR

# #
# # [Bloco 04: Separador inferior da mensagem]
# unset MSE_GSMCTC_B04_BOTTOM_SEPARATOR
# declare -gA MSE_GSMCTC_B04_BOTTOM_SEPARATOR



# #
# # Reseta todos os arrays associativos que estão correlacionados
# # as cores usadas nas barras de progresso
# # MSE_GSPBCTC   : MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG_THEME_COLOR

# #
# # [Bloco 01: Barra de progresso]
# unset MSE_GSPBCTC_B01_CHAR
# unset MSE_GSPBCTC_B01_DELIMITERS

# declare -gA MSE_GSPBCTC_B01_CHAR
# declare -gA MSE_GSPBCTC_B01_DELIMITERS

# #
# # [Bloco 02: Área informativa]
# unset MSE_GSPBCTC_B02_DATA
# unset MSE_GSPBCTC_B02_DELIMITERS

# declare -gA MSE_GSPBCTC_B02_DATA
# declare -gA MSE_GSPBCTC_B02_DELIMITERS





# #
# # Carrega cada um dos arraya associativos com as informações
# # das cores
# mseTmpMessageType
# for mseTmpMessageType in "${!MSE_GLOBAL_MAIN_THEME_COLORS[@]}"; do
#   #
#   # [Bloco 01: Separador superior da mensagem]
#   MSE_GSMCTC_B01_TOP_SEPARATOR[$mseTmpMessageType]=${MSE_GLOBAL_MAIN_THEME_COLORS[$mseTmpMessageType]}

#   #
#   # [Bloco 02: Título]
#   MSE_GSMCTC_B02_TOP_SEPARATOR[$mseTmpMessageType]=${MSE_GLOBAL_MAIN_THEME_COLORS[$mseTmpMessageType]}
#   MSE_GSMCTC_B02_BULLET[$mseTmpMessageType]=${MSE_GLOBAL_MAIN_THEME_COLORS[$mseTmpMessageType]}
#   MSE_GSMCTC_B02_TEXT[$mseTmpMessageType]=${MSE_GLOBAL_MAIN_THEME_COLORS[$mseTmpMessageType]}
#   MSE_GSMCTC_B02_BOTTOM_SEPARATOR[$mseTmpMessageType]=${MSE_GLOBAL_MAIN_THEME_COLORS[$mseTmpMessageType]}

#   #
#   # [Bloco 03: Corpo da mensagem]
#   MSE_GSMCTC_B03_TOP_SEPARATOR[$mseTmpMessageType]=${MSE_GLOBAL_MAIN_THEME_COLORS[$mseTmpMessageType]}
#   MSE_GSMCTC_B03_FIRST_LINE_BULLET[$mseTmpMessageType]=${MSE_GLOBAL_MAIN_THEME_COLORS[$mseTmpMessageType]}
#   MSE_GSMCTC_B03_ANOTHER_LINES_BULLET[$mseTmpMessageType]=${MSE_GLOBAL_MAIN_THEME_COLORS[$mseTmpMessageType]}
#   MSE_GSMCTC_B03_FIRST_LINE_TEXT[$mseTmpMessageType]=${MSE_GLOBAL_MAIN_THEME_COLORS[$mseTmpMessageType]}
#   MSE_GSMCTC_B03_ANOTHER_LINES_TEXT[$mseTmpMessageType]=${MSE_GLOBAL_MAIN_THEME_COLORS[$mseTmpMessageType]}
#   MSE_GSMCTC_B03_BOTTOM_SEPARATOR[$mseTmpMessageType]=${MSE_GLOBAL_MAIN_THEME_COLORS[$mseTmpMessageType]}

#   #
#   # [Bloco 04: Separador inferior da mensagem]
#   MSE_GSMCTC_B04_BOTTOM_SEPARATOR[$mseTmpMessageType]=${MSE_GLOBAL_MAIN_THEME_COLORS[$mseTmpMessageType]}


#   #
#   # Barra de progresso
#   # [Bloco 01: Barra de progresso]
#   MSE_GSPBCTC_B01_CHAR[$mseTmpMessageType]=${MSE_GLOBAL_MAIN_THEME_COLORS[$mseTmpMessageType]}
#   MSE_GSPBCTC_B01_DELIMITERS[$mseTmpMessageType]=${MSE_GLOBAL_MAIN_THEME_COLORS[$mseTmpMessageType]}

#   #
#   # [Bloco 02: Área informativa]
#   MSE_GSPBCTC_B02_DATA[$mseTmpMessageType]=${MSE_GLOBAL_MAIN_THEME_COLORS[$mseTmpMessageType]}
#   MSE_GSPBCTC_B02_DELIMITERS[$mseTmpMessageType]=${MSE_GLOBAL_MAIN_THEME_COLORS[$mseTmpMessageType]}
# done
# unset mseTmpMessageType









# #
# # Define as cores usadas para o comando "man"
# unset MSE_GLOBAL_THEME_CMD_MAN_COLORS
# declare -gA MSE_GLOBAL_THEME_CMD_MAN_COLORS

# MSE_GLOBAL_THEME_CMD_MAN_COLORS["at"]=$(mse_font_createStyle "4" "BOLD,DARK" "NONE" "BLUE" "1")
# MSE_GLOBAL_THEME_CMD_MAN_COLORS["tagName"]=$(mse_font_createStyle "4" "BOLD,DARK" "NONE" "BLUE" "1")
# MSE_GLOBAL_THEME_CMD_MAN_COLORS["tagCommom"]=$(mse_font_createStyle "4" "BOLD,DARK" "NONE" "LCYAN" "1")
# MSE_GLOBAL_THEME_CMD_MAN_COLORS["param"]=$(mse_font_createStyle "8" "BOLD" "NONE" "250" "1")





# #
# # Define as cores usadas para o comando "showMetaData"
# unset MSE_GLOBAL_THEME_CMD_SHOTMETADATA_COLORS
# declare -gA MSE_GLOBAL_THEME_CMD_SHOTMETADATA_COLORS

# MSE_GLOBAL_THEME_CMD_SHOTMETADATA_COLORS["Module"]=$(mse_font_createStyle "4" "BOLD" "NONE" "BLUE" "1")
# MSE_GLOBAL_THEME_CMD_SHOTMETADATA_COLORS["SubModule"]=$(mse_font_createStyle "4" "BOLD" "NONE" "BLUE" "1")
# MSE_GLOBAL_THEME_CMD_SHOTMETADATA_COLORS["Functions"]=$(mse_font_createStyle "4" "" "NONE" "LBLACK" "1")

# MSE_GLOBAL_THEME_CMD_SHOTMETADATA_COLORS["Separator"]=$(mse_font_createStyle "4" "" "NONE" "WHITE" "1")
# MSE_GLOBAL_THEME_CMD_SHOTMETADATA_COLORS["SeparatorBar"]=$(mse_font_createStyle "4" "DARK" "NONE" "WHITE" "1")
# MSE_GLOBAL_THEME_CMD_SHOTMETADATA_COLORS["SelectedElements"]=$(mse_font_createStyle "4" "" "NONE" "LBLACK" "1")
# MSE_GLOBAL_THEME_CMD_SHOTMETADATA_COLORS["TotalElements"]=$(mse_font_createStyle "4" "" "NONE" "LBLACK" "1")
