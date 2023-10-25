#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_interface_set_cursorPosition() {
  if [ "$#" -ge "2" ]; then
    local mseStrPos
    local mseIntPos
    local mseResetToPosition
    local mseTerminalTotalLines="${LINES}"
    local mseTerminalTotalColumns="${COLUMNS}"


    case "${1}" in
      t | r | b | l)
        mseStrPos="${1}"

        local mseCheck=$(mse_is_int "${2}")
        if [ "${mseCheck}" == "1" ] && [ "${2}" -ge "0" ]; then
          mseIntPos="${2}"
        fi

        mseResetToPosition=""
        if [ "$#" -ge "3" ] && ([ "${3}" == "l" ] || [ "${3}" == "r" ]); then
          mseResetToPosition="${3}"
        fi
      ;;
    esac


    if [ "${mseStrPos}" != "" ] && [ "${mseIntPos}" != "" ]; then
      if [ "${mseResetToPosition}" == "l" ]; then
        echo -ne "\r"
      elif [ "${mseResetToPosition}" == "r" ]; then
        echo -ne "\r\e[${mseTerminalTotalColumns}C"
      fi


      if [ "${mseIntPos}" -ge 1 ]; then
        case "${mseStrPos}" in
          t)
            echo -ne "\e[${mseIntPos}A"
          ;;
          r)
            echo -ne "\e[${mseIntPos}D"
          ;;
          b)
            echo -ne "\e[${mseIntPos}B"
          ;;
          l)
            echo -ne "\e[${mseIntPos}C"
          ;;
        esac
      fi
    fi
  fi
}