#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Exibe as informações referentes ao uso da função alvo como descrição de
# parâmetros a serem passados e seu respectivo retorno.
#
# Estas informações são pegas dos próprios arquivos de definição de cada
# função.
#
# Por padrão, o comando "less" é acionado para permitir a uma visualização
# mais agradável para o usuário.
#
# Uma descrição de uma função é identificada por uma linha no arquivo que
# inicie por "# @desc". A partir desta linha, todas serão capturadas até
# que alguma linha não seja o prosseguimento da mesma área de comentário.
#
# @param string $1
# Nome da função alvo.
#
# @param bool $2
# Indique se deseja printar o resultado do manual na tela. Neste caso o
# comando "less" não será acionado.
#   - Omita ou indique "1" para usar o "less"
#   - Indique "0" para printar o resultado no terminal.
#
# @return
# Informações de uso da função alvo.
mse_mmod_man() {
  local mseMSG
  local mseMetaData
  local msePathToFile


  #
  # Efetua as verificações quanto à função indicada.
  # Se ela existe,
  # Se ela consta nos metadados atualmente carregados.
  # Se o arquivo apontado nos metadados foi encontrado.
  if [ "$1" == "" ]; then
    mse_inter_alertUser "i" "" "${lbl_man_enterAFunction}"
  elif [ "$(type -t $1)" != "function" ]; then
    mseMSG=$(mse_str_replacePlaceHolder "${lbl_man_functionDoesNotExists}" "FUNCTION" "$1")
    mse_inter_alertUser "i" "" "${mseMSG}"

    mse_inter_setCursorPosition top 2
    mse_inter_alertUser "i" "" "${lbl_man_searchForAValidFunction}"
  else
    mseMetaData=$(mse_mmod_showRawMetaData 0 0 1 "" "" "$1" "1")

    if [ "${mseMetaData}" == "" ]; then
      mseMSG=$(mse_str_replacePlaceHolder "${lbl_man_couldNotFindHelpForFunction}" "FUNCTION" "$1")
      mse_inter_errorAlert "err" "${mseMSG}"
    else
      mse_str_split "::" "${mseMetaData}"


      if [ ! -f "${MSE_GLOBAL_MODULE_SPLIT_RESULT[4]}" ]; then
        mseMSG=$(mse_str_replacePlaceHolder "${lbl_man_fileOfFunctionNotFound}" "PATH" "${MSE_GLOBAL_MODULE_SPLIT_RESULT[4]}")
        mse_inter_errorAlert "err" "${mseMSG}"
      else
        msePathToFile="${MSE_GLOBAL_MODULE_SPLIT_RESULT[4]}"

        #
        # Verifica se há uma versão deste manual para a lingua atualmente setada
        local mseLocaleMan=$(mse_str_replace "/src/scripts/" "/src/locale/man/${MSE_GLOBAL_MODULE_LOCALE}/" "${msePathToFile}")
        if [ -f "${mseLocaleMan}" ]; then
          msePathToFile="${mseLocaleMan}"
        fi
      fi
    fi
  fi



  #
  # Se o arquivo alvo foi encontrado...
  if [ "${msePathToFile}" != "" ]; then
    local mseRawLine
    local mseInDescription=0
    declare -a mseDescriptionLines=()

    local mseTmpLine

    local i
    local mseLength
    local mseLinePart
    local mseNewMarkup

    local mseColorAt=$(mse_font_createStyle "4" "BOLD,DARK" "NONE" "BLUE" "1")
    local mseColorTagName=$(mse_font_createStyle "4" "BOLD,DARK" "NONE" "BLUE" "1")
    local mseColorTagCommom=$(mse_font_createStyle "4" "BOLD,DARK" "NONE" "LCYAN" "1")
    local mseColorParam=$(mse_font_createStyle "8" "BOLD" "NONE" "250" "1")


    while read mseRawLine || [ -n "${mseRawLine}" ]; do
      #
      # Identifica o início de uma descrição.
      # Apenas a primeira documentação de função encontrada será considerada.
      if [ "$mseRawLine" == "# @desc" ]; then
        if [ "${mseInDescription}" == "1" ]; then
          mseInDescription=0
          break
        else
          mseInDescription=1
          mseDescriptionLines+=("")
        fi
      fi



      #
      # Estando em uma descrição...
      if [ $mseInDescription == 1 ]; then
        if [ "${mseRawLine:0:1}" != "#" ]; then
          mseInDescription=0
          break
        else

          mseRawLine=$(mse_str_trim "${mseRawLine}")
          if [ "${mseRawLine}" == "#" ]; then
            mseDescriptionLines+=("")
          else
            #
            # Remove o marcador de comentário da linha
            mseTmpLine="${mseRawLine#"# "}"

            #
            # Sendo uma linha que contém uma marcação especial...
            if [ "${mseTmpLine:0:1}" == "@" ]; then
              mse_str_split " " "${mseTmpLine}"

              mseNewMarkup=""
              mseLength="${#MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}"
              for ((i=0; i<mseLength; i++)); do
                mseLinePart="${MSE_GLOBAL_MODULE_SPLIT_RESULT[$i]}"

                if [ "${mseLinePart:0:1}" == "@" ]; then
                  mseNewMarkup+="${mseColorAt}@${mseNONE}"
                  mseNewMarkup+="${mseColorTagName}${mseLinePart:1}${mseNONE} "
                elif [ "${mseLinePart:0:1}" == '$' ]; then
                  mseNewMarkup+="${mseColorParam}${mseLinePart}${mseNONE} "
                else
                  mseNewMarkup+="${mseColorTagCommom}${mseLinePart}${mseNONE} "
                fi
              done

              mseTmpLine=$(printf "${mseNewMarkup}")
            fi

            mseDescriptionLines+=("${mseTmpLine}")
          fi
        fi
      fi

    done < "$msePathToFile"


    if [ "${#mseDescriptionLines[@]}" == "0" ]; then
      mse_inter_errorAlert "err" "${lbl_man_noUsageDescriptionFoundForFunction}"
    else
      mseDescriptionLines+=("")
      local mseCod="MAN"
      local mseTtl="$1"

      if [ "$1" == "mse_mmod_help" ]; then
        mseCod="MSE"
        mseTtl="myShellEnv"
      fi

      local mseReturn=$(mse_inter_alertUser "a" "${mseCod}" "${mseTtl}" "mseDescriptionLines")
      if [ "$#" -ge 2 ] && [ "$2" == "0" ]; then
        printf "${mseReturn}\n"
      else
        printf "${mseReturn}" | less -r
      fi
    fi
  fi
}
MSE_GLOBAL_CMD["man"]="mse_mmod_man"
