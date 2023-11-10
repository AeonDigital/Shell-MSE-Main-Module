#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Redeclara os arrays globais de controle de dados de manuais.
#
# @return void
mse_man_reset_data() {
  unset MSE_MAN_MAIN_SECTIONS_ORDER
  declare -ag MSE_MAN_MAIN_SECTIONS_ORDER=()

  unset MSE_MAN_MAIN_SECTIONS_DATA
  declare -Ag MSE_MAN_MAIN_SECTIONS_DATA



  unset MSE_MAN_SECTION_DATA
  declare -Ag MSE_MAN_SECTION_DATA



  unset MSE_MAN_SECTIONS_ORDER
  declare -ag MSE_MAN_SECTIONS_ORDER=()

  unset MSE_MAN_SECTIONS_DATA
  declare -Ag MSE_MAN_SECTIONS_DATA



  unset MSE_MAN_PARAMETERS_ORDER
  declare -ag MSE_MAN_PARAMETERS_ORDER=()

  unset MSE_MAN_PARAMETERS_DATA
  declare -Ag MSE_MAN_PARAMETERS_DATA
}