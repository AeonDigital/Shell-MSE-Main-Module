#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]



mse_man() {
  local mseReturn="0"
  local mseMessage=""

  local mseTarget="${1}"
  local msePathToFileManual=""


  if [ -f "${mseTarget}" ]; then
    if [ "${mseTarget##*.}" != "md" ]; then
      mseMessage="The indicated file does not have the \".md\" extension."
    else
      msePathToFileManual="${mseTarget}"
    fi
  else
    if [ "${MSE_GLOBAL_FUNCTIONS_TO_MANUALS[$mseTarget]}" == "" ]; then
      mseMessage="The name of function \"${mseTarget}\" does not match any manual."
    else
      msePathToFileManual="${MSE_GLOBAL_FUNCTIONS_TO_MANUALS[$mseTarget]}"
    fi
  fi


  if [ "${msePathToFileManual}" != "" ]; then
    unset mseAssocCompiledMan
    declare -A mseAssocCompiledMan
    unset mseArrCompileManOrder
    declare -a mseArrCompileManOrder=()


    local msePathToCompiledFileManual="${msePathToFileManual/\.md/\.cman}"
    if [ ! -f "${msePathToCompiledFileManual}" ]; then
      mse_man_write_compiled_data "${msePathToFileManual}" "mseAssocCompiledMan" "mseArrCompileManOrder" "${msePathToCompiledFileManual}"
    else
      mse_man_read_compiled_data "${msePathToCompiledFileManual}" "mseAssocCompiledMan" "mseArrCompileManOrder"
    fi


    declare -a mseManualRawSections=()
    mse_man_process_show_parse_rules "mseManualRawSections" "${2}"

    declare -a mseManualShowTargetSections=()
    mse_man_process_show_raw_rules "mseManualRawSections" "mseArrCompileManOrder" "mseManualShowTargetSections"

    mse_man_show "mseManualShowTargetSections" "mseAssocCompiledMan"
  fi



  if [ "${mseMessage}" != "" ]; then
    echo -e "${mseMessage}"
  fi

  return "${mseReturn}"
}