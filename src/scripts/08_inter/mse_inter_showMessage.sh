#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Permite mostrar uma mensagem para o usuário oferecendo uma série de recursos
# padronizados para a montagem de uma interface padrão para seus scripts.
#
#
#
# @param string $1
# Tipo de mensagem.
#
#   - ""        | ""  : Não definido (valor padrão).
#   - none      | n   : Não definido (mesmo que acima).
#   - info      | i   : Informação genérica.
#   - attention | a   : Atenção.
#   - warning   | w   : Alerta.
#   - error     | e   : Erro em uma operação.
#   - fail      | f   : Falha em uma operação.
#   - success   | s   : Sucesso em uma operação.
#
# @param string $2
# Configuração especial.
# Pode ser o nome de uma função que possui uma formatação especial para a
# mensagem ou um outro valor qualquer que pode ser usado para alguma definição
# especial do tema escolhido
#
#
#
# @param bool $3
# Mostrar título.
# Use "0" para omitir o título.
# Use "1" para mostrar o título.
#
# @param bool $4
# Tipo do título.
#
# Abaixo segue uma lista dos tipos disponíveis para seleção.
# Na primeira linha está o código e uma breve descrição do tipo. Na linha
# imediatamente abaixo há um exemplo ddo respectivo modelo.
#
#   O código {ic_x} indica o início de uma área colorida.
#   No lugar do 'x' será usado um número que identifica uma cor.
#   O código {ec} indica o final da área colorida.
#
#   - 1   : Título simples (padrão)
#           {ic_1}Texto de título{ec}
#
#   - 2   : Título com 2 informações monocolor.
#           {ic_1}[ info_1 ] info_2{ec}
#           No texto do título cada uma das informações indicadas acima
#           devem vir separadas por '::'
#
#   - 3   : Título com 2 informações bicolor.
#           [ {ic_1}info_1{ec} ] {ic_2}info_2{ec}
#           No texto do título cada uma das informações indicadas acima
#           devem vir separadas por '::'
#
# A cor de cada área varia conforme o tema selecionado.
# Se o valor indicado não for válido, ou, se durante a formatação do título
# for identificada alguma inconsistência, reverterá o tipo do título para o
# valor padrão "1".
#
# @param string $5
# Separador de topo.
# Aparece acima da primeira linha da mensagem.
#
# @param bool $6
# Indica se deve ou não permitir a colorização do separador de topo.
# Use "0" para não.
# Use "1" para sim.
#
# @param string $7
# Indentação para o título.
# Use apenas espaços em branco.
# Deixe vazio para não usar.
#
# @param string $8
# Bullet para o título.
# Deixe vazio para não usar.
#
# @param bool $9
# Indica se deve ou não permitir a colorização do bullet do título.
# Use "0" para não.
# Use "1" para sim.
#
# @param string $10
# Título da mensagem.
# Se "", usará o título padrão conforme o tipo de mensagem, ou, deixará a linha
# do título vazia em caso de tipo de mensagem "none".
#
# @param bool $11
# Indica se deve ou não permitir a colorização do título.
# Use "0" para não.
# Use "1" para sim.
#
# @param string $12
# Separador entre título e corpo da mensagem.
# Use apenas "\n" caso queira apenas adicionar um ou mais espaços em branco.
# Outras opções são adicionar separadores gráficos como uma linha de "-" ou "="
# ou outro caracter de sua preferencia.
#
# @param bool $13
# Indica se deve ou não permitir a colorização do separador do título.
# Use "0" para não.
# Use "1" para sim.
#
#
#
# @param bool $14
# Mostrar o corpo da mensagem.
# Use "0" para omitir o corpo da mensagem.
# Use "1" para mostrar o corpo da mensagem.
#
# @param string $15
# Indentação para a primeira linha do corpo da mensagem.
# Use apenas espaços em branco.
# Deixe vazio para não usar.
#
# @param string $16
# Bullet para a primeira linha do corpo da mensagem.
# Deixe vazio para não usar.
#
# @param bool $17
# Indica se deve ou não permitir a colorização do bullet da primeira linha do
# corpo da mensagem.
# Use "0" para não.
# Use "1" para sim.
#
# @param string $18
# Indentação para a segunda linha em diante do corpo da mensagem.
# Use apenas espaços em branco.
# Deixe vazio para não usar.
#
# @param string $19
# Bullet para a segunda linha em diante do corpo da mensagem.
# Deixe vazio para não usar.
#
# @param bool $20
# Indica se deve ou não permitir a colorização do bullet da segunda linha em
# diante do corpo da mensagem.
# Use "0" para não.
# Use "1" para sim.
#
#
#
# @param string $21
# Nome de um array unidimensional em que estão as frases que devem ser
# usadas para montar o corpo da mensagem.
#
# @param bool $22
# Indica se deve ou não permitir a colorização do corpo da mensagem.
# Use "0" para não.
# Use "1" para sim.
#
# @param string $23
# Separador entre o corpo da mensagem e a próxima linha do prompt do terminal.
# Use apenas "\n" caso queira apenas adicionar um ou mais espaços em branco.
# Outras opções são adicionar separadores gráficos como uma linha de "-" ou "="
# ou outro caracter de sua preferencia.
#
# @param bool $24
# Indica se deve ou não permitir a colorização do separador do título.
# Use "0" para não.
# Use "1" para sim.
#
#
#
# @param string $25
# Nome da função/tema usada para renderizar as mensagens a serem mostradas
# na tela.
#
#
#
# Observação 01:
# A real aplicabilidade de cor em cada uma das partes depende do tema
# selecionado. Então, indicar que se deseja aplicar cor a todo o título implica
# em informar ao formatador do tema selecionado que ele pode aplicar cores em
# todos os elementos que ele está apto a fazê-lo.
#
# Observação 02:
# A cor de cada parte é definida conforme o "tema" selecionado para a mensagem.
# Se uma cor for definida diretamente na referida parte, estas, se sobreporão
# ao que é indicado pelo "tema" selecionado.
#
#
#
# @return
# Printa na tela as informações desejadas conforme configuração passada.
mse_inter_showMessage() {
  MSE_GLOBAL_LASTERR=""
  unset MSE_GLOBAL_SHOW_MESSAGE_CONFIG
  declare -gA MSE_GLOBAL_SHOW_MESSAGE_CONFIG

  #
  # Apenas se todos os parametros foram passados
  if [ $# -lt 25 ]; then
    local mseArgs="$#"
    local mseLost
    ((mseLost=25-mseArgs))

    MSE_GLOBAL_LASTERR="Lost ${mseLost} arguments."
  else

    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["MessageType"]="${1}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["CustomSpecification"]="${2}"

    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["DisplayTitle"]="${3}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleType"]="${4}"

    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TopSeparatorTitle"]="${5}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TopSeparatorTitleColor"]="${6}"

    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["IndentTitle"]="${7}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BulletTitle"]="${8}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BulletTitleColor"]="${9}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TextTitle"]="${10}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TextTitleColor"]="${11}"

    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BottomSeparatorTitle"]="${12}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BottomSeparatorTitleColor"]="${13}"

    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["DisplayBodyMessage"]="${14}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["IndentBodyMessageFirstLine"]="${15}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BulletBodyMessageFirstLine"]="${16}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BulletBodyMessageFirstLineColor"]="${17}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["IndentBodyMessageAnotherLines"]="${18}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BulletBodyMessageAnotherLines"]="${19}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BulletBodyMessageAnotherLinesColor"]="${20}"

    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageArrayName"]="${21}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageArrayNameColor"]="${22}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["SeparatorBodyMessage"]="${23}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["SeparatorBodyMessageColor"]="${24}"



    #
    # Verifica o tipo de mensagem a ser usada.
    if [ "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG["MessageType"]}" == "" ]; then
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["MessageType"]="n"
    fi



    local mseKey
    local mseValue
    for mseKey in "${!MSE_GLOBAL_SHOW_MESSAGE_CONFIG[@]}"; do
      mseValue="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[$mseKey]}"

      case "${mseKey}" in
        MessageType)
          local mseTmp="none"

          case "${mseValue}" in
            info | i)
              mseTmp="info"
            ;;
            attention | a)
              mseTmp="attention"
            ;;
            warning | w)
              mseTmp="warning"
            ;;
            error | e)
              mseTmp="error"
            ;;
            fail | f)
              mseTmp="fail"
            ;;
            success | s)
              mseTmp="success"
            ;;
          esac

          MSE_GLOBAL_SHOW_MESSAGE_CONFIG["MessageType"]="${mseTmp}"
        ;;

        TitleType)

          if [ "${mseValue}" != "1" ] && [ "${mseValue}" != "2" ] && [ "${mseValue}" != "3" ]; then
            mseValue="1"
          fi

          MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleType"]="${mseValue}"
        ;;

        DisplayTitle | BulletTitleColor | TextTitleColor | SeparatorTitleColor | DisplayBodyMessage | BulletBodyMessageFirstLineColor | BulletBodyMessageAnotherLinesColor | BodyMessageArrayNameColor | SeparatorBodyMessageColor)

          if [ "$mseValue" == "" ]; then
            mseValue="0"
          elif [ "$mseValue" != "0" ] && [ "$mseValue" != "1" ]; then
            mseValue="1"
          fi
          MSE_GLOBAL_SHOW_MESSAGE_CONFIG[$mseKey]="${mseValue}"

        ;;
      esac
    done


    #
    # Seleciona a função que deve ser usada para renderizar a mensagem.
    local mseThemeMainFunction="${25}"
    #
    # Verifica se a função é válida, não sendo
    # seta a função definida na variável global 'MSE_GLOBAL_THEME_FUNCTION'
    if [ "$(type -t $mseThemeMainFunction)" != "function" ]; then
      mseThemeMainFunction="${MSE_GLOBAL_THEME_FUNCTION}"
    fi


    #
    # Se há uma função customizada definida, usa-a
    if [ "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG["CustomSpecification"]}" != "" ]; then
      mseThemeMainFunction="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG["CustomSpecification"]}"

      #
      # Verifica se ela é válida, não sendo
      # seta a função definida na variável global 'MSE_GLOBAL_THEME_FUNCTION'
      if [ "$(type -t $mseThemeMainFunction)" != "function" ]; then
        mseThemeMainFunction="${MSE_GLOBAL_THEME_FUNCTION}"
      fi
    fi


    #
    # Evoca a função que está definida para criar a mensagem
    $mseThemeMainFunction
  fi
}





#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_inter_showMessage_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=24
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="MessageType :: o :: list"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0_labels"]="none, info, attention, warning, error, fail, success"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0_values"]="n, i, a, w, e, f, s"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="CustomSpecification :: r :: string"

  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="DisplayTitle :: r :: bool"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_3"]="TitleType :: o :: list"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_3_labels"]="1, 2, 3"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_3_values"]="1, 2, 3"

  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_4"]="TopSeparatorTitle :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_5"]="TopSeparatorTitleColor :: r :: bool"

  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_6"]="IndentTitle :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_7"]="BulletTitle :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_8"]="BulletTitleColor :: r :: bool"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_9"]="TextTitle :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_10"]="TextTitleColor :: r :: bool"

  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_11"]="BottomSeparatorTitle :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_12"]="BottomSeparatorTitleColor :: r :: bool"

  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_13"]="DisplayBodyMessage :: r :: bool"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_14"]="IndentBodyMessageFirstLine :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_15"]="BulletBodyMessageFirstLine :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_16"]="BulletBodyMessageFirstLineColor :: r :: bool"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_17"]="IndentBodyMessageAnotherLines :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_18"]="BulletBodyMessageAnotherLines :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_19"]="BulletBodyMessageAnotherLinesColor :: r :: bool"

  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_20"]="BodyMessageArrayName :: r :: arrayName"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_21"]="BodyMessageArrayNameColor :: r :: bool"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_22"]="SeparatorBodyMessage :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_23"]="SeparatorBodyMessageColor :: r :: bool"

  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_24"]="Theme :: o :: functionName :: mse_inter_theme_default"
}





#
# Monta toda a parte do título da mensagem conforme as configurações
# definidas e o tema utilizado
mse_inter_showMessage_createTitle() {
  local mseReturn
  local mseMessageType

  local mseTitleType
  local mseTitleText



  if [ "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[DisplayTitle]}" == "0" ]; then
    mseReturn=""
  else
    mseTitleType="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[TitleType]}"
    mseMessageType="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[MessageType]}"



    #
    # Conforme o tipo da mensagem
    mseTitleText=""
    case "${mseMessageType}" in
      info | i)
        mseTitleText="${lbl_inter_alert_header_info}"
      ;;
      attention | a)
        mseTitleText="${lbl_inter_alert_header_attention}"
      ;;
      warning | w)
        mseTitleText="${lbl_inter_alert_header_warning}"
      ;;
      error | e)
        mseTitleText="${lbl_inter_alert_header_error}"
      ;;
      fail | f)
        mseTitleText="${lbl_inter_alert_header_fail}"
      ;;
      success | s)
        mseTitleText="${lbl_inter_alert_header_success}"
      ;;
    esac


    #
    # Monta a linha do título parte a parte
    #
    # Parte 1 : Separador do topo
    if [ "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[TopSeparatorTitle]}" != "" ]; then
      if [ "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[TopSeparatorTitleColor]}" == "1" ]; then
        mseReturn+="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG_THEME_TITLESEPARATOR_COLORS[${mseMessageType}]}"
      fi

      mseReturn+="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[TopSeparatorTitle]}"

      if [ "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[TopSeparatorTitleColor]}" == "1" ]; then
        mseReturn+="${mseNONE}"
      fi
    fi


    #
    # Parte 2 : Indentação
    mseReturn+="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[IndentTitle]}"


    #
    # Parte 3 : Bullet
    if [ "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[BulletTitle]}" != "" ]; then
      if [ "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[BulletTitleColor]}" == "1" ]; then
        mseReturn+="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG_THEME_TITLEBULLET_COLORS[${mseMessageType}]}"
      fi

      mseReturn+="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[BulletTitle]}"

      if [ "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[BulletTitleColor]}" == "1" ]; then
        mseReturn+="${mseNONE}"
      fi
    fi



    #
    # Parte 4 : Texto
    # Conforme o tipo do título
    local mseTitleMainColor=""
    local mseTitleColorAlt1=""
    local mseTitleColorNone=""
    local mseTextTitleParts

    if [ "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[TextTitleColor]}" == "1" ]; then
      mseTitleMainColor="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG_THEME_TITLETEXT_COLORS[${mseMessageType}]}"
      mseTitleColorAlt1="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG_THEME_TITLETEXT_COLORS[${mseMessageType}_a1]}"
    fi

    case "${mseTitleType}" in
      1)

        mseReturn+="${mseTitleMainColor}"

        if [ "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[TextTitle]}" == "" ]; then
          mseReturn+="${mseTitleText}"
        else
          mseReturn+="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[TextTitle]}"
        fi

        mseReturn+="${mseNONE}"

      ;;
      2)

        mse_str_split "::" "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[TextTitle]}"
        mseTextTitleParts="${#MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}"

        mseReturn+="${mseTitleMainColor}"

        if [ "${mseTextTitleParts}" -le "1" ]; then
          mseReturn+="[   ] ${mseTitleText}"
        elif [ "${mseTextTitleParts}" == "2" ]; then
          mseReturn+="[ ${MSE_GLOBAL_MODULE_SPLIT_RESULT[0]} ] ${MSE_GLOBAL_MODULE_SPLIT_RESULT[@]:1}"
        else
          mseReturn+="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[TextTitle]}"
        fi

        mseReturn+="${mseNONE}"

      ;;
      3)

        mse_str_split "::" "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[TextTitle]}"
        mseTextTitleParts="${#MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}"

        mseReturn+=""

        if [ "${mseTextTitleParts}" -le "1" ]; then
          mseReturn+="[ ${mseTitleColorAlt1}script${mseNONE} ] ${mseTitleMainColor}${mseTitleText}${mseNONE}"
        elif [ "${mseTextTitleParts}" == "2" ]; then
          mseReturn+="[ ${mseTitleColorAlt1}${MSE_GLOBAL_MODULE_SPLIT_RESULT[0]}${mseNONE} ] ${mseTitleMainColor}${MSE_GLOBAL_MODULE_SPLIT_RESULT[@]:1}${mseNONE}"
        else
          mseReturn+="${mseTitleMainColor}${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[TextTitle]}${mseNONE}"
        fi

      ;;
    esac



    #
    # Parte 5 : Separador
    if [ "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[BottomSeparatorTitle]}" != "" ]; then
      if [ "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[BottomSeparatorTitleColor]}" == "1" ]; then
        mseReturn+="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG_THEME_TITLESEPARATOR_COLORS[${mseMessageType}]}"
      fi

      mseReturn+="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[BottomSeparatorTitle]}"

      if [ "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[BottomSeparatorTitleColor]}" == "1" ]; then
        mseReturn+="${mseNONE}"
      fi
    fi
  fi


  printf "${mseReturn}"
}





#
# Monta toda a parte do título da mensagem conforme as configurações
# definidas e o tema utilizado
mse_inter_showMessage_createBody() {
  local mseReturn


  if [ "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[DisplayBodyMessage]}" == "0" ]; then
    mseReturn=""
  else


    #
    # Monta linha a linha da mensagem
    declare -n mseArrBodyMessage="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[BodyMessageArrayName]}"
    local mseCountLines=0
    local mseFirstLine=1

    local mseMessageType="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[MessageType]}"
    local mseLineIndent=""
    local mseLineBullet=""
    local mseLineBulletColor=""
    local mseLineText=""
    local mseLineTextColor="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[BodyMessageArrayNameColor]}"

    for mseLineText in "${mseArrBodyMessage[@]}"; do
      ((mseCountLines=mseCountLines+1))

      if [ "${mseCountLines}" == "1" ]; then
        #
        # Configurações para a primeira linha
        mseLineIndent="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[IndentBodyMessageFirstLine]}"
        mseLineBullet="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[BulletBodyMessageFirstLine]}"
        mseLineBulletColor="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[BulletBodyMessageFirstLineColor]}"
      else
        mseReturn+="\n"

        #
        # Configurações para as demais linhas
        mseLineIndent="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[IndentBodyMessageAnotherLines]}"
        mseLineBullet="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[BulletBodyMessageAnotherLines]}"
        mseLineBulletColor="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[BulletBodyMessageAnotherLinesColor]}"

        mseFirstLine=0
      fi

      mseReturn+=$(mse_inter_showMessage_createBody_line "${mseFirstLine}" "${mseMessageType}" "${mseLineIndent}" "${mseLineBullet}" "${mseLineBulletColor}" "${mseLineText}" "${mseLineTextColor}")
    done


    #
    # Adiciona o separador ao final do corpo da mensagem
    if [ "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[SeparatorBodyMessage]}" != "" ]; then
      if [ "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[SeparatorBodyMessageColor]}" == "1" ]; then
        mseReturn+="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG_THEME_BODYSEPARATOR_COLORS[body]}"
      fi

      mseReturn+="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[SeparatorBodyMessage]}"

      if [ "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[SeparatorBodyMessageColor]}" == "1" ]; then
        mseReturn+="${mseNONE}"
      fi
    fi
  fi


  printf "${mseReturn}"
}





#
# Monta uma única linha da mensagem a ser mostrada para o usuário.
#
# @param bool $1
# Indica quando é ou não a primeira linha.
#
# @param string $2
# Tipo de mensagem sendo formatada.
#
# @param string $3
# Indentação a ser usada na linha.
#
# @param string $4
# Bullet a ser usado na linha.
#
# @param bool $5
# Indica se deve ou não usar coloração para o bullet.
#
# @param string $6
# Texto da linha.
#
# @param bool $7
# Indica se deve ou não usar coloração para o texto.
mse_inter_showMessage_createBody_line() {
  local mseReturn
  local mseTitleType="$2"


  mseReturn=""
  if [ "$#" -ge "7" ]; then
    #
    # Parte 1 : Indentação
    mseReturn+="$3"



    #
    # Parte 2 : Bullet
    if [ "$5" == "1" ]; then
      if [ "$1" == "1" ]; then
        mseReturn+="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG_THEME_BODYBULLET_FIRSTLINE_COLORS[body]}"
      else
        mseReturn+="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG_THEME_BODYBULLET_ANOTHERLINES_COLORS[body]}"
      fi
    fi

    mseReturn+="$4"

    if [ "$5" == "1" ]; then
      mseReturn+="${mseNONE}"
    fi



    #
    # Parte 3 : Texto
    if [ "$7" == "1" ]; then
      if [ "$1" == "1" ]; then
        mseReturn+="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG_THEME_BODYTEXT_FIRSTLINE_COLORS[body]}"
      else
        mseReturn+="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG_THEME_BODYTEXT_ANOTHERLINES_COLORS[body]}"
      fi
    fi

    mseReturn+="$6"

    if [ "$7" == "1" ]; then
      mseReturn+="${mseNONE}"
    fi
  fi


  printf "${mseReturn}"
}
