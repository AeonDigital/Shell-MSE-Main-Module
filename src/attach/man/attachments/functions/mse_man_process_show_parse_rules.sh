#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Processa as regras de amostragem das informações do manual preenchendo o
# array resultante com o nome de cada seção que será retornada na ordem em que
# devem ser apresentadas.
#
# @param assoc $1
# Nome do array que será preenchido.
#
# @param string $2
# Regras de como exibir o manual.
# [ Este parametro é o mesmo $2 recebido em `mse_man` ]
#
#
# @return void
mse_man_process_show_parse_rules() {
  declare -n mseArrTmpShowRules="${1}"
  local mseStrTmpRawRules=$(mse_man_process_show_normalize_rules_before_parse "${2}")


  if [ "${mseStrTmpRawRules}" == "" ] || [ "${mseStrTmpRawRules}" == "*" ]; then
    mseArrTmpShowRules+=("*")
  else
    local mseStrRulesCountChars="${#mseStrTmpRawRules}"

    local i="0"
    local char=""
    local secRule=""
    local secOpen=""

    unset mseTmpAssocSectionsNames
    unset mseTmpAssocSectionsOrder

    declare -A mseTmpAssocSectionsNames
    declare -a mseTmpAssocSectionsOrder=()


    for ((i = 0; i < mseStrRulesCountChars; i++)); do
      char="${mseStrTmpRawRules:$i:1}"

      case "${char}" in
        "[")
          if [ "${secOpen}" == "" ]; then
            secOpen="${secRule//,/}"
          else
            secOpen+=">${secRule//,/}"
          fi

          mseTmpAssocSectionsNames["${secOpen}"]=""
          mseTmpAssocSectionsOrder+=("${secOpen}")

          secRule=""
        ;;
        "]")
          mseTmpAssocSectionsNames["${secOpen}"]="${secRule}"

          if [[ "${secOpen}" == *">"* ]]; then
            secOpen="${secOpen%>*}"
          else
            secOpen=""
          fi

          secRule=""
        ;;
        *)
          secRule+="${char}"
        ;;
      esac
    done



    local sec=""
    local ssec=""
    local rule=""
    declare -a mseTmpArr=()

    for sec in "${mseTmpAssocSectionsOrder[@]}"; do
      rule="${mseTmpAssocSectionsNames[$sec]}"
      sec="${sec//>/_}"

      if [ "${rule}" != "" ]; then
        mse_str_split "mseTmpArr" "," "${rule}"

        for ssec in "${mseTmpArr[@]}"; do
          mseArrTmpShowRules+=("${sec}_${ssec}")
        done
      fi
    done
  fi
}



mse_man_process_show_normalize_rules_before_parse() {
  if [ "${1}" == "" ] || [ "${1}" == "*" ]; then
    echo "${1}"
  else
    # remove spaces
    local mseStrTmpNormalized="${1// /}"

    # remove [*]
    mseStrTmpNormalized="${mseStrTmpNormalized//\[\*\]/}"

    # add "," at end of string
    mseStrTmpNormalized+=","

    # add "," at end of brackets
    mseStrTmpNormalized="${mseStrTmpNormalized//\]/\,\]}"

    # insert [*] before any comma
    mseStrTmpNormalized="${mseStrTmpNormalized//,/\[\*\],}"

    # remove invalids [*]
    mseStrTmpNormalized="${mseStrTmpNormalized//,\][\*\]/\]}"


    echo "${mseStrTmpNormalized%?}"
  fi
}