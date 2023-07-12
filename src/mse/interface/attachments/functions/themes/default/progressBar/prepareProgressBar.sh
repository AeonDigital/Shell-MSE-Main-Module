#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Finaliza o preparo de um array associativo aplicando as configurações
# próprias deste tema.
#
#
# @param string $1
# Nome do array associativo que traz as configurações para a apresentação da
# barra de progresso.
#
# Para configurar este array associativo use a função "mse_inter_prepareProgressBar".
mse_interface_theme_default_prepareProgressBar() {
  mse_interface_theme_default_set_colors

  declare -n mseTmpArrThemePrepareProgressBar="${1}"
  local msePrefix="${MSE_MESSAGE_THEME_COLORS[${MSE_GLOBAL_THEME_NAME}]}"


  #
  # Padrão para as configurações das mensagens de tipo previsto
  case "${mseTmpArrThemePrepareProgressBar[meta_format]}" in
    custom)

      #
      # Permite uma configuração livre do componente
      mseTmpArrThemePrepareProgressBar["meta_format"]="custom"

    ;;

    default)

      #
      # Configuração geral para uma barra de progresso padrão
      # Imprime a barra e as informações.

      mseTmpArrThemePrepareProgressBar["meta_indent"]="  "


      #
      # Bloco 02: Barra de progresso
      mseTmpArrThemePrepareProgressBar["bar_ini_string"]="[ "
      mseTmpArrThemePrepareProgressBar["bar_end_string"]=" ] "

      mseTmpArrThemePrepareProgressBar["bar_fill_char"]="#"
      mseTmpArrThemePrepareProgressBar["bar_atual_progress"]="0"
      # Controlado internamente
      mseTmpArrThemePrepareProgressBar["bar_atual_bar_length"]="0"

      mseTmpArrThemePrepareProgressBar["bar_color"]="${MSE_MESSAGE_THEME_COLORS[${msePrefix}_progressbar_bar]}"
      mseTmpArrThemePrepareProgressBar["bar_color_alt"]="${MSE_MESSAGE_THEME_COLORS[${msePrefix}_progressbar_bar_alt]}"
      mseTmpArrThemePrepareProgressBar["bar_colorize"]="1"


      #
      # Bloco 03: Informações
      mseTmpArrThemePrepareProgressBar["info_show"]="1"

      mseTmpArrThemePrepareProgressBar["info_ini_string"]="( "
      mseTmpArrThemePrepareProgressBar["info_end_string"]=" )"

      mseTmpArrThemePrepareProgressBar["info_use_percent"]="1"

      mseTmpArrThemePrepareProgressBar["info_color"]="${MSE_MESSAGE_THEME_COLORS[${msePrefix}_progressbar_info]}"
      mseTmpArrThemePrepareProgressBar["info_color_alt"]="${MSE_MESSAGE_THEME_COLORS[${msePrefix}_progressbar_info_alt]}"
      mseTmpArrThemePrepareProgressBar["info_colorize"]="1"

    ;;

    onlybar)

      #
      # Configuração para uma barra de progresso em que apenas a barra
      # é apresentada. A área informativa é omitida

      mseTmpArrThemePrepareProgressBar["meta_indent"]="  "


      #
      # Bloco 02: Barra de progresso
      mseTmpArrThemePrepareProgressBar["bar_ini_string"]="[ "
      mseTmpArrThemePrepareProgressBar["bar_end_string"]=" ] "

      mseTmpArrThemePrepareProgressBar["bar_fill_char"]="#"
      mseTmpArrThemePrepareProgressBar["bar_atual_progress"]="0"
      # Controlado internamente
      mseTmpArrThemePrepareProgressBar["bar_atual_bar_length"]="0"

      mseTmpArrThemePrepareProgressBar["bar_color"]="${MSE_MESSAGE_THEME_COLORS[${msePrefix}_progressbar_bar]}"
      mseTmpArrThemePrepareProgressBar["bar_color_alt"]="${MSE_MESSAGE_THEME_COLORS[${msePrefix}_progressbar_bar_alt]}"
      mseTmpArrThemePrepareProgressBar["bar_colorize"]="1"


      #
      # Bloco 03: Informações
      mseTmpArrThemePrepareProgressBar["info_show"]="0"


    ;;

  esac
}