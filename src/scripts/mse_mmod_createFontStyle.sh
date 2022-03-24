#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Cria um código de estilo de cores para textos em conformidade com os
# parametros informados.
#
# @param string $1
# Cor da fonte
#
# @param string $2
# Cor do fundo
#
# @param string $3
# Atributo a ser usado (opcional).
#
# @example
#   result=$(mse_mmod_createFontStyle 'DGREY' 'LBLUE')
#   printf "${result}Formatado conforme eu queria${NONE}"
mse_mmod_createFontStyle() {
  if [ $# != 2 ] && [ $# != 3 ]; then
    mse_mmod_errorAlert "${FUNCNAME[0]}" "${lbl_genericError_lostArgument}"
  else

    local i
    local mseLength
    local mseFont
    local mseBackGround
    local mseAttribute='0'

    local mseUParam
    local mseIsValid=0


    #
    # Resgata a cor da fonte a ser usada
    mseLength=${#MSE_MD_ICOLOR_AVAILABLE_COLOR_NAMES[@]}
    mseUParam=$(printf "$1" | awk '{print toupper($0)}')
    mseIsValid=0

    for (( i=0; i<mseLength; i++)); do
      if [ "${mseUParam}" == "${MSE_MD_ICOLOR_AVAILABLE_COLOR_NAMES[$i]}" ]; then
        mseFont=${MSE_MD_ICOLOR_AVAILABLE_COLOR_CODES[$i]}
        mseIsValid=1
      fi
    done


    #
    # Apenas se a cor da fonte é válida...
    if [ mseIsValid == 0 ]; then
      mse_mmod_errorAlert "${FUNCNAME[0]}" "${lbl_genericError_invalidValue} 1" "${lbl_genericError_checkValidOptionsIn} mse_mmod_showFontColors"
    else

      #
      # Resgata a cor do fundo a ser usada
      mseLength=${#MSE_MD_ICOLOR_AVAILABLE_COLOR_NAMES[@]}
      mseUParam=$(printf "$2" | awk '{print toupper($0)}')
      mseIsValid=0

      for (( i=0; i<mseLength; i++)); do
        if [ "${mseUParam}" == "${MSE_MD_ICOLOR_AVAILABLE_COLOR_NAMES[$i]}" ]; then
          mseBackGround=${MSE_MD_ICOLOR_AVAILABLE_BGCOLOR_CODES[$i]}
          mseIsValid=1
        fi
      done


      #
      # Apenas se a cor de fundo for válida...
      if [ mseIsValid == 0 ]; then
        mse_mmod_errorAlert "${FUNCNAME[0]}" "${lbl_genericError_invalidValue} 2" "${lbl_genericError_checkValidOptionsIn} mse_mmod_showFontColors"
      else

        #
        # Caso o terceiro parametro tenha sido definido, verifica
        # se trata-se de um nome de atributo válido
        if [ $# == 3 ]; then
          mseLength=${#MSE_MD_ICOLOR_AVAILABLE_FONT_ATTRIBUTE_NAMES[@]}
          mseUParam=$(printf "$3" | awk '{print toupper($0)}')
          mseIsValid=0

          for (( i=0; i<mseLength; i++)); do
            if [ "${mseUParam}" == "${MSE_MD_ICOLOR_AVAILABLE_FONT_ATTRIBUTE_NAMES[$i]}" ]; then
              mseAttribute=${MSE_MD_ICOLOR_AVAILABLE_FONT_ATTRIBUTE_CODES[$i]}
              mseIsValid=1
            fi
          done
        fi


        #
        # Se o atributo indicado for válido...
        if [ mseIsValid == 0 ]; then
          mse_mmod_errorAlert "${FUNCNAME[0]}" "${lbl_genericError_invalidValue} 3" "${lbl_genericError_checkValidOptionsIn} mse_mmod_showFontAttributes"
        else
          printf '%s' '\e['"${mseAttribute}"';'"${mseFont}"';'"${mseBackGround}"'m'
        fi
      fi
    fi
  fi
}
