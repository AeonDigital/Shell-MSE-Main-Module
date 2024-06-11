#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Carrega meta informações para o correto funcionamento deste `theme`.
#
# @return void
mse_manual_theme_default_set_colors() {
  if [ -z "${MSE_MANUAL_THEME_COLORS[mse_manual_theme_default]+x}" ]; then
    local msePrefix="mand"

    declare -A mseTmpManual

    mseTmpManual["hash"]=$(mse_font_create_style "4" "BOLD" "NONE" "DBLUE" "0")
    mseTmpManual["title"]=$(mse_font_create_style "4" "BOLD" "NONE" "DBLUE" "0")
    mseTmpManual["text"]=$(mse_font_create_style "4" "NONE" "NONE" "LBLACK" "0")
    mseTmpManual["emphasis"]=$(mse_font_create_style "4" "ITALIC" "NONE" "WHITE" "0")
    mseTmpManual["strong"]=$(mse_font_create_style "4" "BOLD" "NONE" "WHITE" "0")
    mseTmpManual["highlight"]=$(mse_font_create_style "4" "UNDERLINE" "NONE" "LBLACK" "0")
    mseTmpManual["block_delimiter"]=$(mse_font_create_style "4" "NONE" "WHITE" "LBLACK" "0")
    mseTmpManual["block_text"]=$(mse_font_create_style "4" "BOLD" "NONE" "LBLACK" "0")

    mseTmpManual["param_type"]=$(mse_font_create_style "4" "BOLD" "NONE" "LBLACK" "0")
    mseTmpManual["param_name"]=$(mse_font_create_style "4" "BOLD" "NONE" "LBLACK" "0")
    mseTmpManual["param_prop_name"]=$(mse_font_create_style "4" "BOLD" "NONE" "LBLACK" "0")
    mseTmpManual["param_prop_sep"]=$(mse_font_create_style "4" "BOLD" "NONE" "LBLACK" "0")
    mseTmpManual["param_prop_value"]=$(mse_font_create_style "4" "BOLD" "NONE" "LBLACK" "0")
    mseTmpManual["param_prop_value_aka"]=$(mse_font_create_style "4" "BOLD" "NONE" "LBLACK" "0")


    local mseTmpkey=""
    local mseTmpColorId=""
    for mseTmpkey in "${!mseTmpManual[@]}"; do
      mseTmpColorId="${msePrefix}_${mseTmpkey}"
      MSE_MANUAL_THEME_COLORS["${mseTmpColorId}"]="${mseTmpManual[${mseTmpkey}]}"
    done
  fi
}