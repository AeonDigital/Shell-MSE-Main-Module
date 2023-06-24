#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_font_show_fonts() {
  find /usr /etc -name "*.psf*" 2> /dev/null | sort | uniq | less
}