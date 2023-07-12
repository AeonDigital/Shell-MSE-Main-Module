#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Validates the indicated "meta_format" value.
# If valid, it returns itself.
# If invalid, returns the default value.
#
# @param string $1
# Value being tested.
#
# @return
# Valid "meta_format" value for this theme.
mse_interface_theme_default_message_check_format() {
  declare -a mseAllowedMetaFormat=("custom" "default" "prompt" "status" "title")

  local mseReturn="${1}"
  if [[ ! "${mseAllowedMetaFormat[*]}" =~ "${mseReturn}" ]]; then
    mseReturn="default"
  fi

  printf "${mseReturn}"
}