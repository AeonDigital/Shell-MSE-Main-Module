#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_file_read() {
  local mseLineRaw
  local mseTarget="${1}"
  declare -a mseArrSplit=()


  if [ -f "${mseTarget}" ]; then
    mseTarget=$(< "${mseTarget}")
  fi



  if [ "${mseTarget}" != "" ]; then
    declare -n mseArrayName="${2}"



    local block_start_check
    local block_start_check_args
    local block_start_check_args_sep
    declare -a block_start_check_args_array=()
    local block_start_get_first_line

    if [ "${mseArrayName[block_start_check]}" != "" ]; then
      block_start_check="${mseArrayName[block_start_check]}"
      block_start_check_args="${mseArrayName[block_start_check_args]}"
      block_start_check_args_sep="${mseArrayName[block_start_check_args_sep]}"
      block_start_get_first_line="0"

      if [ "${block_start_check_args_sep}" != "" ]; then
        mse_str_split "block_start_check_args_array" "${block_start_check_args_sep}" "${block_start_check_args}"
      fi

      if [ "${mseArrayName[block_start_get_first_line]}" == "1" ]; then
        block_start_get_first_line="1"
      fi
    fi



    local block_end_check
    local block_end_check_args
    local block_end_check_args_sep
    declare -a block_end_check_args_array=()
    local block_end_get_last_line

    if [ "${mseArrayName[block_end_check]}" != "" ]; then
      block_end_check="${mseArrayName[block_end_check]}"
      block_end_check_args="${mseArrayName[block_end_check_args]}"
      block_end_check_args_sep="${mseArrayName[block_end_check_args_sep]}"
      block_end_get_last_line="0"

      if [ "${block_end_check_args_sep}" != "" ]; then
        mse_str_split "block_end_check_args_array" "${block_end_check_args_sep}" "${block_end_check_args}"
      fi

      if [ "${mseArrayName[block_end_get_last_line]}" == "1" ]; then
        block_end_get_last_line="1"
      fi
    fi



    local block_check_invert="0"
    if [ "${mseArrayName[block_check_invert]}" == "1" ]; then
      block_check_invert="1"
    fi



    local line_check
    local line_check_args
    local line_check_args_sep
    declare -a line_check_args_array=()
    local line_check_invert
    local line_check_has_linenumber

    if [ "${mseArrayName[line_check]}" != "" ]; then
      line_check="${mseArrayName[line_check]}"
      line_check_args="${mseArrayName[line_check_args]}"
      line_check_args_sep="${mseArrayName[line_check_args_sep]}"
      line_check_invert="0"
      line_check_has_linenumber="0"

      if [ "${line_check_args_sep}" != "" ]; then
        mse_str_split "line_check_args_array" "${line_check_args_sep}" "${line_check_args}"
      fi

      if [ "${mseArrayName[line_check_invert]}" == "1" ]; then
        line_check_invert="1"
      fi

      if [ "${mseArrayName[line_check_has_linenumber]}" == "1" ]; then
        line_check_has_linenumber="1"
      fi
    fi



    local line_transform
    local line_transform_args
    local line_transform_args_sep
    declare -a line_transform_args_array=()
    local line_transform_has_linenumber

    if [ "${mseArrayName[line_transform]}" != "" ]; then
      line_transform="${mseArrayName[line_transform]}"
      line_transform_args="${mseArrayName[line_transform_args]}"
      line_transform_args_sep="${mseArrayName[line_transform_args_sep]}"

      if [ "${line_transform_args_sep}" != "" ]; then
        mse_str_split "line_transform_args_array" "${line_transform_args_sep}" "${line_transform_args}"
      fi

      if [ "${mseArrayName[line_transform_has_linenumber]}" == "1" ]; then
        line_transform_has_linenumber="1"
      fi
    fi



    local line_hide_empty="0"
    if [ "${mseArrayName[line_hide_empty]}" == "1" ] || ([ "$#" -ge "3" ] && [ "${3}" == "1" ]); then
      line_hide_empty="1"
    fi


    local line_show_number="0"
    if [ "${mseArrayName[line_show_number]}" == "1" ] || ([ "$#" -ge "4" ] && [ "${4}" == "1" ]); then
      line_show_number="1"
    fi






    local mseValidSection="1"
    local mseValidLine="1"
    local mseValidLastLine="0"
    local mseLineCount="0"
    local mseLineRaw=""

    if [ "${block_start_check}" != "" ]; then
      mseValidSection="0"
    fi

    IFS=$'\n'
    while read mseLineRaw || [ -n "${mseLineRaw}" ]; do
      ((mseLineCount=mseLineCount+1))
      mseValidLine="1"
      mseValidLastLine="0"


      if [ "${mseLineRaw}" != "" ] || [ "${line_hide_empty}" == "0" ]; then

        if [ "${mseValidSection}" == "0" ]; then
          if [ "${block_start_check}" != "" ]; then
            mseValidSection=$($block_start_check "${2}" "${mseLineCount}" "${mseLineRaw}" "0" "${block_start_check_args}")

            if [ "${mseValidSection}" == "1" ] && [ "${block_start_get_first_line}" == "0" ]; then
              mseValidLine="0"
            fi
          fi
        else
          if [ "${block_end_check}" != "" ]; then
            mseValidSection=$($block_end_check "${2}" "${mseLineCount}" "${mseLineRaw}" "0" "${block_end_check_args}")

            if [ "${mseValidSection}" == "1" ]; then
              if [ "${block_end_get_last_line}" == "1" ]; then
                mseValidSection="1"
                mseValidLastLine="1"
              else
                mseValidSection="0"
              fi
            else
              mseValidSection="1"
            fi
          fi
        fi



        if [ "${mseValidSection}" == "1" ] && [ "${mseValidLine}" == "1" ]; then

          if [ "${line_check}" != "" ]; then
            mseValidLine=$($line_check "${2}" "${mseLineCount}" "${mseLineRaw}" "${line_check_has_linenumber}" "${line_check_args}")

            if [ "${line_check_invert}" == "1" ]; then
              if [ "${mseValidLine}" == "1" ]; then
                mseValidLine="0"
              else
                mseValidLine="1"
              fi
            fi
          fi



          if [ "${mseValidLine}" == "1" ]; then

            if [ "${line_transform}" != "" ]; then
              mseLineRaw=$($line_transform "${mseLineCount}" "${mseLineRaw}" "${line_transform_has_linenumber}" "${line_transform_args}")
            fi

            if [ "${line_show_number}" == "1" ]; then
              echo -n "${mseLineCount}#"
            fi
            echo -e "${mseLineRaw}"

            if [ "${mseValidLastLine}" == "1" ]; then
              mseValidSection="0"
            fi
          fi
        fi
      fi
    done <<< "${mseTarget}"
    IFS=$' \t\n'
  fi
}