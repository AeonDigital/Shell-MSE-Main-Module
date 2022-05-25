#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Permite mostrar uma mensagem no terminal oferecendo uma série de
# recursos para a estilização da mesma em seus scripts.
#
# A composição da mensagem é estruturada em blocos, cada qual com
# características próprias mas com algumas características e funcionamento em
# comum.
#
# Os blocos são configurados na passagem de parametros na mesma ordem em que
# serão exibidos na tela. Abaixo há um esquema simples de como é - de forma
# geral - a estrutura usando todos os blocos.
#
# - Bloco 01: Separador superior da mensagem
# - Bloco 02: Título
# - Bloco 03: Corpo da mensagem
# - Bloco 04: Separador inferior da mensagem
#
#
#
# @param string $1
# Tipo de mensagem.
#
#   Mensagens de Alerta
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
#
#   Mensagens de Prompt
#
#   - friendly  | fr  : Amigável. Questão sem muita importância.
#   - ordinary  | or  : Comum. Questão padrão.
#   - caution   | ca  : Cuidado. Questão que exige atenção do usuário ou que
#                       tenha potencial de alguma alteração permanente.
#   - important | im  : Importante. Questão com potencial de causar alteração
#                       permanente no processamento do script ou no próprio PC
#
# @param string $2
# Formato.
# Pode ser um tipo específico de formatação definido no tema a ser usado ou
# o nome de uma função que possui uma formatação especial para a mensagem.
# Se não for definido, internamente usará o valor padrão 'DEFAULTFORMAT'.
#
#
#
# @param string $3
# Separador superior da mensagem.
#
# @param bool $4
# Indica se deve permitir a colorização do separador superior da mensagem.
# Use "0" para não.
# Use "1" para sim.
#
#
#
# @param bool $5
# Mostrar título.
# Use "0" para omitir.
# Use "1" para mostrar.
#
# @param bool $6
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
# @param string $7
# Separador superior do título.
#
# @param bool $8
# Indica se deve permitir a colorização do separador superior do título.
# Use "0" para não.
# Use "1" para sim.
#
# @param string $9
# Indentação para o título.
# Use apenas espaços em branco.
# Deixe vazio para não usar.
#
# @param string $10
# Bullet para o título.
# Deixe vazio para não usar.
#
# @param bool $11
# Indica se deve permitir a colorização do bullet do título.
# Use "0" para não.
# Use "1" para sim.
#
# @param string $12
# Título da mensagem.
# Se "", usará o título padrão conforme o tipo de mensagem, ou, deixará a
# linha do título vazia em caso de tipo de mensagem "none".
#
# @param bool $13
# Indica se deve permitir a colorização do título.
# Use "0" para não.
# Use "1" para sim.
#
# @param string $14
# Separador inferior do título.
#
# @param bool $15
# Indica se deve permitir a colorização do separador inferior do título.
# Use "0" para não.
# Use "1" para sim.
#
#
#
# @param bool $16
# Mostrar o corpo da mensagem.
# Use "0" para omitir.
# Use "1" para mostrar.
#
#
# @param string $17
# Separador superior do corpo da mensagem.
#
# @param bool $18
# Indica se deve permitir a colorização do separador superior corpo da
# mensagem.
# Use "0" para não.
# Use "1" para sim.
#
#
# @param string $19
# Indentação para a primeira linha do corpo da mensagem.
# Use apenas espaços em branco.
# Deixe vazio para não usar.
#
# @param string $20
# Bullet para a primeira linha do corpo da mensagem.
# Deixe vazio para não usar.
#
# @param bool $21
# Indica se deve ou não permitir a colorização do bullet da primeira linha do
# corpo da mensagem.
# Use "0" para não.
# Use "1" para sim.
#
#
# @param string $22
# Indentação para a segunda linha em diante do corpo da mensagem.
# Use apenas espaços em branco.
# Deixe vazio para não usar.
#
# @param string $23
# Bullet para a segunda linha em diante do corpo da mensagem.
# Deixe vazio para não usar.
#
# @param bool $24
# Indica se deve ou não permitir a colorização do bullet da segunda linha em
# diante do corpo da mensagem.
# Use "0" para não.
# Use "1" para sim.
#
#
# @param string $25
# Nome de um array unidimensional em que estão as frases que devem ser
# usadas para montar o corpo da mensagem.
#
# @param bool $26
# Indica se deve ou não permitir a colorização do corpo da mensagem.
# Use "0" para não.
# Use "1" para sim.
#
#
# @param string $27
# Separador inferior do corpo da mensagem.
#
# @param bool $28
# Indica se deve permitir a colorização do separador inferior corpo da
# mensagem.
# Use "0" para não.
# Use "1" para sim.
#
#
#
# @param string $29
# Separador inferior da mensagem.
#
# @param bool $30
# Indica se deve permitir a colorização do separador inferior da mensagem.
# Use "0" para não.
# Use "1" para sim.
#
#
#
# @param string $31
# Nome do tema usado para renderizar a mensagem a ser mostrada na tela.
# Se nenhuma for indicada, usará o tema padrão definido na variável global
# 'MSE_GLOBAL_THEME_NAME'.
#
#
#
# Observação 01:
# A real aplicabilidade de cor em cada uma das partes depende do tema
# selecionado. Então, indicar que se deseja aplicar cor a todo o título
# implica em informar ao formatador do tema selecionado que ele pode aplicar
# cores em todos os elementos que ele está apto a fazê-lo.
#
# Observação 02:
# A cor de cada parte é definida conforme o "tema" selecionado para a
# mensagem.
# Se uma cor for definida diretamente na referida parte, estas, se sobreporão
# ao que é indicado pelo "tema" selecionado.
#
# Observação 03:
# Quando uma função de tema é acionada ela deve carregar uma série de
# informações sobre cada cor que será usada em cada tipo de mensagem.
# As cores devem ser registradas em arrays associativos que correspondem a
# cada elemento capaz de receber colorização em cada um dos blocos que formam
# a mensagem como um todo.
# Abaixo segue uma lista contendo o nome de cada array associativo usado para
# tal finalidade.
#
# MSE_GSMCTC = MSE_GLOBAL_SHOW_MESSAGE_CONFIG_THEME_COLOR
#
# [Bloco 01: Separador superior da mensagem]
# - MSE_GSMCTC_B01_TOP_SEPARATOR
#
# [Bloco 02: Título]
# - MSE_GSMCTC_B02_TOP_SEPARATOR
# - MSE_GSMCTC_B02_BULLET
# - MSE_GSMCTC_B02_TEXT
# - MSE_GSMCTC_B02_BOTTOM_SEPARATOR
#
# [Bloco 03: Corpo da mensagem]
# - MSE_GSMCTC_B03_TOP_SEPARATOR
# - MSE_GSMCTC_B03_FIRST_LINE_BULLET
# - MSE_GSMCTC_B03_ANOTHER_LINES_BULLET
# - MSE_GSMCTC_B03_FIRST_LINE_TEXT
# - MSE_GSMCTC_B03_ANOTHER_LINES_TEXT
# - MSE_GSMCTC_B03_BOTTOM_SEPARATOR
#
# [Bloco 04: Separador inferior da mensagem]
# - MSE_GSMCTC_B04_BOTTOM_SEPARATOR
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
  if [ $# -lt 31 ]; then
    local mseArgs="$#"
    local mseLost
    ((mseLost=31-mseArgs))

    MSE_GLOBAL_LASTERR=$(mse_str_replacePlaceHolder "${lbl_err_lostParameters}" "LOST" "${mseLost}")
  else

    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["MessageType"]="${1}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["MessageFormat"]="${2}"

    #
    # Bloco 01: Separador superior da mensagem
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["MessageTopSeparator"]="${3}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["MessageTopSeparatorColor"]="${4}"



    #
    # Bloco 02: Título
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleDisplay"]="${5}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleType"]="${6}"

    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleTopSeparator"]="${7}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleTopSeparatorColor"]="${8}"

    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleIndent"]="${9}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleBullet"]="${10}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleBulletColor"]="${11}"

    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleText"]="${12}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleTextColor"]="${13}"

    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleBottomSeparator"]="${14}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleBottomSeparatorColor"]="${15}"



    #
    # Bloco 03: Corpo da mensagem
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageDisplay"]="${16}"

    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageTopSeparator"]="${17}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageTopSeparatorColor"]="${18}"

    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageFirstLineIndent"]="${19}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageFirstLineBullet"]="${20}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageFirstLineBulletColor"]="${21}"

    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageAnotherLinesIndent"]="${22}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageAnotherLinesBullet"]="${23}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageAnotherLinesBulletColor"]="${24}"

    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageArrayName"]="${25}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageArrayNameColor"]="${26}"

    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageBottomSeparator"]="${27}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageBottomSeparatorColor"]="${28}"



    #
    # Bloco 04: Separador inferior da mensagem
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["MessageBottomSeparator"]="${29}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["MessageBottomSeparatorColor"]="${30}"



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

            friendly | fr)
              mseTmp="friendly"
            ;;
            ordinary | or)
              mseTmp="ordinary"
            ;;
            caution | ca)
              mseTmp="caution"
            ;;
            important | im)
              mseTmp="important"
            ;;
          esac

          MSE_GLOBAL_SHOW_MESSAGE_CONFIG["MessageType"]="${mseTmp}"
        ;;

        MessageFormat)

          if [ "${mseValue}" == "" ]; then
            MSE_GLOBAL_SHOW_MESSAGE_CONFIG["MessageFormat"]="DEFAULTFORMAT"
          else
            MSE_GLOBAL_SHOW_MESSAGE_CONFIG["MessageFormat"]="${mseValue^^}"
          fi

        ;;

        TitleType)

          if [ "${mseValue}" != "1" ] && [ "${mseValue}" != "2" ] && [ "${mseValue}" != "3" ]; then
            mseValue="1"
          fi

          MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleType"]="${mseValue}"
        ;;

        MessageTopSeparatorColor | TitleDisplay | TitleTopSeparatorColor | TitleBulletColor | TitleTextColor | TitleBottomSeparatorColor | BodyMessageDisplay | BodyMessageTopSeparatorColor | BodyMessageFirstLineBulletColor | BodyMessageAnotherLinesBulletColor | BodyMessageArrayNameColor | BodyMessageBottomSeparatorColor | MessageBottomSeparatorColor)

          if [ "$mseValue" == "" ] || ([ "$mseValue" != "0" ] && [ "$mseValue" != "1" ]); then
            mseValue="0"
          fi
          MSE_GLOBAL_SHOW_MESSAGE_CONFIG[$mseKey]="${mseValue}"

        ;;
      esac
    done


    #
    # Seleciona a função que deve ser usada para renderizar a mensagem.
    local mseThemeName="${31}"
    local mseThemeFunction="${mseThemeName}_createMessage"
    #
    # Verifica se a função é válida, não sendo
    # seta a função definida na variável global 'MSE_GLOBAL_THEME_NAME'
    if [ "$(type -t $mseThemeFunction)" != "function" ]; then
      mseThemeFunction="${MSE_GLOBAL_THEME_NAME}_createMessage"
    fi


    #
    # Se há uma função customizada definida, usa-a
    if [ "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG["MessageFormat"]}" != "" ]; then
      mseThemeFunction="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG["MessageFormat"]}"

      #
      # Verifica se ela é válida, não sendo
      # seta a função definida na variável global 'MSE_GLOBAL_THEME_NAME'
      if [ "$(type -t $mseThemeFunction)" != "function" ]; then
        mseThemeFunction="${MSE_GLOBAL_THEME_NAME}_createMessage"
      fi
    fi


    #
    # Evoca a função que está definida para criar a mensagem
    $mseThemeFunction
  fi
}





#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_inter_showMessage_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=31
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="MessageType :: r :: list"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0_labels"]="none, info, attention, warning, error, fail, success, friendly, ordinary, caution, important"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0_values"]="n, i, a, w, e, f, s, fr, or, ca, im"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="MessageFormat :: r :: string"


  #
  # Bloco 01: Separador superior da mensagem
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="MessageTopSeparator :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_3"]="MessageTopSeparatorColor :: r :: bool"


  #
  # Bloco 02: Título
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_4"]="TitleDisplay :: r :: bool"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_5"]="TitleType :: r :: list"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_5_labels"]="1, 2, 3"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_5_values"]="1, 2, 3"

  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_6"]="TitleTopSeparator :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_7"]="TitleTopSeparatorColor :: r :: bool"

  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_8"]="TitleIndent :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_9"]="TitleBullet :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_10"]="TitleBulletColor :: r :: bool"

  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_11"]="TitleText :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_12"]="TitleTextColor :: r :: bool"

  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_13"]="TitleBottomSeparator :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_14"]="TitleBottomSeparatorColor :: r :: bool"


  #
  # Bloco 03: Corpo da mensagem
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_15"]="BodyMessageDisplay :: r :: bool"

  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_16"]="BodyMessageTopSeparator :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_17"]="BodyMessageTopSeparatorColor :: r :: bool"

  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_18"]="BodyMessageFirstLineIndent :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_19"]="BodyMessageFirstLineBullet :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_20"]="BodyMessageFirstLineBulletColor :: r :: bool"

  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_21"]="BodyMessageAnotherLinesIndent :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_22"]="BodyMessageAnotherLinesBullet :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_23"]="BodyMessageAnotherLinesBulletColor :: r :: bool"

  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_24"]="BodyMessageArrayName :: r :: arrayName"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_25"]="BodyMessageArrayNameColor :: r :: bool"

  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_26"]="BodyMessageBottomSeparator :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_27"]="BodyMessageBottomSeparatorColor :: r :: bool"


  #
  # Bloco 04: Separador inferior da mensagem
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_28"]="MessageBottomSeparator :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_29"]="MessageBottomSeparatorColor :: r :: bool"


  #
  # Tema selecionado
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_30"]="ThemeName :: o :: string"
}





#
# Monta um separador conforme as informações passadas.
#
# @param string $1
# Tipo de mensagem sendo formatada.
#
# @param string $2
# String a ser usada.
#
# @param bool $3
# Indica se deve ou não utilizar cores.
#
# @param string $4
# Nome do array associativo contendo as cores a serem usadas.
#
# @return
# Printa o resultado conforme as configurações passadas.
mse_inter_showMessage_createSeparator() {
  #
  # Apenas se o separador foi mesmo definido
  if [ "${2}" != "" ]; then
    local mseReturn
    local mseMessageType="${1}"
    declare -n mseAssocColors="${4}"

    #
    # Havendo necessidade de colorização...
    if [ "${3}" == "1" ]; then
      mseReturn+="${mseAssocColors[${mseMessageType}]}"
    fi
    mseReturn+="${2}"
    if [ "${3}" == "1" ]; then
      mseReturn+="${mseNONE}"
    fi

    printf "${mseReturn}"
  fi
}



#
# Monta um bullet conforme as informações passadas.
#
# @param string $1
# Tipo de mensagem sendo formatada.
#
# @param string $2
# String a ser usada.
#
# @param bool $3
# Indica se deve ou não utilizar cores.
#
# @param string $4
# Nome do array associativo contendo as cores a serem usadas.
#
# @return
# Printa o resultado conforme as configurações passadas.
mse_inter_showMessage_createBullet() {
  mse_inter_showMessage_createSeparator "$1" "$2" "$3" "$4"
}





#
# Monta toda a parte do título da mensagem conforme as configurações
# definidas e o tema de cores utilizado.
mse_inter_showMessage_createTitle() {
  #
  # Apenas se está configurado para mostrar o título...
  if [ "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[TitleDisplay]}" == "1" ]; then
    local mseMessageType="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[MessageType]}"

    local mseTitleDisplay="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[TitleDisplay]}"
    local mseTitleType="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[TitleType]}"
    local mseTitleTopSeparator="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[TitleTopSeparator]}"
    local mseTitleTopSeparatorColor="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[TitleTopSeparatorColor]}"
    local mseTitleIndent="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[TitleIndent]}"
    local mseTitleBullet="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[TitleBullet]}"
    local mseTitleBulletColor="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[TitleBulletColor]}"
    local mseTitleText="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[TitleText]}"
    local mseTitleTextColor="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[TitleTextColor]}"
    local mseTitleBottomSeparator="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[TitleBottomSeparator]}"
    local mseTitleBottomSeparatorColor="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[TitleBottomSeparatorColor]}"



    #
    # Conforme o tipo da mensagem
    local mseTitleTypeText=""
    case "${mseMessageType}" in
      info | i)
        mseTitleTypeText="${lbl_inter_alert_header_info}"
      ;;
      attention | a)
        mseTitleTypeText="${lbl_inter_alert_header_attention}"
      ;;
      warning | w)
        mseTitleTypeText="${lbl_inter_alert_header_warning}"
      ;;
      error | e)
        mseTitleTypeText="${lbl_inter_alert_header_error}"
      ;;
      fail | f)
        mseTitleTypeText="${lbl_inter_alert_header_fail}"
      ;;
      success | s)
        mseTitleTypeText="${lbl_inter_alert_header_success}"
      ;;

      friendly | fr | ordinary | or | caution | ca | important | im)
        mseTitleTypeText=""
      ;;
    esac



    #
    # Monta o bloco do título parte a parte
    local mseStr_TopSeparator
    local mseStr_BottomSeparator
    local mseStr_Bullet
    local mseStr_Indent
    local mseStr_TitleText



    #
    # Observação:
    # Para os separadores, é adicionado um espaço em branco ao final que será removido no momento do print (mais abaixo).
    # De outra forma, caracteres "\n" seriam ignorados
    # Esta solução apenas é necessária por que o resultado da criação do separador está sendo feito em um subshell
    # quando a função é evocada diretamente no shell principal e seu resultado é printado imediatamente isto não é
    # necessário.
    #

    #
    # Separador do topo
    mseStr_TopSeparator=$(mse_inter_showMessage_createSeparator "${mseMessageType}" "${mseTitleTopSeparator}" "${mseTitleTopSeparatorColor}" "MSE_GSMCTC_B02_TOP_SEPARATOR"; printf " ")
    #
    # Separador do fundo
    mseStr_BottomSeparator=$(mse_inter_showMessage_createSeparator "${mseMessageType}" "${mseTitleBottomSeparator}" "${mseTitleBottomSeparatorColor}" "MSE_GSMCTC_B02_BOTTOM_SEPARATOR"; printf " ")
    #
    # Bullet
    mseStr_Bullet=$(mse_inter_showMessage_createBullet "${mseMessageType}" "${mseTitleBullet}" "${mseTitleBulletColor}" "MSE_GSMCTC_B02_BULLET")
    #
    # Indentação
    mseStr_Indent="${mseTitleIndent}"



    #
    # Monta o texto do título
    local mseTitleMainColor=""
    local mseTitleColorAlt1=""
    local mseTitleTextParts


    #
    # Resgata as cores a serem usadas
    if [ "${mseTitleTextColor}" == "1" ]; then
      mseTitleMainColor="${MSE_GSMCTC_B02_TEXT[${mseMessageType}]}"
      mseTitleColorAlt1="${MSE_GSMCTC_B02_TEXT[${mseMessageType}_a1]}"
    fi


    #
    # Conforme o tipo de título a ser usado...
    case "${mseTitleType}" in
      1)

        mseStr_TitleText+="${mseTitleMainColor}"

        if [ "${mseTitleText}" == "" ]; then
          mseStr_TitleText+="${mseTitleTypeText}"
        else
          mseStr_TitleText+="${mseTitleText}"
        fi

        mseStr_TitleText+="${mseNONE}"

      ;;
      2)

        mse_str_split "::" "${mseTitleText}"
        mseTitleTextParts="${#MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}"

        mseStr_TitleText+="${mseTitleMainColor}"

        if [ "${mseTitleTextParts}" -le "1" ]; then
          mseStr_TitleText+="[   ] ${mseTitleText}"
        else
          mseStr_TitleText+="[ ${MSE_GLOBAL_MODULE_SPLIT_RESULT[0]} ] ${MSE_GLOBAL_MODULE_SPLIT_RESULT[@]:1}"
        fi

        mseStr_TitleText+="${mseNONE}"

      ;;
      3)

        mse_str_split "::" "${mseTitleText}"
        mseTitleTextParts="${#MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}"

        if [ "${mseTitleTextParts}" -le "1" ]; then
          mseStr_TitleText+="[ ${mseTitleColorAlt1}script${mseNONE} ] ${mseTitleMainColor}${mseTitleText}${mseNONE}"
        else
          mseStr_TitleText+="[ ${mseTitleColorAlt1}${MSE_GLOBAL_MODULE_SPLIT_RESULT[0]}${mseNONE} ] ${mseTitleMainColor}${MSE_GLOBAL_MODULE_SPLIT_RESULT[@]:1}${mseNONE}"
        fi

      ;;
    esac



    printf "${mseStr_TopSeparator:0: -1}${mseStr_Indent}${mseStr_Bullet}${mseStr_TitleText}${mseStr_BottomSeparator:0: -1}"
  fi
}





#
# Monta toda a parte do título da mensagem conforme as configurações
# definidas e o tema utilizado
mse_inter_showMessage_createBody() {
  #
  # Apenas se está configurado para mostrar o corpo da mensagem...
  if [ "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[BodyMessageDisplay]}" == "1" ]; then
    local mseMessageType="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[MessageType]}"

    local mseLineIndent
    local mseLineBullet
    local mseLineBulletColor
    local mseLineText

    local mseBodyMessageTopSeparator="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[BodyMessageTopSeparator]}"
    local mseBodyMessageTopSeparatorColor="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[BodyMessageTopSeparatorColor]}"
    local mseBodyMessageFirstLineIndent="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[BodyMessageFirstLineIndent]}"
    local mseBodyMessageFirstLineBullet="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[BodyMessageFirstLineBullet]}"
    local mseBodyMessageFirstLineBulletColor="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[BodyMessageFirstLineBulletColor]}"
    local mseBodyMessageAnotherLinesIndent="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[BodyMessageAnotherLinesIndent]}"
    local mseBodyMessageAnotherLinesBullet="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[BodyMessageAnotherLinesBullet]}"
    local mseBodyMessageAnotherLinesBulletColor="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[BodyMessageAnotherLinesBulletColor]}"
    declare -n mseBodyMessageArrayName="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[BodyMessageArrayName]}"
    local mseBodyMessageArrayNameColor="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[BodyMessageArrayNameColor]}"
    local mseBodyMessageBottomSeparator="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[BodyMessageBottomSeparator]}"
    local mseBodyMessageBottomSeparatorColor="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[BodyMessageBottomSeparatorColor]}"



    #
    # Monta o bloco do corpo da mensagem parte a parte
    local mseStr_TopSeparator
    local mseStr_BottomSeparator
    local mseStr_BodyText



    #
    # Observação:
    # Para os separadores, é adicionado um espaço em branco ao final que será removido no momento do print (mais abaixo).
    # De outra forma, caracteres "\n" seriam ignorados
    # Esta solução apenas é necessária por que o resultado da criação do separador está sendo feito em um subshell
    # quando a função é evocada diretamente no shell principal e seu resultado é printado imediatamente isto não é
    # necessário.
    #

    #
    # Separador do topo
    mseStr_TopSeparator=$(mse_inter_showMessage_createSeparator "${mseMessageType}" "${mseBodyMessageTopSeparator}" "${mseBodyMessageTopSeparatorColor}" "MSE_GSMCTC_B03_TOP_SEPARATOR"; printf " ")
    #
    # Separador do fundo
    mseStr_BottomSeparator=$(mse_inter_showMessage_createSeparator "${mseMessageType}" "${mseBodyMessageBottomSeparator}" "${mseBodyMessageBottomSeparatorColor}" "MSE_GSMCTC_B03_BOTTOM_SEPARATOR"; printf " ")



    #
    # Parte 2 : Monta linha a linha
    local mseCountLines=0
    local mseFirstLine=1

    for mseLineText in "${mseBodyMessageArrayName[@]}"; do
      ((mseCountLines=mseCountLines+1))

      if [ "${mseCountLines}" == "1" ]; then
        #
        # Configurações para a primeira linha
        mseLineIndent="${mseBodyMessageFirstLineIndent}"
        mseLineBullet="${mseBodyMessageFirstLineBullet}"
        mseLineBulletColor="${mseBodyMessageFirstLineBulletColor}"
      else
        mseStr_BodyText+="\n"

        #
        # Configurações para as demais linhas
        mseLineIndent="${mseBodyMessageAnotherLinesIndent}"
        mseLineBullet="${mseBodyMessageAnotherLinesBullet}"
        mseLineBulletColor="${mseBodyMessageAnotherLinesBulletColor}"

        mseFirstLine=0
      fi

      mseStr_BodyText+=$(mse_inter_showMessage_createBody_line "${mseFirstLine}" "body" "${mseLineIndent}" "${mseLineBullet}" "${mseLineBulletColor}" "${mseLineText}" "${mseBodyMessageArrayNameColor}")
    done



    printf "${mseStr_TopSeparator:0: -1}${mseStr_BodyText}${mseStr_BottomSeparator:0: -1}"
  fi
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
  if [ "$#" -ge "7" ]; then
    local mseReturn
    local mseMessageType="$2"


    #
    # Parte 1 : Indentação
    mseReturn+="${3}"


    #
    # Parte 2 : Bullet
    mseReturn+=$(mse_inter_showMessage_createBullet "${2}" "${4}" "${5}" "MSE_GSMCTC_B03_FIRST_LINE_BULLET")


    #
    # Parte 3 : Texto
    if [ "$7" == "1" ]; then
      if [ "$1" == "1" ]; then
        mseReturn+="${MSE_GSMCTC_B03_FIRST_LINE_TEXT[body]}"
      else
        mseReturn+="${MSE_GSMCTC_B03_ANOTHER_LINES_TEXT[body]}"
      fi
    fi

    mseReturn+="${6}"

    if [ "$7" == "1" ]; then
      mseReturn+="${mseNONE}"
    fi


    printf "${mseReturn}"
  fi
}
