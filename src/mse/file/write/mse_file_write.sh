#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_file_write() {
  mseLastFunctionVariablesReset

  local mseReturn=1
  local mseReturnCod=0
  local mseReturnMsg=""


  local mseFilePath="$1"
  local mseFileContent=$(< "${mseFilePath}")
  local mseFileLastLine=$(mse_file_countLines "${mseFilePath}")

  declare -n mseContentArrayName
  mseContentArrayName="${2}"

  local mseAction="a"
  local mseTargetFirstLine
  local mseTargetLastLine


  if [ $# -ge 3 ]; then
    case "${3}" in
      prepend | p)
        mseAction="p"
        mseTargetFirstLine=1
        mseTargetLastLine=0
      ;;
      append | a)
        mseAction="a"
        mseTargetFirstLine=${mseFileLastLine}
        mseTargetLastLine=0
      ;;
      replace | r)
        mseAction="r"
        if [ $# -lt 4 ]; then
          mseReturnCod=11
          mseReturnMsg=$(mse_str_replace_placeHolder "${lbl_err_paramA_RequiredFor_A_Operation}" "PARAM_A" "targetLine" "A" "replace")
        fi
      ;;
      delete | d)
        mseAction="d"
        if [ $# -lt 4 ]; then
          mseReturnCod=12
          mseReturnMsg=$(mse_str_replace_placeHolder "${lbl_err_paramA_RequiredFor_A_Operation}" "PARAM_A" "targetLine" "A" "delete")
        fi
      ;;
    esac
  fi





  if [ "${mseReturnCod}" == "0" ] && [ $# -ge 4 ]; then
    local mseTmpReturnMsg=""

    if [[ "${4}" =~ ^[0-9]+$ ]]; then
      mseTargetFirstLine=${4}
      mseTargetLastLine=0
    else
      local mseFnName="-"
      local mseFnResult
      local mseFnResultCountParts

      mseFnResult="${4}"
      if [ "$(type -t ${4})" == "function" ]; then
        mseFnName="fn ${4}"
        mseFnResult=$(${4})
      fi

      mse_str_split " " "${mseFnResult}"
      mseFnResultCountParts="${#MSE_LAST_FUNCTION_RETURN[@]}"

      if [ "${mseFnResultCountParts}" == 0 ] || [ "${mseFnResultCountParts}" -gt 2 ]; then
        mseReturnCod=21
        mseTmpReturnMsg=$(mse_str_replace_placeHolder "${lbl_fw_iv_expectedFunctionNameOrInteger}" "FUNCTION" "${mseFnName}" "RESULT" "${mseFnResult}" "ERR" "1")
      else
        mseTargetFirstLine="${MSE_LAST_FUNCTION_RETURN[0]}"
        mseTargetLastLine=0

        if ! [[ "${mseTargetFirstLine}" =~ ^[0-9]+$ ]]; then
          mseReturnCod=22
          mseTmpReturnMsg=$(mse_str_replace_placeHolder "${lbl_fw_iv_expectedFunctionNameOrInteger}" "FUNCTION" "${mseFnName}" "RESULT" "${mseFnResult}" "ERR" "2")
        else
          if [ "${mseFnResultCountParts}" == 2 ] && [ "${MSE_LAST_FUNCTION_RETURN[1]}" != "${mseTargetFirstLine}" ]; then
            mseTargetLastLine="${MSE_LAST_FUNCTION_RETURN[1]}"
            if ! [[ "${mseTargetLastLine}" =~ ^[0-9]+$ ]]; then
              mseReturnCod=23
              mseTmpReturnMsg=$(mse_str_replace_placeHolder "${lbl_fw_iv_expectedFunctionNameOrInteger}" "FUNCTION" "${mseFnName}" "RESULT" "${mseFnResult}" "ERR" "3")
            else
              if [ "${mseTargetFirstLine}" -gt "${mseTargetLastLine}" ]; then
                mseReturnCod=24
                mseTmpReturnMsg=$(mse_str_replace_placeHolder "${lbl_fw_iv_firstLineMustBeLessThanTheLast}" "RESULT" "${mseFnResult}")
              fi
            fi
          fi
        fi
      fi
    fi



    if [ "${mseReturnCod}" == "0" ]; then
      if [ "${mseTargetFirstLine}" -lt 1 ] || [ "${mseTargetFirstLine}" -gt "${mseFileLastLine}" ] || [ "${mseTargetLastLine}" -gt "${mseFileLastLine}" ]; then
        mseReturnCod=25
        mseTmpReturnMsg=$(mse_str_replace_placeHolder "${lbl_fw_iv_outsideTheFileLimits}" "LASTLINE" "${mseFileLastLine}")
      fi
    fi


    if [ "${mseReturnCod}" != "0" ]; then
      mseReturnMsg=$(mse_str_replace_placeHolder "${lbl_fw_iv_mainMessage}" "PARAM_A" "TargetLine" "MSG" "${mseTmpReturnMsg}")
    fi
  fi



  if [ "${mseReturnCod}" == "0" ]; then
    IFS=$'\n'

    local mseCountLine=0
    local mseNewFileContent=""
    while read -r mseLineRaw || [ -n "${mseLineRaw}" ]; do
      ((mseCountLine=mseCountLine+1))
      mseLineRaw="${mseLineRaw//\\/\\\\}"

      if [ "${mseCountLine}" == "${mseTargetFirstLine}" ]; then
        if [ "${mseAction}" == "a" ]; then
          mseNewFileContent+="${mseLineRaw}\n"
        fi

        if [ "${mseAction}" != "d" ]; then
          local mseNL
          for mseNL in "${mseContentArrayName[@]}"; do
            mseNewFileContent+="${mseNL//\\/\\\\}\n"
          done
        fi

        if [ "${mseAction}" == "p" ]; then
          mseNewFileContent+="${mseLineRaw}\n"
        fi
      else
        if [ "${mseTargetLastLine}" == "0" ] || [ "${mseCountLine}" -lt "${mseTargetFirstLine}" ] || [ "${mseCountLine}" -gt "${mseTargetLastLine}" ]; then
          mseNewFileContent+="${mseLineRaw}\n"
        fi
      fi

    done <<< "${mseFileContent}"

    IFS=$' \t\n'

    printf "${mseNewFileContent}" > "${mseFilePath}"
    if [ $? != 0 ]; then
      mseReturnCod=1
      mseReturnMsg="${lbl_fw_iv_errorOnSave}"
    fi
  fi


  if [ "${mseReturnCod}" != "0" ]; then
    mseReturn=0
  fi

  mseLastFunctionVariablesSet "${mseReturn}" ${mseReturnCod} "${mseReturnMsg}"
  printf "%s" "${MSE_LAST_FUNCTION_RETURN}"
  return ${MSE_LAST_FUNCTION_ERR_CODE}
}