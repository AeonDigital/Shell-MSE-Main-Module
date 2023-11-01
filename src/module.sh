#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# This file is responsible for initiating constants, variables and global
# functions for the operation of the module as a whole.


# CONSTANTS

# [null] MSE_NULL
# Used to represent a null value.
# Value = <<<\0null>>>
# Check = [[ "${Value}" == "${MSE_NULL}" ]] && echo "yes" || echo "no";
if [ -z ${MSE_NULL+x} ]; then
  declare -gr MSE_NULL="<<<\0null>>>"
fi


# [undefined] MSE_UNDEF
# Used to represent a undefined value.
# Value = <<<\0undef>>>
# Check = [[ "${Value}" == "${MSE_UNDEF}" ]] && echo "yes" || echo "no";
if [ -z ${MSE_UNDEF+x} ]; then
  declare -gr MSE_UNDEF="<<<\0undef>>>"
fi


# [undefined] MSE_ERROR
# Used to override a value that is considered invalid for a property or function
# return.
# Value = <<<\0error>>>
# Check = [[ "${Value}" == "${MSE_ERROR}" ]] && echo "yes" || echo "no";
if [ -z ${MSE_ERROR+x} ]; then
  declare -gr MSE_ERROR="<<<\0error>>>"
fi