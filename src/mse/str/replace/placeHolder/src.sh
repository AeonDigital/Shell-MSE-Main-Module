#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_str_replace_placeHolder() {
  local mseReturn=""
  local msePair="$#"
  ((msePair=msePair-1))

  if [ "$#" -ge "3" ] && [ $((msePair % 2)) == "0" ]; then
    local mseString
    local msePHName
    local msePHValue


    if [ "$#" == "3" ]; then
      mseString="${1}"
      msePHName="\[\[${2}\]\]"
      msePHValue="${3}"
      mseReturn="${mseString//${msePHName}/${msePHValue}}"
    else
      local i
      local v

      local mseTmpParametersArray=("$@")
      mseTmpParametersArray=("${mseTmpParametersArray[@]:1}")

      local mseTotalParans="${#mseTmpParametersArray[@]}"
      mseReturn="${1}"

      for ((i=0; i<mseTotalParans; i=i+2)); do
        ((v=i+1))
        if [ "${v}" -lt "${mseTotalParans}" ]; then
          msePHName="${mseTmpParametersArray[$i]}"
          msePHValue="${mseTmpParametersArray[$v]}"
          mseReturn=$(mse_str_replace_placeHolder "${mseReturn}" "${msePHName}" "${msePHValue}")
        fi
      done
    fi
  fi

  echo -n "${mseReturn}"
}