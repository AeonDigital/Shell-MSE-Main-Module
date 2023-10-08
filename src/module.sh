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






# GLOBAL FUNCTION VARIABLES

# [mixed] MSE_LAST_FUNCTION_RETURN
# Stores the last function return value.
# This value is defined to "MSE_UNDEF" imediatly before the function starts.
unset MSE_LAST_FUNCTION_RETURN
declare -g MSE_LAST_FUNCTION_RETURN="${MSE_UNDEF}"


# [int] MSE_LAST_FUNCTION_ERR_CODE
# Stores the last function error code.
# The "0" value indicates that´s no error ocourred.
# This value is defined to "0" imediatly before the function starts.
unset MSE_LAST_FUNCTION_ERR_CODE
declare -g MSE_LAST_FUNCTION_ERR_CODE="0"


# [string] MSE_LAST_FUNCTION_ERR_MESSAGE
# Stores the last function error message.
# This value is defined to "" imediatly before the function starts.
unset MSE_LAST_FUNCTION_ERR_MESSAGE
declare -g MSE_LAST_FUNCTION_ERR_MESSAGE=""






# FUNCTIONS

#
# Returns global function control variables to their initial states.
mseLastFunctionVariablesReset() {
  MSE_LAST_FUNCTION_RETURN="${MSE_UNDEF}"
  MSE_LAST_FUNCTION_ERR_CODE="0"
  MSE_LAST_FUNCTION_ERR_MESSAGE=""
}
#
# Sets current values for function control global variables
#
# @param string $1
# Define the value of '$MSE_LAST_FUNCTION_RETURN'.
# If omitted will keep the initial value.
#
# @param string $2
# Define the value of '$MSE_LAST_FUNCTION_ERR_CODE'.
# If omitted will keep the initial value.
#
# @param string $3
# Define the value of '$MSE_LAST_FUNCTION_ERR_MESSAGE'.
# If omitted will keep the initial value.
mseLastFunctionVariablesSet() {
  mseLastFunctionVariablesReset

  if [ $# -gt 0 ]; then
    MSE_LAST_FUNCTION_RETURN="${1}"
  fi
  if [ $# -gt 1 ]; then
    MSE_LAST_FUNCTION_ERR_CODE="${2}"
  fi
  if [ $# -gt 2 ]; then
    MSE_LAST_FUNCTION_ERR_MESSAGE="${3}"
  fi
}
#
# It prints on the screen the value of the function control variables
# with their current state.
mseLastFunctionsVariableDump() {
  printf '%s\n' "MSE_LAST_FUNCTION_RETURN       : ${MSE_LAST_FUNCTION_RETURN}"
  printf '%s\n' "MSE_LAST_FUNCTION_ERR_CODE     : ${MSE_LAST_FUNCTION_ERR_CODE}"
  printf '%s\n' "MSE_LAST_FUNCTION_ERR_MESSAGE  : ${MSE_LAST_FUNCTION_ERR_MESSAGE}"
}