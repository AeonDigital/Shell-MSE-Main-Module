Dependencies
============

> [Aeon Digital](http://www.aeondigital.com.br)
>
> rianna@aeondigital.com.br

&nbsp;

Este documento especifica quais são os comandos ``não built-in`` do Bash que 
estão sendo usados no projeto.


## column (bsdmainutils)

  - mse_font_show_attributes
  - mse_font_show_characters
  - mse_font_show_colors


&nbsp;

## find (Find utils)

  - modules.sh
  - mse.sh
  - unittests.sh


&nbsp;

## file (file)

  - mse_file_convert_toUTF8


&nbsp;

## iconv (libc-bin)

  - mse_file_convert_toUTF8
  - mse_font_show_characters
  - mse_str_remove_glyphs


&nbsp;

## printf (Core utils - Shell utilities)

  - mse_font_create_style
  - mse_font_show_characters

  - mse_str_convert_char_toDecimal
  - mse_str_convert_char_toHex
  - mse_str_convert_char_toOctal
  - mse_str_convert_decimal_toChar
  - mse_str_convert_decimal_toHex
  - mse_str_convert_decimal_toOctal
  - mse_str_convert_hex_toChar
  - mse_str_convert_hex_toDecimal
  - mse_str_convert_hex_toOctal
  - mse_str_convert_octal_toChar
  - mse_str_convert_octal_toDecimal
  - mse_str_convert_octal_toHex


&nbsp;

## sed (sed)

  - mse_font_show_characters
  - mse_font_show_colors


&nbsp;

## xxd (xxd)

  - mse_font_show_characters



&nbsp;

# Módulo de testes

Os seguintes comandos são usados:

  - dirname (Core utils - Shell utilities)
  - readlink (Core utils - Shell utilities)
  - sort (Core utils - Text utilities)