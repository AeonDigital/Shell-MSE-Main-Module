#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_font_create_style() {
  local mseReturn=""

  if [ "$#" -ge "4" ]; then
    local mseColorSystem="4"
    local mseAttributes="20"
    local mseBackground="49"
    local mseForeground="39"
    local mseReturnAsString="0"

    local mseTmpAttributes="${2^^}"
    local mseTmpBackground="${3^^}"
    local mseTmpForeground="${4^^}"

    local mseIsResult


    if [ "${1}" == "8" ]; then
      mseColorSystem="8"
      mseBackground="0"
      mseForeground="255"
    elif [ "${1}" == "32" ]; then
      mseColorSystem="32"
      mseBackground="0;0;0"
      mseForeground="255;255;255"
    fi


    if [ "$#" -ge "5" ] && [ "${5}" == "1" ]; then
      mseReturnAsString="1"
    fi


    if [ "${mseColorSystem}" == "4" ]; then
      local mseUseDark="0"

      if [ "${mseTmpBackground:0:1}" == "D" ]; then
        mseTmpBackground="${mseTmpBackground:1}"
      fi
      if [ "${mseTmpForeground:0:1}" == "D" ]; then
        mseUseDark="1"
        mseTmpForeground="${mseTmpForeground:1}"
      fi


      if [ "${mseUseDark}" == "0" ]; then
        mseIsResult=$(mse_is_int "${mseTmpForeground}")
        if [ "${mseIsResult}" == "1" ] && [ "${mseTmpForeground}" -gt "200" ]; then
          mseUseDark="1"
          ((mseTmpForeground = mseTmpForeground - 200))
        fi
      fi

      if [ "${mseUseDark}" == "1" ]; then
        if [ "${mseTmpAttributes}" != "" ]; then
          mseTmpAttributes+=","
        fi
        mseTmpAttributes+="DARK"
      fi
    fi



    local i
    local mseLength
    local mseUParam
    local mseIsCheck
    declare -a mseArrSplit=()


    if [ "${mseTmpAttributes}" != "" ]; then
      declare -a mseValidAttr=()
      local mseTmpAttr


      mse_str_split "mseArrSplit" "," "${mseTmpAttributes}"
      for mseUParam in "${mseArrSplit[@]}"; do
        if [ "${mseUParam}" != "" ]; then
          mseTmpAttr=""

          mseUParam=$(mse_str_trim "${mseUParam}")
          mseIsResult=$(mse_is_int "${mseUParam}")

          if [ "${mseIsResult}" == "1" ]; then
            mseIsCheck=$(mse_array_has_value "${mseUParam}" "MSE_MD_ICOLOR_AVAILABLE_FONT_ATTRIBUTE_CODES")
            if [ "${mseIsCheck}" == "1" ]; then
              mseTmpAttr="${mseUParam}"
            fi
          else
            mseLength="${#MSE_MD_ICOLOR_AVAILABLE_FONT_ATTRIBUTE_NAMES[@]}"
            for (( i=0; i<mseLength; i++)); do
              if [ "${mseUParam}" == "${MSE_MD_ICOLOR_AVAILABLE_FONT_ATTRIBUTE_NAMES[$i]}" ]; then
                mseTmpAttr="${MSE_MD_ICOLOR_AVAILABLE_FONT_ATTRIBUTE_CODES[$i]}"
                break
              fi
            done
          fi

          if [ "${mseTmpAttr}" != "" ]; then
            mseIsCheck=$(mse_array_has_value "${mseTmpAttr}" "mseValidAttr")
            if [ "${mseIsCheck}" == "0" ]; then
              mseValidAttr+=("${mseTmpAttr}")
            fi
          fi
        fi
      done


      if [ "${#mseValidAttr[@]}" -ge "1" ]; then
        mseAttributes=$(mse_str_join ";" "mseValidAttr")
      fi
    fi



    if [ "${mseTmpBackground}" != "" ]; then
      mseIsResult=$(mse_is_int "${mseTmpBackground}")

      case "${mseColorSystem}" in
        4)
          if [ "${mseIsResult}" == "1" ]; then
            mseIsCheck=$(mse_array_has_value "${mseTmpBackground}" "MSE_MD_ICOLOR_AVAILABLE_BGCOLOR_CODES")
            if [ "${mseIsCheck}" == "1" ]; then
                mseBackground="${mseTmpBackground}"
            fi
          else
            mseLength="${#MSE_MD_ICOLOR_AVAILABLE_COLOR_NAMES[@]}"
            for (( i=0; i<mseLength; i++)); do
              if [ "${mseTmpBackground}" == "${MSE_MD_ICOLOR_AVAILABLE_COLOR_NAMES[$i]}" ]; then
                mseBackground="${MSE_MD_ICOLOR_AVAILABLE_BGCOLOR_CODES[$i]}"
                break
              fi
            done
          fi
        ;;
        8)
          if [ "${mseIsResult}" == "1" ]; then
            if [ "${mseTmpBackground}" -ge "0" ] && [ "${mseTmpBackground}" -le "255" ]; then
              mseBackground="48;5;${mseTmpBackground}"
            fi
          fi
        ;;
        32)
          mse_str_split "mseArrSplit" ";" "${mseTmpBackground}"
          if [ "${#mseArrSplit[@]}" == "3" ]; then
            local mseIsValid="1"

            for mseUParam in "${mseArrSplit[@]}"; do
              mseIsResult=$(mse_is_int "${mseUParam}")

              if [ "${mseIsResult}" == "0" ] || [ "${mseUParam}" -lt "0" ] || [ "${mseUParam}" -gt "255" ]; then
                mseIsValid="0"
              fi
            done

            if [ "${mseIsValid}" == "1" ]; then
              mseBackground="48;2;${mseTmpBackground}"
            fi
          fi
        ;;
      esac
    fi



    if [ "${mseTmpForeground}" != "" ]; then
      mseIsResult=$(mse_is_int "${mseTmpForeground}")

      case "${mseColorSystem}" in
        4)
          if [ "${mseIsResult}" == "1" ]; then
            mseIsCheck=$(mse_array_has_value "${mseTmpForeground}" "MSE_MD_ICOLOR_AVAILABLE_COLOR_CODES")
            if [ "${mseIsCheck}" == "1" ]; then
              mseForeground="${mseTmpForeground}"
            fi
          else
            mseLength="${#MSE_MD_ICOLOR_AVAILABLE_COLOR_NAMES[@]}"
            for (( i=0; i<mseLength; i++)); do
              if [ "${mseTmpForeground}" == "${MSE_MD_ICOLOR_AVAILABLE_COLOR_NAMES[$i]}" ]; then
                mseForeground="${MSE_MD_ICOLOR_AVAILABLE_COLOR_CODES[$i]}"
                break
              fi
            done
          fi
        ;;
        8)
          if [ "${mseIsResult}" == "1" ]; then
            if [ "${mseTmpForeground}" -ge "0" ] && [ "${mseTmpForeground}" -le "255" ]; then
              mseForeground="38;5;${mseTmpForeground}"
            fi
          fi
        ;;
        32)
          mse_str_split "mseArrSplit" ";" "${mseTmpForeground}"
          if [ "${#mseArrSplit[@]}" == "3" ]; then
            local mseIsValid="1"

            for mseUParam in "${mseArrSplit[@]}"; do
              mseIsResult=$(mse_is_int "${mseUParam}")

              if [ "${mseIsResult}" == "0" ] || [ "${mseUParam}" -lt "0" ] || [ "${mseUParam}" -gt "255" ]; then
                mseIsValid="0"
              fi
            done

            if [ "${mseIsValid}" == "1" ]; then
              mseForeground="38;2;${mseTmpForeground}"
            fi
          fi
        ;;
      esac
    fi



    if [ "${mseReturnAsString}" == "1" ]; then
      mseReturn=$(printf "e[%s;%s;%sm" "${mseAttributes}" "${mseBackground}" "${mseForeground}")
    else
      mseReturn=$(printf "\e[%s;%s;%sm" "${mseAttributes}" "${mseBackground}" "${mseForeground}")
    fi
  fi


  echo -n "${mseReturn}"
}