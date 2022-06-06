#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Inicia uma listagem de todas as fontes que podem ser usadas para o seu
# terminal.
#
# Tratam-se de fontes no formato ".psf".
# Você pode selecionar uma fonte em especial usando o comando:
# setfont [nome-da-fonte]
mse_font_showFonts() {
  find / -name "*.psf*" | sort | uniq | less
}
MSE_GLOBAL_CMD["show fonts"]="mse_font_showFonts"
