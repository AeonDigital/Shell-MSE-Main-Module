#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_str_remove_glyphs() {
  printf "${1}" | iconv -f 'UTF8' -t 'ASCII//TRANSLIT'
}