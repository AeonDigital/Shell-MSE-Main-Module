#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


# MODULE CONSTANTS


#
# [string] MSE_GLOBAL_MAIN_PATH
# Stores the main path where the project is installed.
if [ -z ${MSE_GLOBAL_MAIN_PATH+x} ]; then
  declare -gr MSE_GLOBAL_MAIN_PATH=$(spath=$(getRealPathToCurrentDirectory); echo "${spath%/*}")
fi

#
# [string] MSE_GLOBAL_UTEST_MAIN_PATH
# stores the main path to the root directory of the unit test module.
if [ -z ${MSE_GLOBAL_UTEST_MAIN_PATH+x} ]; then
  declare -gr MSE_GLOBAL_UTEST_MAIN_PATH="${MSE_GLOBAL_MAIN_PATH}/Shell-MSE-UnitTest"
fi

#
# [bool] MSE_GLOBAL_IS_TO_ACTIVATE
# Indicates whether MSE modules should be started.
#
# This constant will have its value set to readonly as soon as it is used by
# the initializer.
if [ -z ${MSE_GLOBAL_IS_TO_ACTIVATE+x} ]; then
  declare -g MSE_GLOBAL_IS_TO_ACTIVATE="1"
fi

#
# [bool] MSE_GLOBAL_IS_LOADED
# Indicates when all "myShellEnv" modules are loaded.
#
# This constant will have its value set to readonly as soon as it is used by
# the initializer.
if [ -z ${MSE_GLOBAL_IS_LOADED+x} ]; then
  declare -g MSE_GLOBAL_IS_LOADED="0"
fi

#
# [string] MSE_GLOBAL_MODULES_USE_LOCALE
# Indicates the default locale to be used by modules.
# By default, it will use "en-us"
#
# This constant will have its value set to readonly as soon as it is used by
# the initializer.
if [ -z ${MSE_GLOBAL_MODULES_USE_LOCALE+x} ]; then
  declare -g MSE_GLOBAL_MODULES_USE_LOCALE="en-us"
fi



#
# [null] MSE_NULL
# Used to represent a null value.
# Value = <<<\0null>>>
# Check = [[ "${Value}" == "${MSE_NULL}" ]] && echo "yes" || echo "no";
if [ -z ${MSE_NULL+x} ]; then
  declare -gr MSE_NULL="<<<\0null>>>"
fi

#
# [undefined] MSE_UNDEF
# Used to represent a undefined value.
# Value = <<<\0undef>>>
# Check = [[ "${Value}" == "${MSE_UNDEF}" ]] && echo "yes" || echo "no";
if [ -z ${MSE_UNDEF+x} ]; then
  declare -gr MSE_UNDEF="<<<\0undef>>>"
fi

#
# [undefined] MSE_ERROR
# Used to override a value that is considered invalid for a property or function
# return.
# Value = <<<\0error>>>
# Check = [[ "${Value}" == "${MSE_ERROR}" ]] && echo "yes" || echo "no";
if [ -z ${MSE_ERROR+x} ]; then
  declare -gr MSE_ERROR="<<<\0error>>>"
fi