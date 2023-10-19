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
  local mseUsePromptIgnoreGlyphs="${7}"



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
    b)
      mseUsePromptAssocValues="lbl_interface_show_prompt_bool_values"
      mseUsePromptCaseSensitive="0"
      mseUsePromptIgnoreGlyphs="1"
    ;;

    l)
      if [[ ! "$(declare -p ${mseUsePromptAssocValues} 2> /dev/null)" =~ "declare -A" ]]; then
        mseUsePromptValueType="v"
        mseUsePromptAssocValues=""
      fi
    ;;

    *)
      mseUsePromptValueType="v"
      mseUsePromptAssocValues=""
    ;;
  esac



  if [ "${mseUsePromptCaseSensitive}" == "" ] || ([ "${mseUsePromptCaseSensitive}" != "0" ] && [ "${mseUsePromptCaseSensitive}" != "1" ]); then
    mseUsePromptCaseSensitive="1"
  fi

  if [ "${mseUsePromptIgnoreGlyphs}" == "" ] || ([ "${mseUsePromptIgnoreGlyphs}" != "0" ] && [ "${mseUsePromptIgnoreGlyphs}" != "1" ]); then
    mseUsePromptIgnoreGlyphs="0"
  fi



  local msePromptKey
  local msePromptLabel
  declare -A mseTmpAllowedUserAssocEntries
  if [ "${mseUsePromptAssocValues}" != "" ]; then
    declare -n mseTmpAllowedAssocEntries="${mseUsePromptAssocValues}"

    for msePromptKey in "${!mseTmpAllowedAssocEntries[@]}"; do
      local mseComparePromptKey="${msePromptKey}"

      if [ "${mseUsePromptCaseSensitive}" == "0" ]; then
        mseComparePromptKey="${mseComparePromptKey^^}"
      fi

      if [ "${mseUsePromptIgnoreGlyphs}" == "1" ]; then
        mseComparePromptKey=$(mse_str_remove_glyphs "${mseComparePromptKey}")
      fi

      mseTmpAllowedUserAssocEntries["${mseComparePromptKey}"]="${msePromptKey}"



      IFS=$'\n'
      msePromptLabelArrayXARGS=($(xargs -n1 <<< "${mseTmpAllowedAssocEntries[${msePromptKey}]}"))
      IFS=$' \t\n'
      if [ "${#msePromptLabelArrayXARGS[@]}" -gt "0" ]; then
        for msePromptLabel in "${msePromptLabelArrayXARGS[@]}"; do
          local mseComparePromptLabel="${msePromptLabel}"

          if [ "${mseUsePromptCaseSensitive}" == "0" ]; then
            mseComparePromptLabel="${mseComparePromptLabel^^}"
          fi

          if [ "${mseUsePromptIgnoreGlyphs}" == "1" ]; then
            mseComparePromptLabel=$(mse_str_remove_glyphs "${mseComparePromptLabel}")
          fi

          mseTmpAllowedUserAssocEntries["${mseComparePromptLabel}"]="${msePromptKey}"
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
      local mseErrMsg=$(mse_str_replace_placeHolder "${lbl_interface_show_prompt_invalid_value}" "VALUE" "${msePromptUserValue}")
      mse_interface_show_error "ERR::${mseErrMsg}"
    fi

    read -r -p "${msePromptUserMessage}" msePromptUserValue
    msePromptUserValueCompare="${msePromptUserValue}"

    if [ "${mseUsePromptCaseSensitive}" == "0" ]; then
      msePromptUserValueCompare="${msePromptUserValueCompare^^}"
    fi

    if [ "${mseUsePromptIgnoreGlyphs}" == "1" ]; then
      msePromptUserValueCompare=$(mse_str_remove_glyphs "${msePromptUserValueCompare}")
    fi


    if [ "${mseUsePromptValueType}" == "b" ] || [ "${mseUsePromptValueType}" == "l" ]; then
      for mseComparePrompt in "${!mseTmpAllowedUserAssocEntries[@]}"; do
        if [ "${msePromptUserValueCompare}" == "${mseComparePrompt}" ]; then
          MSE_PROMPT_RESULT="${mseTmpAllowedUserAssocEntries[${mseComparePrompt}]}"
        fi
      done
    else
      MSE_PROMPT_RESULT="${msePromptUserValue}"
    fi
  done
}