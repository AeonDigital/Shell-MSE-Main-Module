#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_interface_show_prompt() {
  MSE_PROMPT_RESULT=""

  local mseUsePromptMetaAssoc="${1}"
  local mseUsePromptMetaType="${2}"
  local mseUsePromptTitleString="${3}"
  local mseUsePromptValueType="${4}"
  local mseUsePromptAssocValues="${5}"
  local mseUsePromptCaseSensitive="${6}"



  if [ "${mseUsePromptMetaAssoc}" == "" ] || [[ ! "$(declare -p ${mseUsePromptMetaAssoc} 2> /dev/null)" =~ "declare -A" ]]; then
    mseUsePromptMetaAssoc="MSE_PROMPT_THEME_CONFIG"
  fi



  unset mseAllowedPromptMetaTypes
  declare -a mseAllowedPromptMetaTypes=("n" "fr" "or" "ca" "im")
  if [[ ! "${mseAllowedPromptMetaTypes[*]}" =~ "${mseUsePromptMetaType}" ]]; then
    mseUsePromptMetaType="or"
  fi



  if [ "${mseUsePromptTitleString}" == "" ]; then
    mseUsePromptTitleString="?"
  fi



  case "${mseUsePromptValueType}" in
    bool)
      mseUsePromptAssocValues="lbl_inter_showPrompt_BoolValues"
    ;;

    list)
      if [[ ! "$(declare -p ${mseUsePromptAssocValues} 2> /dev/null)" =~ "declare -A" ]]; then
        mseUsePromptValueType="value"
        mseUsePromptAssocValues=""
      fi
    ;;

    *)
      mseUsePromptValueType="value"
      mseUsePromptAssocValues=""
    ;;
  esac



  if [ "${mseUsePromptCaseSensitive}" == "" ] || ([ "${mseUsePromptCaseSensitive}" != "0" ] && [ "${mseUsePromptCaseSensitive}" != "1" ]); then
    mseUsePromptCaseSensitive="1"
  fi



  local msePromptKey
  local msePromptLabel
  declare -A mseTmpAllowedUserAssocEntries
  if [ "${mseUsePromptAssocValues}" != "" ]; then
    declare -n mseTmpAllowedAssocEntries="${mseUsePromptAssocValues}"

    for msePromptKey in "${!mseTmpAllowedAssocEntries[@]}"; do
      if [ "${mseUsePromptCaseSensitive}" == "1" ]; then
        mseTmpAllowedUserAssocEntries["${msePromptKey}"]="${msePromptKey}"
      else
        mseTmpAllowedUserAssocEntries["${msePromptKey^^}"]="${msePromptKey}"
      fi

      mse_str_split "::" "${mseTmpAllowedAssocEntries[${msePromptKey}]}" "1"
      if [ "${#MSE_LAST_FUNCTION_RETURN[@]}" -gt "0" ]; then
        for msePromptLabel in "${MSE_LAST_FUNCTION_RETURN[@]}"; do
          if [ "${mseUsePromptCaseSensitive}" == "0" ]; then
            mseTmpAllowedUserAssocEntries["${msePromptLabel}"]="${msePromptKey}"
          else
            mseTmpAllowedUserAssocEntries["${msePromptLabel^^}"]="${msePromptKey}"
          fi
        done
      fi

    done
  fi



  unset mseExtraConfigAssocArrayName
  declare -A mseExtraConfigAssocArrayName
  mseExtraConfigAssocArrayName["prompt_expected_value_type"]="${mseUsePromptValueType}"
  mseExtraConfigAssocArrayName["prompt_allowed_assoc_values"]="${mseUsePromptAssocValues}"

  unset mseUsePromptBodyLines
  declare -a mseUsePromptBodyLines=()



  local msePromptUserMessage
  local msePromptUserValue
  local msePromptUserValueCompare
  msePromptUserMessage=$(mse_interface_show_message "${mseUsePromptMetaAssoc}" "${mseUsePromptMetaType}" "prompt" "${mseUsePromptTitleString}" "mseUsePromptBodyLines" "mseExtraConfigAssocArrayName")



  while [ "${MSE_PROMPT_RESULT}" == "" ]; do
    if [ "${msePromptUserValue}" != "" ]; then
      local mseErrMsg=$(mse_str_replace_placeHolder "${lbl_inter_prompt_invalidValue}" "VALUE" "${msePromptUserValue}")
      mse_interface_show_error "ERR::${mseErrMsg}"
    fi

    read -r -p "${msePromptUserMessage}" msePromptUserValue

    msePromptUserValueCompare="${msePromptUserValue}"
    if [ "${mseUsePromptCaseSensitive}" == "0" ]; then
      msePromptUserValueCompare="${msePromptUserValue^^}"
    fi

    if [ "${mseUsePromptValueType}" == "bool" ] || [ "${mseUsePromptValueType}" == "list" ]; then
      for msePromptKey in "${!mseTmpAllowedUserAssocEntries[@]}"; do
        if [ "${msePromptUserValueCompare}" == "${msePromptKey}" ]; then
          MSE_PROMPT_RESULT="${mseTmpAllowedUserAssocEntries[${msePromptKey}]}"
        fi
      done
    else
      MSE_PROMPT_RESULT="${msePromptUserValue}"
    fi
  done
}
