#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_file_write() {
  local mseReturn="1"
  local mseReturnMsg=""


  local mseFile="${1}"
  local mseFileContent=$(< "${mseFile}")
  local mseFileLastLine=$(mse_file_count_lines "${mseFile}")

  declare -n mseNewLines
  mseNewLines="${2}"

  local mseAction="a"
  local mseTargetFirstLine
  local mseTargetLastLine


  if [ "$#" -ge "3" ]; then
    case "${3}" in
      p)
        mseAction="p"
        mseTargetFirstLine="1"
        mseTargetLastLine="0"
      ;;
      a)
        mseAction="a"
        mseTargetFirstLine="${mseFileLastLine}"
        mseTargetLastLine="0"
      ;;
      r)
        mseAction="r"
        if [ "$#" -lt "4" ]; then
          mseReturn="0"
          mseReturnMsg=$(mse_str_replace_placeHolder "${lbl_err_paramA_RequiredFor_A_Operation}" "PARAM_A" "targetLine" "A" "replace")
        fi
      ;;
      d)
        mseAction="d"
        if [ "$#" -lt "4" ]; then
          mseReturn="0"
          mseReturnMsg=$(mse_str_replace_placeHolder "${lbl_err_paramA_RequiredFor_A_Operation}" "PARAM_A" "targetLine" "A" "delete")
        fi
      ;;
    esac
  fi




  if [ "${mseReturn}" == "1" ]; then
    if [ "$#" -ge "4" ]; then
      local mseTmpReturnMsg=""

      if [[ "${4}" =~ ^[0-9]+$ ]]; then
        mseTargetFirstLine="${4}"
        mseTargetLastLine="0"
      else
        local mseFnName="-"
        local mseFnResult
        local mseFnResultCountParts
        declare -a mseArrSplit=()

        mseFnResult="${4}"
        if [ "$(type -t ${4})" == "function" ]; then
          mseFnName="fn ${4}"
          mseFnResult=$(${4})
        fi

        mse_str_split "mseArrSplit" " " "${mseFnResult}"
        mseFnResultCountParts="${#mseArrSplit[@]}"

        if [ "${mseFnResultCountParts}" == "0" ] || [ "${mseFnResultCountParts}" -gt "2" ]; then
          mseReturn="0"
          mseTmpReturnMsg=$(mse_str_replace_placeHolder "${lbl_fw_iv_expectedFunctionNameOrInteger}" "FUNCTION" "${mseFnName}" "RESULT" "${mseFnResult}" "ERR" "1")
        else
          mseTargetFirstLine="${mseArrSplit[0]}"
          mseTargetLastLine="0"

          if ! [[ "${mseTargetFirstLine}" =~ ^[0-9]+$ ]]; then
            mseReturn="0"
            mseTmpReturnMsg=$(mse_str_replace_placeHolder "${lbl_fw_iv_expectedFunctionNameOrInteger}" "FUNCTION" "${mseFnName}" "RESULT" "${mseFnResult}" "ERR" "2")
          else
            if [ "${mseFnResultCountParts}" == "2" ] && [ "${mseArrSplit[1]}" != "${mseTargetFirstLine}" ]; then
              mseTargetLastLine="${mseArrSplit[1]}"
              if ! [[ "${mseTargetLastLine}" =~ ^[0-9]+$ ]]; then
                mseReturn="0"
                mseTmpReturnMsg=$(mse_str_replace_placeHolder "${lbl_fw_iv_expectedFunctionNameOrInteger}" "FUNCTION" "${mseFnName}" "RESULT" "${mseFnResult}" "ERR" "3")
              else
                if [ "${mseTargetFirstLine}" -gt "${mseTargetLastLine}" ]; then
                  mseReturn="0"
                  mseTmpReturnMsg=$(mse_str_replace_placeHolder "${lbl_fw_iv_firstLineMustBeLessThanTheLast}" "RESULT" "${mseFnResult}")
                fi
              fi
            fi
          fi
        fi
      fi



      if [ "${mseReturn}" == "1" ]; then
        if [ "${mseTargetFirstLine}" -lt "1" ] || [ "${mseTargetFirstLine}" -gt "${mseFileLastLine}" ] || [ "${mseTargetLastLine}" -gt "${mseFileLastLine}" ]; then
          mseReturn="0"
          mseTmpReturnMsg=$(mse_str_replace_placeHolder "${lbl_fw_iv_outsideTheFileLimits}" "LASTLINE" "${mseFileLastLine}")
        fi
      fi


      if [ "${mseReturn}" == "0" ]; then
        mseReturnMsg=$(mse_str_replace_placeHolder "${lbl_fw_iv_mainMessage}" "PARAM_A" "targetLine" "MSG" "${mseTmpReturnMsg}")
      fi
    fi



    if [ "${mseReturn}" == "1" ]; then
      local mseCountLine="0"
      local mseNewFileContent=""


      IFS=$'\n'
      while read -r mseLineRaw || [ -n "${mseLineRaw}" ]; do
        ((mseCountLine=mseCountLine+1))
        mseLineRaw="${mseLineRaw//\\/\\\\}"

        if [ "${mseCountLine}" == "${mseTargetFirstLine}" ]; then
          if [ "${mseAction}" == "a" ]; then
            mseNewFileContent+="${mseLineRaw}\n"
          fi

          if [ "${mseAction}" != "d" ]; then
            local mseNL
            for mseNL in "${mseNewLines[@]}"; do
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


      echo -ne "${mseNewFileContent}" > "${mseFile}"
      if [ "$?" != "0" ]; then
        mseReturn="0"
        mseReturnMsg="${lbl_fw_iv_errorOnSave}"
      fi
    fi
  fi


  echo -n "${mseReturn}"
  if [ "${mseReturnMsg}" != "" ]; then
    echo -ne "\n${mseReturnMsg}"
  fi
}