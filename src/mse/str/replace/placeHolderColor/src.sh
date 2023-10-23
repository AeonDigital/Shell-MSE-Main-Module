#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_str_replace_placeHolderColor() {
  local mseReturn
  local msePair="$#"
  ((msePair=msePair-1))

  if [ "$#" -ge "4" ] && [ $((msePair % 3)) == "0" ]; then
    local mseString
    local msePHName
    local msePHValue
    local msePHColor

    if [ "$#" == "4" ]; then
      mseString="${1}"
      msePHName="\[\[${2}\]\]"
      msePHValue="${4}${3}\e[0m"
      mseReturn="${mseString//${msePHName}/${msePHValue}}"
    else
      local i
      local v
      local c

      local mseTmpParametersArray=("$@")
      mseTmpParametersArray=("${mseTmpParametersArray[@]:1}")

      local mseTotalParans="${#mseTmpParametersArray[@]}"
      mseReturn="${1}"

      for ((i=0; i<mseTotalParans; i=i+3)); do
        ((v=i+1))
        ((c=i+2))
        if [ "${v}" -lt "${mseTotalParans}" ]; then
          msePHName="${mseTmpParametersArray[$i]}"
          msePHValue="${mseTmpParametersArray[$v]}"
          msePHColor="${mseTmpParametersArray[$c]}"
          mseReturn=$(mse_str_replace_placeHolderColor "${mseReturn}" "${msePHName}" "${msePHValue}" "${msePHColor}")
        fi
      done
    fi
  fi

  printf "%s" "${mseReturn}"
}