#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_file_convert_toUTF8() {
  mseLastFunctionVariablesReset

  local mseReturn=1
  local mseReturnCod=0
  local mseReturnMsg=""

  local mseOriginalFile="${1}"
  local mseConvertedFile="${1}"
  if [ "$#" -ge "2" ] && [ "${2}" != "" ]; then
    mseConvertedFile="${2}"
  fi

  if [ ! -f "${mseOriginalFile}" ]; then
    mseReturnCod="1"
    mseReturnMsg=$(mse_str_replace_placeHolder "${lbl_err_paramA_PointsToNonExistentFile}" "PARAM_A" "file")
  else
    local mseOriginalEncoding=$(file -bi "${mseOriginalFile}")
    if [ "${mseOriginalEncoding}" == "" ]; then
      mseReturnCod="1"
      mseReturnMsg="Could not identify the encoding of the target file."
    else
      mseOriginalEncoding="${mseOriginalEncoding##*charset=}"
      iconv -f "${mseOriginalEncoding}" -t UTF-8//TRANSLIT "${mseOriginalFile}" -o "${mseConvertedFile}"
    fi
  fi

  mseLastFunctionVariablesSet "${mseReturn}" "${mseReturnCod}" "${mseReturnMsg}"
  printf "%s" "${MSE_LAST_FUNCTION_RETURN}"
  return ${MSE_LAST_FUNCTION_ERR_CODE}
}