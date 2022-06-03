#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Cria um código de estilo de cores para textos em conformidade com os
# parametros informados.
#
# @param string $1
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
#    2      : DARK        : Escurecido
#    3      : ITALIC      : Itálico
#    4      : UNDERLINE   : Sublinhado
#    5      : BLINKS      : Piscando (lento)
#    6      : BLINKF      : Piscando (rápido)
#    7      : REVERSE     : Inverte a seleção de cor de fonte e cor de fundo
#    8      : HIDE        : Oculto
#    9      : STRIKE      : Riscado
#
#   21      : RBOLD       : Remove Negrito
#   22      : RDARK       : Remove Escurecido
#   23      : RITALIC     : Remove Itálico
#   24      : RUNDERLINE  : Remove Sublinhado
#   25      : RBLINKS     : Remove Piscando (lento)
#   26      : RBLINKF     : Remove Piscando (rápido)
#   27      : RREVERSE    : Remove Inversão
#   28      : RHIDE       : Remove Oculto
#   29      : RSTRIKE     : Remove Riscado
#
# Valores considerados inválidos serão ignorados.
#
#
# @param string|int $3
# Cor do fundo a ser usada. O valor a ser descrito varia conforme o tipo
# do sistema de cores selecionado.
#
# Sistema 4 bits
# Neste caso você pode usar o código ou o nome da cor conforme a tabela abaixo:
#
#   Código  : Nome        : Efeito
#   49      : NONE        : Reseta a cor do fundo (valor padrão).
#
#   Paleta Normal
#   40      : BLACK       : Preto
#   41      : RED         : Vermelho
#   42      : GREEN       : Verde
#   43      : YELLOW      : Amarelo
#   44      : BLUE        : Azul
#   45      : PURPLE      : Púrpura
#   46      : CYAN        : Ciano
#   47      : WHITE       : Branco
#
#   Paleta Light / Luminosa
#   100     : LBLACK      : Preto
#   101     : LRED        : Vermelho
#   102     : LGREEN      : Verde
#   103     : LYELLOW     : Amarelo
#   104     : LBLUE       : Azul
#   105     : LPURPLE     : Púrpura
#   106     : LCYAN       : Ciano
#   107     : LWHITE      : Branco
#
#
# Sistema de 8 bits
# Informe um valor entre 0 e 255 para a cor desejada.
# O valor padrão neste caso é "0" (preto)
#
# Sistema de 32 bits
# Informe um valor entre 0 e 255 para cada um dos vetores R, G e B separados
# por ";".
# O valor padrão neste caso é "0;0;0" (preto)
#
# Valores considerados inválidos serão revertidos para o valor padrão de cada
# sistema.
#
#
# @param string|int $4
# Cor da fonte a ser usada. O valor a ser descrito varia conforme o tipo
# do sistema de cores selecionado.
#
# Sistema de 4 bits
# Neste caso você pode usar o código ou o nome da cor conforme a tabela abaixo:
# Obs: a versão 'DARK' das cores é uma implementação não padrão e funciona
# apenas como um 'wrapper' para definir a referida cor com o atributo DARK.
#
#   Código  : Nome        : Efeito
#   39      : NONE        : Reseta a cor do fundo (valor padrão).
#
#   Paleta Normal
#   30      : BLACK       : Preto
#   31      : RED         : Vermelho
#   32      : GREEN       : Verde
#   33      : YELLOW      : Amarelo
#   34      : BLUE        : Azul
#   35      : PURPLE      : Púrpura
#   36      : CYAN        : Ciano
#   37      : WHITE       : Branco
#
#   Paleta Normal + Atributo Dark
#   230     : DBLACK      : Preto
#   231     : DRED        : Vermelho
#   232     : DGREEN      : Verde
#   233     : DYELLOW     : Amarelo
#   234     : DBLUE       : Azul
#   235     : DPURPLE     : Púrpura
#   236     : DCYAN       : Ciano
#   237     : DWHITE      : Branco
#
#   Paleta Light / Luminosa
#   90      : LBLACK      : Preto
#   91      : LRED        : Vermelho
#   92      : LGREEN      : Verde
#   93      : LYELLOW     : Amarelo
#   94      : LBLUE       : Azul
#   95      : LPURPLE     : Púrpura
#   96      : LCYAN       : Ciano
#   97      : LWHITE      : Branco
#
#   Paleta Light / Luminosa + Atributo Dark
#   290     : LDBLACK     : Preto
#   291     : LDRED       : Vermelho
#   292     : LDGREEN     : Verde
#   293     : LDYELLOW    : Amarelo
#   294     : LDBLUE      : Azul
#   295     : LDPURPLE    : Púrpura
#   296     : LDCYAN      : Ciano
#   297     : LDWHITE     : Branco
#
#
# Sistema de 8 bits
# Informe um valor entre 0 e 255 para a cor desejada.
# O valor padrão neste caso é "255" (branco)
#
# Sistema 32 bits
# Informe um valor entre 0 e 255 para cada um dos vetores R, G e B separados
# por ";".
# O valor padrão neste caso é "255;255;255" (branco)
#
# Valores considerados inválidos serão revertidos para o valor padrão de cada
# sistema.
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
#   result=$(mse_exec_ifValidate mse_font_createStyle "4" "BOLD" "DWHITE" "LBLUE")
#   printf "${result}Formatado conforme eu queria"
mse_font_createStyle() {
  local mseUseColorSystem
  local mseAttributes
  local mseBGColor
  local mseFGColor
  local mseReturnLikeCode


  local mseTmpCanSet=0
  local mseTmpATCode="${2^^}"
  local mseTmpBGCode="${3^^}"
  local mseTmpFGCode="${4^^}"

  local i
  local mseLength
  local mseUParam
  local mseIsCode
  local mseIsCheck


  if [ $# -ge 4 ]; then

    mseReturnLikeCode="0"
    if [ $# -ge 5 ] && [ "$5" == "1" ]; then
      mseReturnLikeCode="1"
    fi



    #
    # Identifica o sistema de cor a ser usado e as cores padrões
    # conforme o tipo.
    mseUseColorSystem="4"
    mseBGColor="49"
    mseFGColor="39"
    if [ "$1" == "8" ]; then
      mseUseColorSystem="$1"
      mseBGColor="0"
      mseFGColor="255"
    elif [ "$1" == "32" ]; then
      mseUseColorSystem="$1"
      mseBGColor="0;0;0"
      mseFGColor="255;255;255"
    fi



    #
    # Identifica se está usando cores com o atributo 'Dark'
    if [ "$mseUseColorSystem" == "4" ]; then
      local mseUseDark=0

      if [ "${mseTmpBGCode:0:1}" == "D" ]; then
        mseTmpBGCode="${mseTmpBGCode:1}"
      fi
      if [ "${mseTmpFGCode:0:1}" == "D" ]; then
        mseUseDark=1
        mseTmpFGCode="${mseTmpFGCode:1}"
      fi


      if [ "${mseUseDark}" == "0" ]; then
        mseIsCode=$(mse_check_isInteger "${mseTmpFGCode}")
        if [ "${mseIsCode}" == "1" ] && [ "${mseTmpFGCode}" -gt 200 ]; then
          mseUseDark=1
          ((mseTmpFGCode=mseTmpFGCode-200))
        fi
      fi

      if [ "${mseUseDark}" == "1" ]; then
        if [ "${mseTmpATCode}" != "" ]; then
          mseTmpATCode+=","
        fi
        mseTmpATCode+="DARK"
      fi
    fi



    #
    # Verifica os atributos que devem ser aplicados no estilo
    mseAttributes="20"
    if [ "$mseTmpATCode" != "" ]; then
      declare -a mseValidAttr
      local mseTmpAttr


      #
      # Esplita os atributos definidos e verifica quais são válidos
      mse_str_split "," "${mseTmpATCode}"
      for mseUParam in "${MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}"; do
        if [ "${mseUParam}" != "" ]; then
          mseTmpAttr=""

          mseUParam=$(mse_str_trim "${mseUParam}")
          mseIsCode=$(mse_check_isInteger "${mseUParam}")

          #
          # Tratando-se de um código numérico, verifica se ele é válido
          if [ "${mseIsCode}" == "1" ]; then
            mseIsCheck=$(mse_check_hasValueInArray "${mseUParam}" "MSE_MD_ICOLOR_AVAILABLE_FONT_ATTRIBUTE_CODES")
            if [ "${mseIsCheck}" == "1" ]; then
              mseTmpAttr="${mseUParam}"
            fi
          else
            #
            # Tratando-se de uma string, verifica se ela aponta para o nome
            # de um dos atributos registrados.
            mseLength=${#MSE_MD_ICOLOR_AVAILABLE_FONT_ATTRIBUTE_NAMES[@]}
            for (( i=0; i<mseLength; i++)); do
              if [ "${mseUParam}" == "${MSE_MD_ICOLOR_AVAILABLE_FONT_ATTRIBUTE_NAMES[$i]}" ]; then
                mseTmpAttr="${MSE_MD_ICOLOR_AVAILABLE_FONT_ATTRIBUTE_CODES[$i]}"
                break
              fi
            done
          fi


          if [ "${mseTmpAttr}" != "" ]; then
            #
            # Verifica se não há duplicidade antes de adicionar
            mseIsCheck=$(mse_check_hasValueInArray "${mseTmpAttr}" "mseValidAttr")
            if [ "${mseIsCheck}" == "0" ]; then
              mseValidAttr+=("${mseTmpAttr}")
            fi
          fi
        fi
      done


      if [ "${#mseValidAttr[@]}" -ge "1" ]; then
        mseAttributes=$(mse_str_join ";" "mseValidAttr")
      fi
    fi



    #
    # Verifica a cor de fundo que deve ser usada.
    if [ "$mseTmpBGCode" != "" ]; then
      mseIsCode=$(mse_check_isInteger "${mseTmpBGCode}")

      #
      # Conforme o tipo de sistema de cor sendo utilizado
      case "${mseUseColorSystem}" in
        4)

          #
          # Sistema 4 bits
          #
          # Tratando-se de um código numérico, verifica se ele é válido
          if [ "${mseIsCode}" == "1" ]; then
            mseIsCheck=$(mse_check_hasValueInArray "${mseTmpBGCode}" "MSE_MD_ICOLOR_AVAILABLE_BGCOLOR_CODES")
            if [ "${mseIsCheck}" == "1" ]; then
                mseBGColor="${mseTmpBGCode}"
            fi
          else
            #
            # Tratando-se de uma string, verifica se ela aponta para o nome
            # de uma das cores registradas.
            mseLength=${#MSE_MD_ICOLOR_AVAILABLE_COLOR_NAMES[@]}
            for (( i=0; i<mseLength; i++)); do
              if [ "${mseTmpBGCode}" == "${MSE_MD_ICOLOR_AVAILABLE_COLOR_NAMES[$i]}" ]; then
                mseBGColor="${MSE_MD_ICOLOR_AVAILABLE_BGCOLOR_CODES[$i]}"
                break
              fi
            done
          fi

        ;;

        8)

          #
          # Sistema de 8 bits
          #
          # verifica se o código está dentro do intervalo aceitável
          if [ "${mseIsCode}" == "1" ]; then
            if [ "${mseTmpBGCode}" -ge 0 ] && [ "${mseTmpBGCode}" -le 255 ]; then
              mseBGColor="48;5;${mseTmpBGCode}"
            fi
          fi

        ;;

        32)

          #
          # Sistema de 32 bits
          #
          # Verifica se o código fornecido é válido
          # Para isto ele precisa ter uma definição para cada um dos
          # vetores (R, G, B) e estes precisam estar no intervalo aceito que
          # é entre 0 e 255
          mse_str_split ";" "${mseTmpBGCode}"
          if [ "${#MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}" == "3" ]; then
            local mseIsValid=1

            for mseUParam in "${MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}"; do
              mseIsCode=$(mse_check_isInteger "${mseUParam}")

              if [ "${mseIsCode}" == "0" ] || [ "${mseUParam}" -lt 0 ] || [ "${mseUParam}" -gt 255 ]; then
                mseIsValid=0
              fi
            done

            #
            # Apenas se o código RGB é válido
            if [ "${mseIsValid}" == "1" ]; then
              mseBGColor="48;2;${mseTmpBGCode}"
            fi
          fi

        ;;
      esac

    fi



    #
    # Verifica a cor da fonte que deve ser usada.
    if [ "$mseTmpFGCode" != "" ]; then
      mseIsCode=$(mse_check_isInteger "${mseTmpFGCode}")

      #
      # Conforme o tipo de sistema de cor sendo utilizado
      case "${mseUseColorSystem}" in
        4)

          #
          # Sistema de 4 bits
          #
          # Tratando-se de um código numérico, verifica se ele é válido
          if [ "${mseIsCode}" == "1" ]; then
            mseIsCheck=$(mse_check_hasValueInArray "${mseTmpFGCode}" "MSE_MD_ICOLOR_AVAILABLE_COLOR_CODES")
            if [ "${mseIsCheck}" == "1" ]; then
              mseFGColor="${mseTmpFGCode}"
            fi
          else
            #
            # Tratando-se de uma string, verifica se ela aponta para o nome
            # de uma das cores registradas.
            mseLength=${#MSE_MD_ICOLOR_AVAILABLE_COLOR_NAMES[@]}
            for (( i=0; i<mseLength; i++)); do
              if [ "${mseTmpFGCode}" == "${MSE_MD_ICOLOR_AVAILABLE_COLOR_NAMES[$i]}" ]; then
                mseFGColor="${MSE_MD_ICOLOR_AVAILABLE_COLOR_CODES[$i]}"
                break
              fi
            done
          fi

        ;;

        8)

          #
          # Sistema de 8 bits
          #
          # verifica se o código está dentro do intervalo aceitável
          if [ "${mseIsCode}" == "1" ]; then
            if [ "${mseTmpFGCode}" -ge 0 ] && [ "${mseTmpFGCode}" -le 255 ]; then
              mseFGColor="38;5;${mseTmpFGCode}"
            fi
          fi

        ;;

        32)

          #
          # Sistema 32 bits
          #
          # Verifica se o código fornecido é válido
          # Para isto ele precisa ter uma definição para cada um dos
          # vetores (R, G, B) e estes precisam estar no intervalo aceito que
          # é entre 0 e 255
          mse_str_split ";" "${mseTmpFGCode}"
          if [ "${#MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}" == "3" ]; then
            local mseIsValid=1

            for mseUParam in "${MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}"; do
              mseIsCode=$(mse_check_isInteger "${mseUParam}")

              if [ "${mseIsCode}" == "0" ] || [ "${mseUParam}" -lt 0 ] || [ "${mseUParam}" -gt 255 ]; then
                mseIsValid=0
              fi
            done

            #
            # Apenas se o código RGB é válido
            if [ "${mseIsValid}" == "1" ]; then
              mseFGColor="38;2;${mseTmpFGCode}"
            fi
          fi

        ;;
      esac

    fi



    #
    # Imprime na tela conforme o retorno selecionado
    if [ "${mseReturnLikeCode}" == "1" ]; then
      printf "\e[%s;%s;%sm" "${mseAttributes}" "${mseBGColor}" "${mseFGColor}"
    else
      printf "e[%s;%s;%sm" "${mseAttributes}" "${mseBGColor}" "${mseFGColor}"
    fi
  fi

}





#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_font_createStyle_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=5
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="UseColorSystem :: r :: list :: 4"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0_labels"]="4, 8, 32"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0_values"]="4, 8, 32"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="Attributes :: r :: list"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1_labels"]="BOLD, DARK, ITALIC, UNDERLINE, BLINKS, BLINKF, REVERSE, HIDE, STRIKE, NONE, RBOLD, RDARK, RITALIC, RUNDERLINE, RBLINKS, RBLINKF, RREVERSE, RHIDE, RSTRIKE"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1_values"]="1, 2, 3, 4, 5, 6, 7, 8, 9, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="BGColor :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_3"]="FGColor :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_4"]="ReturnLikeCode :: o :: bool :: 0"
}
