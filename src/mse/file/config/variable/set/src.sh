#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_file_config_variable_set() {
  mseLastFunctionVariablesReset


  local mseReturn=1
  local mseReturnCod=0
  local mseReturnMsg=""


  if [ $# -lt 8 ]; then
    local mseArgs="$#"
    local mseLost
    ((mseLost = 8 - mseArgs))

    mseReturnMsg=$(mse_str_replace_placeHolder "${lbl_err_lostParameters}" "LOST" "${mseLost}")
  else

    local mseFile="${1}"
    local mseConfigFile="${2}"
    local mseCommentChar="${3}"
    local mseSection="${4}"

    local mseVarType="${5}"
    local mseVarName="${6}"
    local mseVarValue="${7}"
    declare -n mseVarArrName

    local mseMode="${8}"
    local msePosition="${9}"


    if [ "${mseFile}" == "" ]; then
      mseReturnMsg=$(mse_str_replace_placeHolder "${lbl_err_paramA_IsRequired}" "PARAM_A" "PathToFile")
    elif [ ! -f "${mseFile}" ]; then
      mseReturnMsg=$(mse_str_replace_placeHolder "${lbl_err_paramA_PointsToNonExistentFile}" "PARAM_A" "PathToFile")
    else
      if [ "${mseConfigFile}" == "" ]; then
        mseReturnMsg=$(mse_str_replace_placeHolder "${lbl_err_paramA_IsRequired}" "PARAM_A" "ConfigFile")
      elif [ "${mseConfigFile}" != "0" ] && [ "${mseConfigFile}" != "1" ]; then
        mseReturnMsg=$(mse_str_replace_placeHolder "${lbl_err_paramA_HasInvalidValue}" "PARAM_A" "ConfigFile")
      else
        if [ "${mseCommentChar}" == "" ]; then
          mseReturnMsg=$(mse_str_replace_placeHolder "${lbl_err_paramA_IsRequired}" "PARAM_A" "CommentChar")
        else
          if [ "${mseVarType}" == "" ]; then
            mseReturnMsg=$(mse_str_replace_placeHolder "${lbl_err_paramA_IsRequired}" "PARAM_A" "VarType")
          else
            declare -a validVarType=("s" "a" "A")
            if ! [[ ${validVarType[*]} =~ "${mseVarType}" ]]; then
              mseReturnMsg=$(mse_str_replace_placeHolder "${lbl_err_paramA_HasInvalidValue}" "PARAM_A" "VarType")
            else
              if [ "${mseVarName}" == "" ]; then
                mseReturnMsg=$(mse_str_replace_placeHolder "${lbl_err_paramA_IsRequired}" "PARAM_A" "VarName")
              else

                if [ "${mseVarType}" != "s" ]; then
                  if [ "${mseVarValue}" == "" ]; then
                    mseReturnMsg=$(mse_str_replace_placeHolder "${lbl_err_paramA_IsRequired}" "PARAM_A" "VarValue")
                  else
                    local mseArrDeclare=$(declare -p "${mseVarValue}" 2> /dev/null)
                    if [ "${mseVarType}" == "a" ] && [[ ! "${mseArrDeclare}" =~ "declare -a" ]]; then
                      mseReturnMsg=$(mse_str_replace_placeHolder "${lbl_err_paramA_MustBeAnArray}" "PARAM_A" "VarValue")
                    elif [ "${mseVarType}" == "A" ] && [[ ! "${mseArrDeclare}" =~ "declare -A" ]]; then
                      mseReturnMsg=$(mse_str_replace_placeHolder "${lbl_err_paramA_MustBeAnAssocArray}" "PARAM_A" "VarValue")
                    else
                      mseVarArrName="${mseVarValue}"
                    fi
                  fi
                fi

                if [ "${mseReturnMsg}" == "" ] && [ "${mseConfigFile}" == "1" ]; then
                  declare -a validOperation=("a" "d" "m" "c" "u")
                  if [ "${mseMode}" == "" ] || [[ ! "${validOperation[@]}" =~ "${mseMode}" ]]; then
                    mseReturnMsg=$(mse_str_replace_placeHolder "${lbl_err_paramA_HasInvalidOption}" "PARAM_A" "Operation")
                  else
                    if [ "${mseMode}" == "" ]; then
                      mseMode="a"
                    else
                      declare -a validPosition=("p" "a")
                      if [[ ! "${validPosition[@]}" =~ "${msePosition}" ]]; then
                        mseReturnMsg=$(mse_str_replace_placeHolder "${lbl_err_paramA_HasInvalidOption}" "PARAM_A" "Position")
                      fi
                    fi
                  fi
                fi

              fi
            fi
          fi
        fi
      fi
    fi



    if [ "${mseReturnMsg}" == "" ]; then

      local mseSectionNameStart="${mseSection}"
      local mseSectionNameEnd=""
      if [ "${mseConfigFile}" == "0" ]; then
        mseSectionNameStart="${mseCommentChar} [[INI-${mseVarName}]]"
        mseSectionNameEnd="${mseCommentChar} [[END-${mseVarName}]]"
      fi


      local mseTargetSectionLines=$(mse_file_getBoundaryLineNumbers "${mseFile}" "${mseCommentChar}" "${mseConfigFile}" "${mseSectionNameStart}" "${mseSectionNameEnd}")


      mse_str_split " " "${mseTargetSectionLines}"
      if [ "${#MSE_LAST_FUNCTION_RETURN[@]}" != 2 ]; then
        mseReturnMsg="${lbl_err_cannotIdentifyTargetLine}"
      else
        local mseTargetSectionFirstLine="${MSE_LAST_FUNCTION_RETURN[0]}"
        local mseTargetSectionLastLine="${MSE_LAST_FUNCTION_RETURN[1]}"



        local mseTargetVarRawLine
        local mseTargetVarLineNumber
        local mseTargetVarIsCommented

        if [ "${mseConfigFile}" == "1" ]; then
          mseTargetVarRawLine=$(mse_file_config_variable_showLine "${mseFile}" "${mseSectionNameStart}" "${mseVarName}" "1")

          if [ "${mseMode}" == "a" ]; then
            if [ "${mseTargetVarRawLine}" != "" ]; then
              mseReturnMsg=$(mse_str_replace_placeHolder "${lbl_err_variableAlreadExists}" "VAR" "${mseVarName}")
            fi
          else
            if [ "${mseTargetVarRawLine}" == "" ]; then
              if [ "${mseSectionNameStart}" == "" ]; then
                mseReturnMsg=$(mse_str_replace_placeHolder "${lbl_err_variableDoNotExists}" "VAR" "${mseVarName}")
              else
                mseReturnMsg=$(mse_str_replace_placeHolder "${lbl_err_variableDoNotExistsInSection}" "VAR" "${mseVarName}" "SECTION" "${mseSectionNameStart}")
              fi
            else
              mseTargetVarLineNumber="${mseTargetVarRawLine%${mseCommentChar}*}"
              mseTargetVarLineNumber="${mseTargetVarLineNumber%*${mseCommentChar}}"

              mseTargetVarRawLine="${mseTargetVarRawLine#${mseTargetVarLineNumber}#}"

              mseTargetVarIsCommented="0"
              if [ "${mseTargetVarRawLine:0:1}" == "${mseCommentChar}" ]; then
                mseTargetVarIsCommented="1"
              fi
            fi
          fi
        fi



        if [ "${mseReturnMsg}" == "" ]; then
          declare -a mseNewLine=()

          if [ "${mseConfigFile}" == "0" ]; then
            if [ "${mseMode}" != "d" ]; then
              local mseTmpComment=""
              if [ "${mseMode}" == "c" ]; then
                mseTmpComment="${mseCommentChar} "
              fi

              mseNewLine+=("${mseSectionNameStart}")

              case "${mseVarType}" in
                s)
                  mseNewLine+=("${mseTmpComment}${mseVarName}=${mseVarValue}")
                ;;
                a)
                  local i
                  local l="${#mseVarArrName[@]}"
                  local v

                  mseNewLine+=("declare -ga ${mseVarName}")
                  for ((i=0; i<l; i++)); do
                    v="${mseVarArrName[$i]}"
                    mseNewLine+=("${mseTmpComment}${mseVarName}[$i]=\"${v}\"")
                  done
                ;;
                A)
                  local k
                  local v

                  mseNewLine+=("declare -gA ${mseVarName}")
                  for k in ${!mseVarArrName[@]}; do
                    v="${mseVarArrName[$k]}"
                    mseNewLine+=("${mseTmpComment}${mseVarName}[\"$k\"]=\"${v}\"")
                  done
                ;;
              esac

              mseNewLine+=("${mseSectionNameEnd}")
              mseReturn=$(mse_file_write "${mseFile}" "mseNewLine" "r" "${mseTargetSectionLines}")
            fi
          else
            case "${mseMode}" in
              a)
                if [ "${msePosition}" == "p" ]; then
                  mseTargetVarLineNumber="${mseTargetSectionFirstLine}"
                elif [ "${msePosition}" == "a" ]; then
                  mseTargetVarLineNumber="${mseTargetSectionLastLine}"
                fi
                mseNewLine=("${mseVarName}=${mseVarValue}")
                mseReturn=$(mse_file_write "${mseFile}" "mseNewLine" "a" "${mseTargetVarLineNumber}")
              ;;

              d)
                mseReturn=$(mse_file_write "${mseFile}" "mseNewLine" "d" "${mseTargetVarLineNumber}")
              ;;

              m)
                local mseRawVarAssign="${mseTargetVarRawLine%%=*}"
                local mseRawVarValue="${mseTargetVarRawLine#${mseRawVarAssign}=}"
                local mseRawVarSep=${mseRawVarValue%%[^ ]*}
                mseNewLine=("${mseRawVarAssign}=${mseRawVarSep}${mseVarValue}")

                mseReturn=$(mse_file_write "${mseFile}" "mseNewLine" "r" "${mseTargetVarLineNumber}")
              ;;

              c)
                if [ "${mseTargetVarIsCommented}" == 0 ]; then
                  mseNewLine=("${mseCommentChar}${mseTargetVarRawLine}")
                  mseReturn=$(mse_file_write "${mseFile}" "mseNewLine" "r" "${mseTargetVarLineNumber}")
                fi
              ;;

              u)
                if [ "${mseTargetVarIsCommented}" == 1 ]; then
                  mseNewLine=("${mseTargetVarRawLine:1}")
                  mseReturn=$(mse_file_write "${mseFile}" "mseNewLine" "r" "${mseTargetVarLineNumber}")
                fi
              ;;
            esac
          fi
        fi



      fi


    fi
  fi



  if [ "${mseReturnMsg}" != "" ] || [ "${mseReturn}" != "1" ]; then
    mseReturn=0
    mseReturnCod=1
  fi


  mseLastFunctionVariablesSet "${mseReturn}" "${mseReturnCod}" "${mseReturnMsg}"
  printf "%s" "${MSE_LAST_FUNCTION_RETURN}"
  return ${MSE_LAST_FUNCTION_ERR_CODE}
}