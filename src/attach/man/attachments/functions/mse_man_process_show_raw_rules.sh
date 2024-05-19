#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# A partir da coleção 'bruta' de seções que devem ser retornadas, e também da
# coleção total de seções existentes, preenche o array alvo com o nome de
# cada uma das seções que devem aparecer na apresentação do manual.
#
# @param array $1
# Nome do array que contem o nome 'bruto' de cada seção que deve ser
# apresentada.
#
# @param array $2
# Nome do array que contem o nome real de cada seção do manual na ordem em que
# aparecem no mesmo.
#
# @param array $3
# Nome do array que será preenchido com o nome de cada seção que deve ser
# apresentada respeitando a ordem definida.
#
# @return void
mse_man_process_show_raw_rules() {

  declare -n mseArrRawRules="${1}"
  declare -n mseArrRealSectionNamesInOrder="${2}"
  declare -n mseArrSelectedSectionNames="${3}"


  declare -a mseArrTmpSelectedSectionsNames=()
  local mseSecMascName=""
  local mseSecRealName=""
  local mseSecSelectName=""



  for mseSecMascName in "${mseArrRawRules[@]}"; do
    unset mseTmpSecMascNameParts
    declare -a mseTmpSecMascNameParts=()

    mse_str_split "mseTmpSecMascNameParts" "_" "${mseSecMascName}"



    for mseSecRealName in "${mseArrRealSectionNamesInOrder[@]}"; do
      unset mseTmpSecRealNameParts
      declare -a mseTmpSecRealNameParts=()

      mse_str_split "mseTmpSecRealNameParts" "_" "${mseSecRealName}"



      local i=""
      local j=""
      local iMax="${#mseTmpSecRealNameParts[@]}"
      local jMax="${#mseTmpSecMascNameParts[@]}"

      if [ "${jMax}" -lt "${iMax}" ]; then
        for ((i=jMax; i<iMax; i++)); do
          mseTmpSecMascNameParts[$i]="*"
        done
      fi



      unset mseSectionNameJoin
      declare -a mseSectionNameJoin=()
      local mseHasMatch="0"

      for ((i=0; i<iMax; i++)); do
        if [ "${i}" == "0" ] || [ "${mseHasMatch}" == "1" ]; then
          mseHasMatch="0"

          for ((j=i; j<iMax; j++)); do
            if [ "${mseTmpSecRealNameParts[$i]}" == "${mseTmpSecMascNameParts[$j]}" ] || [ "${mseTmpSecMascNameParts[$i]}" == "*" ]; then
              mseSectionNameJoin+=("${mseTmpSecRealNameParts[$j]}")
              mseHasMatch="1"
              break
            fi
          done
        fi
      done

      if [ "${#mseSectionNameJoin[@]}" == "${iMax}" ]; then
        mseSectionNameJoin=$(mse_str_join "_" "mseSectionNameJoin")
        mseArrTmpSelectedSectionsNames+=("${mseSectionNameJoin}")
      fi
    done
  done



  for mseSecRealName in "${mseArrRealSectionNamesInOrder[@]}"; do
    for mseSecSelectName in "${mseArrTmpSelectedSectionsNames[@]}"; do
      if [ "${mseSecRealName}" == "${mseSecSelectName}" ]; then
        mseArrSelectedSectionNames+=("${mseSecSelectName}")
        break
      fi
    done
  done
}