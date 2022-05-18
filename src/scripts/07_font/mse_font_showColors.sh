#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Mostra uma tabela de cores que o terminal está apto a utilizar
# para a estilização de fontes e fundo.
#
# @param string $1
# Indica o tipo de amostragem.
#   - fg    : Mostrará a tabela de cores focando na cor das fontes (padrão).
#   - bg    : Mostrará a tabela de cores focando nas cores de fundo.
#
# O valor 'fg' será automaticamente definido caso o conjunto de cores (abaixo)
# seja de o de 16 cores.
#
# @param int $2
# Conjunto de cores.
#
# A maioria dos terminais suporta um sistema mínimo de 16 cores.
# Cada uma destas cores tem um 'nome' definido dentro do 'MSE' e pode ser
# evocada para uso nos scripts usando uma variável de nome análogo.
#
# Omita este parametro ou use o valor '16' para conhecer estas cores básicas,
# seus códigos de uso, nome e variáveis.
#
# Qualquer valor entre 17 e 256 irá mostrar uma tabela contendo a formatação
# genérica para aquele total de cores que devem ser mostrados.
#
# @param int $3
# Opcional.
# Usado para amostragem de um conjunto maior que 16 cores.
# Indique a quantidade de itens por linha que devem ser mostrados.
# Se omitido, assumirá o total de 12 itens por linha.
#
# @return
# Printa na tela uma tabela contendo o conjunto de cores selecionado.
mse_font_showColors() {
  local mseTableType
  local mseColorSet
  local mseItensPerLine
  local mseItensPerLineIsSet
  local mseCheck


  mseTableType="fg"
  if [ "$#" -ge 1 ]; then
    if [ "$1" == "fg" ] || [ "$1" == "bg" ]; then
      mseTableType="$1"
    fi
  fi


  mseColorSet="16"
  if [ "$#" -ge 2 ]; then
    mseCheck="$(mse_check_isInteger $2)"

    if [ "${mseCheck}" == "0" ] || [ "$2" -le "16" ]; then
      mseTableType="fg"
    else
      mseColorSet="$2"
    fi
  fi


  mseItensPerLine="12"
  mseItensPerLineIsSet="4"
  if [ "$#" -ge 3 ]; then

    mseCheck="$(mse_check_isInteger $3)"
    if [ "${mseCheck}" == "1" ]; then
      if [ "$3" -le 4 ]; then
        mseItensPerLine="4"
      else
        mseItensPerLine="$3"
        mseItensPerLineIsSet="0"
      fi
    fi
  fi




  if [ "$mseColorSet" == "16" ]; then
    local i
    local mseLength=${#MSE_MD_ICOLOR_AVAILABLE_COLOR_NAMES[@]}

    local mseColorName
    local mseColorRaw
    local mseColorVar
    local mseColorCod
    local mseLine
    local mseRawTable

    mseRawTable="${lbl_font_showTextColors_TableHeaders}\n"

    for (( i=0; i<mseLength; i++)); do
      mseColorName=${MSE_MD_ICOLOR_AVAILABLE_COLOR_LABELS[$i]}
      mseColorRaw=${MSE_MD_ICOLOR_AVAILABLE_COLOR_NAMES[$i]}
      mseColorVar="mse${mseColorRaw}"
      mseColorCod="\\${!mseColorVar}"

      mseLine="${mseColorName}:${mseColorRaw}:${mseColorCod}:${!mseColorVar}myShellEnv${mseNONE} \n"
      mseRawTable+="${mseLine}"
    done

    printf "\n"

    mseRawTable=$(printf "${mseRawTable}")
    mseRawTable=$(sed 's/^\s*//g' <<< "${mseRawTable}" | sed 's/\s*$//g' | sed 's/\s*:/:/g' | sed 's/:\s*/:/g')
    column -e -t -s ":" <<< "${mseRawTable}"

    printf "\n"

  elif [ "$mseColorSet" -gt "16" ]; then

    ((mseColorSet=mseColorSet-1))
    if [ "$mseColorSet" -ge "256" ]; then
      mseColorSet="255"
    fi
    local mseColorCodeMaxLength=($(eval echo {0..$mseColorSet}))

    local mseColorIndex
    local mseColorNumber
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

  fi
}





#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_font_showColors_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=2
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="TableType :: o :: list"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0_labels"]="fg, bg"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0_values"]="fg, bg"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="ColorSet :: o :: int :: 16 :: 16 :: 256"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="ItensPerLine :: o :: int :: 8"
}
