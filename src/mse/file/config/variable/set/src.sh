#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_file_config_variable_set() {
  local mseReturn="0"
  local mseReturnMsg=""
  declare -a mseArrSplit=()

  local mseFile="${1}"
  local mseIsConfigFile="${2}"
  local mseCommentChar="${3}"
  local mseSection="${4}"

  local mseVarType="${5}"
  local mseVarName="${6}"
  local mseVarValue="${7}"
  declare -n mseVarArrObj

  local mseMode="${8}"
  local msePosition="${9}"


  if ([ "${mseVarType}" == "a" ] || [ "${mseVarType}" == "A" ]) && [ "${mseVarValue}" != "" ]; then
    mseVarArrObj="${mseVarValue}"
  fi



  local mseSectionNameStart="${mseSection}"
  local mseSectionNameEnd=""
  if [ "${mseIsConfigFile}" == "0" ]; then
    mseSectionNameStart="${mseCommentChar} [[INI-${mseVarName}]]"
    mseSectionNameEnd="${mseCommentChar} [[END-${mseVarName}]]"
  fi


  local mseTargetSectionLines=$(mse_file_get_boundaryLineNumbers "${mseFile}" "${mseCommentChar}" "${mseIsConfigFile}" "${mseSectionNameStart}" "${mseSectionNameEnd}")

  mse_str_split "mseArrSplit" " " "${mseTargetSectionLines}"
  if [ "${#mseArrSplit[@]}" != 2 ]; then
    mseReturnMsg="${lbl_err_cannotIdentifyTargetLine}"
  else
    local mseTargetSectionFirstLine="${mseArrSplit[0]}"
    local mseTargetSectionLastLine="${mseArrSplit[1]}"



    local mseTargetVarRawLine
    local mseTargetVarLineNumber
    local mseTargetVarIsCommented

    if [ "${mseIsConfigFile}" == "1" ]; then
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

      if [ "${mseIsConfigFile}" == "0" ]; then
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
            a | A)
              IFS=$'\n'
              mseNewLine+=($(echo -e "$(mse_array_dump "${mseVarValue}" "1" "${mseVarName}" ${mseTmpComment})"))
              IFS=$' \t\n'
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


  echo -n "${mseReturn}"
  if [ "${mseReturnMsg}" != "" ]; then
    echo -ne "\n${mseReturnMsg}"
  fi
}