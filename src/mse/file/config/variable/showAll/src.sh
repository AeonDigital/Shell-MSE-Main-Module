#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_file_config_variable_showAll() {
  unset mseReadOptionsShowVars
  declare -A mseReadOptionsShowVars
  mse_prepare_file_read "mseReadOptionsShowVars"

  if [ $# -ge 2 ] && [ "${2}" != "" ]; then
    mseReadOptionsShowVars["block_start_check"]="mse_file_read_checkSection_start"
    mseReadOptionsShowVars["block_start_check_args"]="${2}"
    mseReadOptionsShowVars["block_start_check_args_sep"]=","
    mseReadOptionsShowVars["block_start_get_first_line"]="0"

    mseReadOptionsShowVars["block_end_check"]="mse_file_read_checkSection_end"
  fi

  local mseShowLineNumber="0"
  if [ "$#" -ge "3" ] && [ "${3}" == "1" ]; then
    mseShowLineNumber="1"
  fi

  mseReadOptionsShowVars["line_check"]="mse_file_read_checkLine_isVariable"
  mseReadOptionsShowVars["line_check_args"]="# ;"
  mseReadOptionsShowVars["line_check_args_sep"]=" "
  mseReadOptionsShowVars["line_check_invert"]=""
  mseReadOptionsShowVars["line_check_has_linenumber"]="${mseShowLineNumber}"


  mse_file_read "${1}" "mseReadOptionsShowVars" "1" "${mseShowLineNumber}"
}