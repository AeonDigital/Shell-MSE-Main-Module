#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_prepare_file_read() {
  mseLastFunctionVariablesReset

  declare -n mseArrAssoc="${1}"

  local mseKey=""
  for mseKey in "${!mseArrAssoc[@]}"; do
    unset mseArrAssoc["${mseKey}"]
  done

  mseArrAssoc["block_start_check"]=""
  mseArrAssoc["block_start_check_args"]=""
  mseArrAssoc["block_start_check_args_sep"]=""
  mseArrAssoc["block_start_get_first_line"]=""

  mseArrAssoc["block_end_check"]=""
  mseArrAssoc["block_end_check_args"]=""
  mseArrAssoc["block_end_check_args_sep"]=""
  mseArrAssoc["block_end_get_last_line"]=""

  mseArrAssoc["block_check_invert"]=""


  mseArrAssoc["line_check"]=""
  mseArrAssoc["line_check_args"]=""
  mseArrAssoc["line_check_args_sep"]=""
  mseArrAssoc["line_check_invert"]=""
  mseArrAssoc["line_check_has_linenumber"]=""


  mseArrAssoc["line_transform"]=""
  mseArrAssoc["line_transform_args"]=""
  mseArrAssoc["line_transform_args_sep"]=""
  mseArrAssoc["line_transform_has_linenumber"]=""


  mseArrAssoc["line_hide_empty"]=""
  mseArrAssoc["line_show_number"]=""



  #
  # Bloco 01: Controle em nível de bloco
  if [ "${2}" != "" ]; then
    mseArrAssoc["block_start_check"]="${2}"
    mseArrAssoc["block_start_check_args"]="${3}"
    mseArrAssoc["block_start_check_args_sep"]="${4}"
    mseArrAssoc["block_start_get_first_line"]="${5}"

    if [ "${5}" != "0" ] && [ "${5}" != "1" ]; then
      mseArrAssoc["block_start_get_first_line"]="0"
    fi
  fi

  if [ "${6}" != "" ]; then
    mseArrAssoc["block_end_check"]="${6}"
    mseArrAssoc["block_end_check_args"]="${7}"
    mseArrAssoc["block_end_check_args_sep"]="${8}"
    mseArrAssoc["block_end_get_last_line"]="${9}"

    if [ "${9}" != "0" ] && [ "${9}" != "1" ]; then
      mseArrAssoc["block_end_get_last_line"]="0"
    fi
  fi

  if [ "${2}" != "" ] || [ "${6}" != "" ]; then
    mseArrAssoc["block_check_invert"]="${10}"

    if [ "${10}" != "0" ] && [ "${10}" != "1" ]; then
      mseArrAssoc["block_check_invert"]="0"
    fi
  fi



  #
  # Bloco 02: Controle em nível de linha
  if [ "${11}" != "" ]; then
    mseArrAssoc["line_check"]="${11}"
    mseArrAssoc["line_check_args"]="${12}"
    mseArrAssoc["line_check_args_sep"]="${13}"
    mseArrAssoc["line_check_invert"]="${14}"
    mseArrAssoc["line_check_has_linenumber"]="${15}"

    if [ "${14}" != "0" ] && [ "${14}" != "1" ]; then
      mseArrAssoc["line_check_invert"]="0"
    fi

    if [ "${15}" != "0" ] && [ "${15}" != "1" ]; then
      mseArrAssoc["line_check_has_linenumber"]="0"
    fi
  fi



  #
  # Bloco 03: Controles de transformação
  if [ "${16}" != "" ]; then
    mseArrAssoc["line_transform"]="${16}"
    mseArrAssoc["line_transform_args"]="${17}"
    mseArrAssoc["line_transform_args_sep"]="${18}"
    mseArrAssoc["line_transform_has_linenumber"]="${19}"

    if [ "${19}" != "0" ] && [ "${19}" != "1" ]; then
      mseArrAssoc["line_transform_has_linenumber"]="0"
    fi
  fi



  #
  # Bloco 04: Outras configurações
  mseArrAssoc["line_hide_empty"]="${20}"
  if [ "${20}" != "0" ] && [ "${20}" != "1" ]; then
    mseArrAssoc["line_hide_empty"]="0"
  fi

  mseArrAssoc["line_show_number"]="${21}"
  if [ "${21}" != "0" ] && [ "${21}" != "1" ]; then
    mseArrAssoc["line_show_number"]="0"
  fi



  return ${MSE_LAST_FUNCTION_ERR_CODE}
}