#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Cria um código de estilo de cores para textos em conformidade com os
# parametros informados.
#
# @param bool $1
# Omita este valor ou indique "0" se deseja usar o sistema simplificado de 16
# cores ou "1" se deseja usar o sistema ampliado com uma matriz de cores cujos
# índices devem ser indicados entre 0 e 255.
#
#
# @param string|int $2
# Código ou nome do atributo de fonte a ser usado.
# Você pode definir mais de um valor bastando separá-los por virgula.
#
#   Código  : Nome        : Efeito
#   20      : NONE        : Reseta qualquer atributo definido (valor padrão).
#
#    1      : BOLD        : Negrito
#    2      : DIM         : Dim (simula uma cor 'translucida'/'enfraquecida')
#    4      : UNDERLINE   : Sublinhado
#    5      : BLINK       : Piscando
#    7      : INVERT      : Inverte a seleção de cor de fonte e cor de fundo
#    8      : HIDDEN      : Oculto
#
#   21      : RBOLD       : Remove Negrito
#   22      : RDIM        : Remove Dim
#   24      : RUNDERLINE  : Remove Sublinhado
#   25      : RBLINK      : Remove Piscando
#   27      : RINVERT     : Remove Inversão
#   28      : RHIDDEN     : Remove Oculto
#
# Valores considerados inválidos serão ignorados.
#
#
# @param string|int $3
# Cor do fundo a ser usada.
#
# Se o sistema de cores definido para ser usado é o simplificado (16 cores),
# você pode usar o código ou o nome da cor conforme a tabela abaixo:
#
#   Código  : Nome        : Efeito
#   49      : NONE        : Reseta a cor do fundo (valor padrão).
#
#   40      : BLACK       : Preto
#   41      : RED         : Vermelho
#   42      : GREEN       : Verde
#   43      : YELLOW      : Amarelo
#   44      : BLUE        : Azul
#   45      : PURPLE      : Púrpura
#   46      : CYAN        : Ciano
#   47      : LGRAY       : Cinza claro
#
#   100     : DGREY       : Cinza escuro
#   101     : LRED        : Vermelho claro
#   102     : LGREEN      : Verde claro
#   103     : LYELLOW     : Amarelo claro
#   104     : LBLUE       : Azul claro
#   105     : LPURPLE     : Púrpura claro
#   106     : LCYAN       : Ciano claro
#
# Se você está usando o sistema ampliado de cores basta informar um valor
# entre 0 e 255 para a cor desejada.
#
# Valores considerados inválidos serão revertidos para o valor padrão de cada
# sistema sendo "49" para o sistema simplificado e "0" (preto) para o sistema
# ampliado.
#
#
# @param string|int $4
# Cor da fonte a ser usada.
#
# Se o sistema de cores definido para ser usado é o simplificado (16 cores),
# você pode usar o código ou o nome da cor conforme a tabela abaixo:
#
#   Código  : Nome        : Efeito
#   39      : NONE        : Reseta a cor do fundo (valor padrão).
#
#   30      : BLACK       : Preto
#   31      : RED         : Vermelho
#   32      : GREEN       : Verde
#   33      : YELLOW      : Amarelo
#   34      : BLUE        : Azul
#   35      : PURPLE      : Púrpura
#   36      : CYAN        : Ciano
#   37      : LGRAY       : Cinza claro
#
#   90      : DGREY       : Cinza escuro
#   91      : LRED        : Vermelho claro
#   92      : LGREEN      : Verde claro
#   93      : LYELLOW     : Amarelo claro
#   94      : LBLUE       : Azul claro
#   95      : LPURPLE     : Púrpura claro
#   96      : LCYAN       : Ciano claro
#
# Se você está usando o sistema ampliado de cores basta informar um valor
# entre 0 e 255 para a cor desejada.
#
# Valores considerados inválidos serão revertidos para o valor padrão de cada
# sistema sendo "39" para o sistema simplificado e "255" (branco) para o
# sistema ampliado.
#
#
# @param bool $5
# Opcional.
# Indique "1" se deseja que o retorno seja um código do estilo criado pronto
# para ser usado.
# Omita ou indique "0" se deseja retornar apenas o código da cor como uma
# string
#
# @return
# Printa o código do estilo criado.
#
# @example
#   result=$(mse_exec_ifValidate mse_font_createStyle "0" "BOLD" "DGREY" "LBLUE")
#   printf "${result}Formatado conforme eu queria"
mse_font_createStyle() {
  local mseUseAdvancedColorSystem
  local mseFontAttributes
  local mseBGColor
  local mseFGColor
  local mseReturnLikeCode


  local i
  local mseLength
  local mseUParam
  local mseIsCode
  local mseIsCheck


  if [ "$#" -ge 4 ]; then

    #
    # Identifica o sistema de cor a ser usado.
    mseUseAdvancedColorSystem="0"
    mseBGColor="49"
    mseFGColor="39"
    if [ "$1" == "1" ]; then
      mseUseAdvancedColorSystem="1"
      mseBGColor="0"
      mseFGColor="255"
    fi


    mseReturnLikeCode="0"
    if [ "$#" -ge 5 ] && [ "$5" == "1" ]; then
      mseReturnLikeCode="1"
    fi



    #
    # Verifica os atributos que devem ser aplicados no estilo
    mseFontAttributes="20"
    if [ "$2" != "" ]; then
      declare mseValidAttr=()

      #
      # Esplita os atributos definidos e verifica quais são válidos
      mse_str_split "," "$2"
      for mseUParam in "${MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}"; do
        mseUParam=$(mse_str_trim "${mseUParam}")
        mseIsCode=$(mse_check_isInteger "${mseUParam}")

        #
        # Tratando-se de um código numérico, verifica se ele é válido
        if [ "${mseIsCode}" == "1" ]; then
          mseIsCheck=$(mse_check_hasValueInArray "${mseUParam}" "MSE_MD_ICOLOR_AVAILABLE_FONT_ATTRIBUTE_CODES")
          if [ "${mseIsCheck}" == "1" ]; then
              mseValidAttr+=("${mseUParam}")
          fi
        else
          #
          # Tratando-se de uma string, verifica se ela aponta para o nome
          # de um dos atributos registrados.
          mseLength=${#MSE_MD_ICOLOR_AVAILABLE_FONT_ATTRIBUTE_NAMES[@]}
          for (( i=0; i<mseLength; i++)); do
            if [ "${mseUParam^^}" == "${MSE_MD_ICOLOR_AVAILABLE_FONT_ATTRIBUTE_NAMES[$i]}" ]; then
              mseValidAttr+=("${MSE_MD_ICOLOR_AVAILABLE_FONT_ATTRIBUTE_CODES[$i]}")
            fi
          done
        fi
      done


      if [ "${#mseValidAttr[@]}" -ge "1" ]; then
        mseFontAttributes=$(mse_str_join ";" "mseValidAttr")
      fi
    fi



    #
    # Verifica a cor de fundo que deve ser usada.
    if [ "$3" != "" ]; then
      mseIsCode=$(mse_check_isInteger "${3}")

      #
      # Se estiver usando o sistema de cores simplificado (16 cores)
      if [ "${mseUseAdvancedColorSystem}" == "0" ]; then
        #
        # Tratando-se de um código numérico, verifica se ele é válido
        if [ "${mseIsCode}" == "1" ]; then
          mseIsCheck=$(mse_check_hasValueInArray "${3}" "MSE_MD_ICOLOR_AVAILABLE_BGCOLOR_CODES")
          if [ "${mseIsCheck}" == "1" ]; then
              mseBGColor="${3}"
          fi
        else
          #
          # Tratando-se de uma string, verifica se ela aponta para o nome
          # de uma das cores registradas.
          mseLength=${#MSE_MD_ICOLOR_AVAILABLE_COLOR_NAMES[@]}
          for (( i=0; i<mseLength; i++)); do
            if [ "${3^^}" == "${MSE_MD_ICOLOR_AVAILABLE_COLOR_NAMES[$i]}" ]; then
              mseBGColor="${MSE_MD_ICOLOR_AVAILABLE_BGCOLOR_CODES[$i]}"
            fi
          done
        fi

      else
        #
        # Senão, tratando-se de um código de uma cor para ser usado com o sistema expandido
        # verifica se o código está dentro do intervalo aceitável
        if [ "${mseIsCode}" == "1" ]; then
          if [ "${3}" -ge 0 ] && [ "${3}" -le 255 ]; then
            mseBGColor="48;5;${3}"
          fi
        fi
      fi
    fi



    #
    # Verifica a cor da fonte que deve ser usada.
    if [ "$4" != "" ]; then
      mseIsCode=$(mse_check_isInteger "${4}")

      #
      # Se estiver usando o sistema de cores simplificado (16 cores)
      if [ "${mseUseAdvancedColorSystem}" == "0" ]; then
        #
        # Tratando-se de um código numérico, verifica se ele é válido
        if [ "${mseIsCode}" == "1" ]; then
          mseIsCheck=$(mse_check_hasValueInArray "${4}" "MSE_MD_ICOLOR_AVAILABLE_COLOR_CODES")
          if [ "${mseIsCheck}" == "1" ]; then
              mseFGColor="${4}"
          fi
        else
          #
          # Tratando-se de uma string, verifica se ela aponta para o nome
          # de uma das cores registradas.
          mseLength=${#MSE_MD_ICOLOR_AVAILABLE_COLOR_NAMES[@]}
          for (( i=0; i<mseLength; i++)); do
            if [ "${4^^}" == "${MSE_MD_ICOLOR_AVAILABLE_COLOR_NAMES[$i]}" ]; then
              mseFGColor="${MSE_MD_ICOLOR_AVAILABLE_COLOR_CODES[$i]}"
            fi
          done
        fi

      else
        #
        # Senão, tratando-se de um código de uma cor para ser usado com o sistema expandido
        # verifica se o código está dentro do intervalo aceitável
        if [ "${mseIsCode}" == "1" ]; then
          if [ "${4}" -ge 0 ] && [ "${4}" -le 255 ]; then
            mseFGColor="38;5;${4}"
          fi
        fi
      fi
    fi



    #
    # Imprime na tela conforme o retorno selecionado
    if [ "${mseReturnLikeCode}" == "1" ]; then
      printf "\e[%s;%s;%sm" "${mseFontAttributes}" "${mseBGColor}" "${mseFGColor}"
    else
      printf "e[%s;%s;%sm" "${mseFontAttributes}" "${mseBGColor}" "${mseFGColor}"
    fi
  fi

}





#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_font_createStyle_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=5
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="UseAdvancedColorSystem :: r :: bool :: 1"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="FontAttributes :: r :: list"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1_labels"]="BOLD, DIM, UNDERLINE, BLINK, INVERT, HIDDEN, NONE, RBOLD, RDIM, RUNDERLINE, RBLINK, RINVERT, RHIDDEN"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1_values"]="1, 2, 4, 5, 7, 8, 20, 21, 22, 24, 25, 27, 28"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="BGColor :: r :: int :: 0 :: 0 :: 255"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_3"]="FGColor :: r :: int :: 0 :: 0 :: 255"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_4"]="ReturnLikeCode :: o :: bool :: 0"
}
