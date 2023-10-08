#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


mse_font_show_characters() {
  local mseCheck=""

  local mseOutputFormat="t"
  case "${1}" in
    t | c | d)
      mseOutputFormat="${1}"
    ;;
  esac

  local mseFromChar="33"
  if [ $# -ge 2 ]; then
    mseCheck=$(mse_is_int "${2}")
    if [ "${mseCheck}" == "1" ] && [ "${2}" -ge "33" ] && [ "${2}" -le "255" ]; then
      mseFromChar="${2}"
    fi
  fi

  local mseToChar="255"
  if [ $# -ge 3 ]; then
    mseCheck=$(mse_is_int "${3}")
    if [ "${mseCheck}" == "1" ] && [ "${3}" -ge "33" ] && [ "${3}" -le "255" ]; then
      mseToChar="${3}"
    fi
  fi

  if [ "${mseFromChar}" -gt "${mseToChar}" ]; then
    mseFromChar="${3}"
    mseToChar="${2}"
  fi



  if [ ${mseOutputFormat} == "t" ] || [ ${mseOutputFormat} == "c" ]; then
    local x
    local c

    if [ ${mseOutputFormat} == "t" ]; then
      printf "\n      ";
      for x in {0..15}; do
        printf "%-3x" ${x};
      done;
      printf "\n%46s\n" | sed 's/ /-/g;s/^/      /';
    fi

    if [ ${mseOutputFormat} == "t" ]; then
      c=$(printf "fa" | xxd -p -r | iconv -f 'CP437//' -t 'UTF-8')
      printf "%32s" | sed 's/../'"${c}"'  /g;s/^/  0   /;s/$/\n/'
      printf "%32s" | sed 's/../'"${c}"'  /g;s/^/  1   /'
    fi


    for x in {32..255}; do
      (( x % 16 == 0 )) && printf "\n"

      if [ ${mseOutputFormat} == "t" ]; then
        n=$(expr $x % 15) || true
        (( (x % 16) == 0 )) && printf "%-4x" $n | sed 's/0/f/;s/^/  /'
      fi

      printf "%02x" $x | xxd -p -r | iconv -f 'CP437//' -t 'UTF-8' | sed 's/.*/&  /'

      if [ ${mseOutputFormat} == "t" ]; then
        (( x == 127 )) && printf "%46s" | sed 's/ /-/g;s/^/      /;i\ '
      fi
    done


    if [ ${mseOutputFormat} == "t" ]; then
      printf "%46s" | sed 's/ /-/g;s/^/\n      /;s/$/\n      /';
      for x in {0..15}; do
        printf "%-3x" $x;
      done
    fi

    printf "\n"

  else

    local i
    local mseLine
    local mseRawTable
    local mseHasTwoDots=0

    local mseChar
    local mseCDec
    local mseCHex
    local mseCOct

    mseRawTable="Index:Char:Decimal:Hex:Octal\n"

    for (( i=mseFromChar; i<=mseToChar; i++ )); do
      if [ $i == 37 ]; then
        mseLine="37:%%:37:25:045"
      elif [ $i == 42 ]; then
        mseLine="42:*:42:2A:052"
      else
        mseChar=$(printf "%02x" $i | xxd -p -r | iconv -f 'CP437//' -t 'UTF-8')
        mseCDec=$(mse_str_convert_char_toDecimal ${mseChar} 1)
        mseCHex=$(mse_str_convert_char_toHex ${mseChar} 1)
        mseCOct=$(mse_str_convert_char_toOctal ${mseChar} 1)

        if [ "${mseChar}" == ":" ]; then
          mseChar="[[TWODOTS]]"
          mseHasTwoDots=1
        fi

        mseLine="$i:${mseChar}:${mseCDec}:${mseCHex}:${mseCOct}"
      fi

      mseRawTable+="${mseLine}\n"
    done

    printf "\n"

    mseRawTable=$(printf "${mseRawTable}")
    mseRawTable=$(column -e -t -s ":" <<< "${mseRawTable}")

    if [ "${mseHasTwoDots}" == 1 ]; then
      local mseLineRaw

      while read -r mseLineRaw || [ -n "${mseLineRaw}" ]; do
        if [[ "${mseLineRaw}" =~ "[[TWODOTS]]" ]]; then
          mseLineRaw=$(mse_str_replace_placeHolder "${mseLineRaw}" "TWODOTS" ":          ")
        fi
        printf "%s\n" "${mseLineRaw}"
      done <<< "$mseRawTable"

    else
      printf "${mseRawTable}\n"
    fi

    printf "\n"
  fi
}