#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_file_config_variable_showLine() {
  local mseReturn=""
  local mseShowLineNumber="0"
  if [ "$#" -ge "4" ] && [ "${4}" == "1" ]; then
    mseShowLineNumber="1"
  fi
  local mseRawSection=$(mse_file_config_variable_showAll "${1}" "${2}" "${mseShowLineNumber}")

  if [ "${mseRawSection}" != "" ]; then
    unset mseReadOptionsShowVarLine
    declare -A mseReadOptionsShowVarLine
    mse_prepare_file_read "mseReadOptionsShowVarLine"


    mseReadOptionsShowVarLine["line_check"]="mse_file_read_checkLine_hasVariable"
    mseReadOptionsShowVarLine["line_check_args"]="${3} # ;"
    mseReadOptionsShowVarLine["line_check_args_sep"]=" "
    mseReadOptionsShowVarLine["line_check_invert"]=""
    mseReadOptionsShowVarLine["line_check_has_linenumber"]="${mseShowLineNumber}"

    mseReturn=$(mse_file_read "${mseRawSection}" "mseReadOptionsShowVarLine" "1" "0")
    mseReturn=$(echo -ne "${mseReturn%%[[:cntrl:]]*}")
  fi

  echo -n "${mseReturn}"
}