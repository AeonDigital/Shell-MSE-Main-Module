#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Normaliza o nome da seção passado.
#
# @param string $1
# Nome da seção que será normalizado.
#
# @return string
# Remove os '#' do início da string.
# Remove glifos de caracteres acentuados.
# Remove espaços substituindo-os por '_'.
mse_man_normalize_section_name() {
  local str="${1}"
  str="${str##*# }"
  str=$(mse_str_remove_glyphs "${str,,}")
  str=$(mse_str_trim "${str}")
  str="${str// /_}"

  echo -n "${str}"
}