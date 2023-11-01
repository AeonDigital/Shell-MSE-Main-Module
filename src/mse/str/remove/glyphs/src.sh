#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_str_remove_glyphs() {
  echo -ne "${1}" | iconv --from-code="UTF8" --to-code="ASCII//TRANSLIT"
}