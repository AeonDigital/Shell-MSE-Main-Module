#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_file_convert_toUTF8() {
  local mseReturn="0"

  local mseOriginalFile="${1}"
  local mseConvertedFile="${1}"
  if [ "$#" -ge "2" ] && [ "${2}" != "" ]; then
    mseConvertedFile="${2}"
  fi

  if [ -f "${mseOriginalFile}" ]; then
    local mseOriginalEncoding=$(file -bi "${mseOriginalFile}")
    if [ "${mseOriginalEncoding}" != "" ]; then
      mseOriginalEncoding="${mseOriginalEncoding##*charset=}"
      iconv -f "${mseOriginalEncoding}" -t UTF-8//TRANSLIT "${mseOriginalFile}" -o "${mseConvertedFile}"

      mseReturn="1"
    fi
  fi

  printf "%s" "${mseReturn}"
}