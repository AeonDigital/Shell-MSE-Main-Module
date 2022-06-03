#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Mostra uma tabela de cores que o terminal está apto a utilizar
# para a estilização de fontes e fundo.
#
# @param int $1
# Sistema de cor.
# Há 3 sistemas de descrição de cores que podem ser usados conforme a
# compatibilidade do seu terminal.
# Escolha uma destas:
#
#   - 4   : Usa 4 bits para representação das cores (16 cores).
#           Este é o sistema mais comum entre os diversos terminais.
#   - 8   : Usa 8 bits para representação das cores (256 cores).
#   - 32  : Usa 32 bits para representação das cores (true color).
#
# Se omitido, ou, se fornecido um valor inválido, será usada a representação
# de 4 bits como padrão.
# Não há (no momento) amostragem preparada para uma coleção de 32 bits.
#
# @param string $2
# Indica o tipo de amostragem.
#   - fg    : Mostrará a tabela de cores focando na cor das fontes (padrão).
#   - bg    : Mostrará a tabela de cores focando nas cores de fundo.
#
# O valor 'fg' será automaticamente definido caso o conjunto de cores
# seja de o de 4 bits.
#
# @param int $3
# Opcional.
# Indique a quantidade de itens por linha que devem ser mostrados.
# Se omitido, assumirá o total de 12 itens por linha.
#
# @return
# Printa na tela uma tabela contendo o conjunto de cores selecionado.
mse_font_showColors() {
  local mseUseColorSystem
  local mseTableType
  local mseItensPerLine
  local mseItensPerLineIsSet

  local mseCheck



  #
  # Identifica o sistema de cor a ser usado e as cores padrões
  # conforme o tipo.
  mseUseColorSystem="4"
  if [ $# -ge 1 ]; then
    if [ "$1" == "8" ] || [ "$1" == "32" ]; then
      mseUseColorSystem="$1"
    fi
  fi

  #
  # Tipo de foco da tabela a ser mostrada.
  mseTableType="fg"
  if [ $# -ge 2 ]; then
    if [ "$2" == "bg" ]; then
      mseTableType="bg"
    fi
  fi

  #
  # Identifica o tanto de itens por linhas que devem ser mostrados.
  mseItensPerLine=12
  mseItensPerLineIsSet="4"
  if [ $# -ge 3 ]; then
    mseCheck="$(mse_check_isInteger $3)"
    if [ "${mseCheck}" == "1" ]; then
      if [ "$3" -le 4 ]; then
        mseItensPerLine="4"
      else
        mseItensPerLine="$3"
      fi
      mseItensPerLineIsSet="0"
    fi
  fi


  case "${mseUseColorSystem}" in
    4)
      local i
      local mseLength=${#MSE_MD_ICOLOR_AVAILABLE_COLOR_NAMES[@]}

      local mseColorLabel
      local mseColorName
      local mseColorVarName
      local mseColorCode
      local mseLine
      local mseRawTable

      mseRawTable="${lbl_font_showTextColors_TableHeaders}\n"

      for (( i=0; i<mseLength; i++)); do
        mseColorLabel=${MSE_MD_ICOLOR_AVAILABLE_COLOR_LABELS[$i]}
        mseColorName=${MSE_MD_ICOLOR_AVAILABLE_COLOR_NAMES[$i]}
        mseColorVarName="mse${mseColorName}"
        mseColorCode="\\${!mseColorVarName}"

        mseLine="${mseColorLabel}:${mseColorName}:${mseColorCode}:${!mseColorVarName}myShellEnv${mseNONE} \n"
        mseRawTable+="${mseLine}"
      done

      printf "\n"

      mseRawTable=$(printf "${mseRawTable}")
      mseRawTable=$(sed 's/^\s*//g' <<< "${mseRawTable}" | sed 's/\s*$//g' | sed 's/\s*:/:/g' | sed 's/:\s*/:/g')
      column -e -t -s ":" <<< "${mseRawTable}"

      printf "\n"

    ;;

    8)

      local mseColorSet=255
      local mseColorCodeMaxLength=($(eval echo {0..$mseColorSet}))

      local mseColorIndex
      local mseColorNumber=0
      local mseColorMod=0
      local mseStrColorNumber
      local mseNewLine


      printf "\n"
      for mseColorIndex in "${mseColorCodeMaxLength[@]}"; do
        mseNewLine=0

        if [ "$mseColorIndex" -lt 10 ]; then
          mseStrColorNumber="  ${mseColorIndex}"
        elif [ "$mseColorIndex" -lt 100 ]; then
          mseStrColorNumber=" ${mseColorIndex}"
        else
          mseStrColorNumber="${mseColorIndex}"
        fi

        if [ "$mseTableType" == "fg" ]; then
          printf "\e[38;5;%sm  %s  ${mseNONE}" ${mseColorIndex} "${mseStrColorNumber}"
        elif [ "$mseTableType" == "bg" ]; then
          printf "\e[48;5;%sm  %s  ${mseNONE}" ${mseColorIndex} "${mseStrColorNumber}"
        fi

        ((mseColorNumber=mseColorIndex+1))
        ((mseColorMod=mseColorNumber % mseItensPerLine))
        if [ "${mseColorMod}" == "${mseItensPerLineIsSet}" ]; then
          printf "\n"
          mseNewLine=1
        fi
      done

      if [ "${mseNewLine}" == 0 ]; then
        printf "\n"
      fi

      printf "\n${lbl_font_showTextColors_UseCodeExample}"
      if [ "$mseTableType" == "fg" ]; then
        printf "%s" "\\e[38;5;Xm"
      elif [ "$mseTableType" == "bg" ]; then
        printf "%s" "\\e[48;5;Xm"
      fi

      printf "\n\n"

    ;;
  esac
}





#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_font_showColors_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=3
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="UseColorSystem :: r :: list :: 4"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0_labels"]="4, 8, 32"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0_values"]="4, 8, 32"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="TableType :: o :: list :: fg"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1_labels"]="fg, bg"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1_values"]="fg, bg"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="ItensPerLine :: o :: int :: 12"
}
