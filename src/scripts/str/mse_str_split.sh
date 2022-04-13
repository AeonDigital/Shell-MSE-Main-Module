#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Efetua um split na string passada usando o separador indicado.
# O resultado será o preenchimento do array global
# 'MSE_GLOBAL_MODULE_SPLIT'
#
# @param string $1
# Separador
#
# @param string $2
# String original (que será 'esplitada')
#
# @example
#   mse_str_split '-' "2022-12-22"
#   myArray=("${MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}")
#   =
#   myArray=("2022" "12" "22")
mse_str_split() {
  local mseInt
  unset MSE_GLOBAL_MODULE_SPLIT_RESULT
  declare -ga MSE_GLOBAL_MODULE_SPLIT_RESULT

  readarray -d $1 -t MSE_GLOBAL_MODULE_SPLIT_RESULT <<< "$2"
  mseInt="${#MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}"
  if [ $mseInt -gt 0 ]; then
    #
    # Remove o \n que o 'readarray' adiciona ao último item do array
    ((mseInt=mseInt-1))
    MSE_GLOBAL_MODULE_SPLIT_RESULT[$mseInt]="${MSE_GLOBAL_MODULE_SPLIT_RESULT[$mseInt]%[[:cntrl:]]}"
  fi
}
