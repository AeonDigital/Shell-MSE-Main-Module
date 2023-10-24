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






# FUNCTIONS

#
# Returns the default value to be used according to the rules defined
# in the arguments.
#
# @param string $1
# Current value.
#
# @param string $2
# Value to be returned if current value is empty or invalid.
#
# @param string $3
# If set, it should contain a string containing all values accepted as valid.
# Separate the values with space characters.
# If a value contains a space character, use quotation marks to define it.
#
# @return string
# Valid value to use.
mseGetDefault() {
  local mseCurrentValue="${1}"
  local mseDefaultValueIfEmptyOrInvalid="${2}"

  declare -a mseValidOptions=()
  IFS=$'\n'
  mseValidOptions=($(xargs -n1 <<< "${3}"))
  IFS=$' \t\n'

  local mseReturn="${mseDefaultValueIfEmptyOrInvalid}"
  if [ "${#mseValidOptions[@]}" == "0" ]; then
    if [ "${mseCurrentValue}" != "" ]; then
      mseReturn="${mseCurrentValue}"
    fi
  else
    for value in "${mseValidOptions[@]}"; do
      if [ "${mseCurrentValue}" == "${value}" ]; then
        mseReturn="${mseCurrentValue}"
        break
      fi
    done
  fi

  printf "%s" "${mseReturn}"
}