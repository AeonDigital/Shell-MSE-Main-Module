#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Assembles the entire body part of the prompt according to the settings
# defined and the theme used.
#
# @param string $1
# Name of the associative array that brings the settings for the
# presentation of the message.
#
# @param string $2
# Optional.
# Name of an associative array bringing configurations not initially
# foreseen. Used to expand themes.
#
# @return
# Prints the result according to the settings passed.
mse_interface_theme_default_message_create_prompt() {
  declare -n mseTmpThemeArrCreatePrompt="${1}"
  declare -n mseTmpThemePromptConfig="${2}"


  local msePromptExpectedValueType="${mseTmpThemePromptConfig[prompt_expected_value_type]}"
  local msePromptAllowedAssocValues="${mseTmpThemePromptConfig[prompt_allowed_assoc_values]}"


  if [ "${mseTmpThemeArrCreatePrompt[body_show]}" == "1" ] && ([ "${msePromptExpectedValueType}" == "b" ] || [ "${msePromptExpectedValueType}" == "l" ]); then
    unset mseTmpPromptAssocValues
    unset mseTmpPromptBodyLines

    declare -n mseTmpPromptAssocValues="${msePromptAllowedAssocValues}"
    declare -a mseTmpPromptBodyLines=()


    declare -a mseTmpPromptSortedKeys=()
    local mseStrSortKeys=$(mse_array_print_sort "mseTmpPromptAssocValues" "k" "a")
    mse_str_split_inLines "mseTmpPromptSortedKeys" "${mseStrSortKeys}"


    local mseIndex
    local mseKey
    local mseTmpKeyLabels
    local mseTmpOptionLine

    local mseTmpLineLength
    local mseTmpMaxOptionLength=1

    for mseIndex in "${!mseTmpPromptSortedKeys[@]}"; do
      mseKey="${mseTmpPromptSortedKeys[${mseIndex}]}"

      mse_str_convert_toArray "msePromptLabelArrayXARGS" "${mseTmpPromptAssocValues[${mseKey}]}"
      if [ "${#msePromptLabelArrayXARGS[@]}" == "0" ]; then
        msePromptLabelArrayXARGS+=("${mseKey}")
      else
        local tmpLabel
        for i in "${!msePromptLabelArrayXARGS[@]}"; do
          tmpLabel="${msePromptLabelArrayXARGS[$i]}"
          if [[ "${tmpLabel}" == *" "* ]]; then
            msePromptLabelArrayXARGS[$i]="'"${tmpLabel}"'"
          fi
        done
      fi
      mseTmpKeyLabels=$(mse_str_join " / " "msePromptLabelArrayXARGS")

      mseTmpOptionLine="${mseKey} : [${mseTmpKeyLabels}]"
      mseTmpPromptBodyLines+=("${mseTmpOptionLine}")
      mseTmpLineLength="${#mseTmpOptionLine}"

      if [ "${mseTmpLineLength}" -gt "${mseTmpMaxOptionLength}" ]; then
        mseTmpMaxOptionLength="${mseTmpLineLength}"
      fi
    done




    local mseMaxOptionsPerLine
    local mseTmpOptionPadLength=0
    local mseTmpOptionPadString=""
    ((mseMaxOptionsPerLine = 120 / mseTmpMaxOptionLength))

    unset mseTmpBigLine
    declare -a mseTmpBigLine=()
    declare -n mseTmpPromptBodyLinesArray="${mseTmpThemeArrCreatePrompt[body_lines]}"

    for mseTmpOptionLine in "${mseTmpPromptBodyLines[@]}"; do
      mseTmpLineLength="${#mseTmpOptionLine}"
      ((mseTmpOptionPadLength = mseTmpMaxOptionLength - mseTmpLineLength))


      mseTmpOptionPadString=$(mse_str_pad "" " " "${mseTmpOptionPadLength}" "l")
      mseTmpBigLine+=("${mseTmpOptionLine}${mseTmpOptionPadString}")

      local mseMod=$((${#mseTmpBigLine[@]} % ${mseMaxOptionsPerLine})) || true
      if [ "${mseMod}" == "0" ]; then
        mseTmpPromptBodyLinesArray+=("$(mse_str_join "  |  " "mseTmpBigLine")")

        unset mseTmpBigLine
        declare -a mseTmpBigLine=()
      fi
    done


    if [ "${#mseTmpBigLine[@]}" -gt "0" ]; then
      mseTmpPromptBodyLinesArray+=("$(mse_str_join "  |  " "mseTmpBigLine")")
    fi


    mseTmpPromptBodyLinesArray+=("")
  else
    mseTmpThemeArrCreatePrompt[body_lines]=""
  fi
}