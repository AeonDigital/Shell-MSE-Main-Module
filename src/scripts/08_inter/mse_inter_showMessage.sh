#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Permite mostrar uma mensagem no terminal oferecendo uma série de
# recursos para a estilização da mesma em seus scripts.
#
#
# @param string $1
# Nome do array associativo que traz as configurações para a apresentação da
# mensagem.
#
# Para configurar este array associativo use a função "mse_inter_prepareMessage".
#
#
#
# @param string $2
# Opcional.
# Tipo de mensagem.
#
# [[ Mensagens de Alerta ]]
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
# [[ Mensagens de Prompt ]]
#
#   - friendly  | fr  : Amigável. Questão sem muita importância.
#   - ordinary  | or  : Comum. Questão padrão.
#   - caution   | ca  : Cuidado. Questão que exige atenção do usuário ou que
#                       tenha potencial de alguma alteração permanente.
#   - important | im  : Importante. Questão com potencial de causar alteração
#                       permanente no processamento do script ou no próprio PC
#
# @param string $3
# Opcional.
# Formato da mensagem.
# Cada tema pode fornecer vários formatos de mensagem, se for o caso, neste
# parametro deve ser indicado qual deve ser usado. De outra forma o formato
# padrão será utilizado.
#
# @param string $4
# Título da mensagem.
# Use "" para manter o título atualmente definido.
# Use " " para remover totalmente o título. Neste caso usará o título padrão
# conforme o tipo de mensagem, ou, deixará a linha do título vazia em caso de
# tipo de mensagem "none".
#
# @param string $5
# Nome de um array unidimensional em que estão as frases que devem ser
# usadas para montar o corpo da mensagem.
#
# @return
# Printa na tela a mensagem indicada conforme configuração passada.
mse_inter_showMessage() {
  declare -n mseTmpArrShowMessage="${1}"
  local mseRedefineTheme="0"

  #
  # Redefine o tipo da mensagem
  if [ $# -ge 2 ] && [ "${2}" != "" ]; then
    local mseTmp="${mseTmpArrShowMessage[meta_type]}"

    #
    # Garante que apenas tipos válidos serão definidos
    case "${2}" in
      none)
        mseTmp="none"
      ;;
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

    mseTmpArrShowMessage["meta_type"]="${mseTmp}"
    mseRedefineTheme="1"
  fi

  #
  # Redefine o formato da mensagem
  if [ $# -ge 3 ] && [ "${3}" != "" ]; then
    mseTmpArrShowMessage["meta_format"]="$3"
    mseRedefineTheme="1"
  fi

  #
  # Redefine o título da mensagem
  if [ $# -ge 4 ] && [ "${4}" != "" ]; then
    mseTmpArrShowMessage["title_string"]="${4}"
    if [ "${4}" == " " ]; then
      mseTmpArrShowMessage["title_string"]=""
    fi
  fi

  #
  # Redefine o corpo da mensagem
  if [ $# -ge 5 ] && [ "${5}" != "" ]; then
    mseTmpArrShowMessage["body_lines"]="${5}"
  fi


  #
  # Redefine as configurações segundo o tema caso necessário
  if [ "${mseRedefineTheme}" == "1" ] && [ "${mseTmpArrShowMessage[meta_theme]}" != "" ]; then
    local mseThemePrepareMessage="${mseTmpArrShowMessage[meta_theme]}_prepareMessage"
    $mseThemePrepareMessage "${1}"
  fi


  #
  # Gera a mensagem conforme o tipo selecionado
  mse_inter_showMessage_createSeparator "${mseTmpArrShowMessage[meta_type]}" "${mseTmpArrShowMessage[top_separator_string]}" "${mseTmpArrShowMessage[top_separator_color]}" "${mseTmpArrShowMessage[top_separator_color_alt]}" "${mseTmpArrShowMessage[top_separator_colorize]}"
  mse_inter_showMessage_createTitle "${1}"
  mse_inter_showMessage_createBody "${1}"
  mse_inter_showMessage_createSeparator "${mseTmpArrShowMessage[meta_type]}" "${mseTmpArrShowMessage[bottom_separator_string]}" "${mseTmpArrShowMessage[bottom_separator_color]}" "${mseTmpArrShowMessage[bottom_separator_color_alt]}" "${mseTmpArrShowMessage[bottom_separator_colorize]}"
}





#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_inter_showMessage_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=4
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="AssocArrayName :: r :: assocName"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="MetaType :: o :: list"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1_labels"]="none, info, attention, warning, error, fail, success, friendly, ordinary, caution, important"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1_values"]="n, i, a, w, e, f, s, fr, or, ca, im"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="MetaFormat :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_3"]="TitleString :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_4"]="BodyLines :: o :: arrayName"
}





#
# Monta um separador conforme as informações passadas.
#
# @param string $1
# Tipo de mensagem.
#
# @param string $2
# String a ser usada.
#
# @param string $3
# Código da cor a ser usada.
#
# @param string $4
# Código da cor alternativa a ser usada.
#
# @param bool $5
# Indica se deve usar a colorização indicada.
# Use "0" para não.
# Use "1" para sim.
#
# @return
# Printa o resultado conforme as configurações passadas.
mse_inter_showMessage_createSeparator() {
  #
  # Apenas se o separador foi mesmo definido
  if [ "${2}" != "" ]; then
    local mseReturn=""

    #
    # Havendo necessidade de colorização...
    if [ "${5}" == "1" ]; then
      mseReturn+="${3}"
    fi
    mseReturn+="${2}"
    if [ "${5}" == "1" ]; then
      mseReturn+="${mseNONE}"
    fi

    printf "${mseReturn}"
  fi
}



#
# Monta um bullet conforme as informações passadas.
#
# @param string $1
# Tipo de mensagem.
#
# @param string $2
# String a ser usada.
#
# @param string $3
# Código da cor a ser usada.
#
# @param string $4
# Código da cor alternativa a ser usada.
#
# @param bool $5
# Indica se deve usar a colorização indicada.
# Use "0" para não.
# Use "1" para sim.
#
# @return
# Printa o resultado conforme as configurações passadas.
mse_inter_showMessage_createBullet() {
  mse_inter_showMessage_createSeparator "${1}" "${2}" "${3}" "${4}" "${5}"
}





#
# Monta toda a parte do título da mensagem conforme as configurações
# definidas e o tema de cores utilizado.
#
# @param string $1
# Nome do array associativo que traz as configurações para a apresentação da
# mensagem.
#
# @return
# Printa o resultado conforme as configurações passadas.
mse_inter_showMessage_createTitle() {
  declare -n mseTmpArrCreateTitle="${1}"

  if [ "${mseTmpArrCreateTitle[title_show]}" == "1" ]; then
    local mseMessageType="${mseTmpArrCreateTitle[meta_type]}"

    local mseTitleType="${mseTmpArrCreateTitle[title_type]}"

    local mseTitleTopSeparatorString="${mseTmpArrCreateTitle[title_top_separator_string]}"
    local mseTitleTopSeparatorColor="${mseTmpArrCreateTitle[title_top_separator_color]}"
    local mseTitleTopSeparatorColorAlt="${mseTmpArrCreateTitle[title_top_separator_color_alt]}"
    local mseTitleTopSeparatorColorize="${mseTmpArrCreateTitle[title_top_separator_colorize]}"

    local mseTitleIndent="${mseTmpArrCreateTitle[title_indent]}"

    local mseTitleBullet="${mseTmpArrCreateTitle[title_bullet]}"
    local mseTitleBulletColor="${mseTmpArrCreateTitle[title_bullet_color]}"
    local mseTitleBulletColorAlt="${mseTmpArrCreateTitle[title_bullet_color_alt]}"
    local mseTitleBulletColorize="${mseTmpArrCreateTitle[title_bullet_colorize]}"

    local mseTitleString="${mseTmpArrCreateTitle[title_string]}"
    local mseTitleStringColor="${mseTmpArrCreateTitle[title_string_color]}"
    local mseTitleStringColorAlt="${mseTmpArrCreateTitle[title_string_color_alt]}"
    local mseTitleStringColorize="${mseTmpArrCreateTitle[title_string_colorize]}"
    local mseTitleStringEnd="${mseTmpArrCreateTitle[title_string_end]}"

    local mseTitleBottomSeparatorString="${mseTmpArrCreateTitle[title_bottom_separator_string]}"
    local mseTitleBottomSeparatorColor="${mseTmpArrCreateTitle[title_bottom_separator_color]}"
    local mseTitleBottomSeparatorColorAlt="${mseTmpArrCreateTitle[title_bottom_separator_color_alt]}"
    local mseTitleBottomSeparatorColorize="${mseTmpArrCreateTitle[title_bottom_separator_colorize]}"



    #
    # Sendo um título com um formato definido (diferente de "custom")
    # E, sendo no momento vazio...
    # Redefine o título da mensagem com a legenda correspondente ao tipo de mensagem.
    if [ "${mseTitleType}" != "custom" ] && [ "${mseTitleString}" == "" ]; then
      case "${mseMessageType}" in
        info | i)
          mseTitleString="${lbl_inter_alert_header_info}"
        ;;
        attention | a)
          mseTitleString="${lbl_inter_alert_header_attention}"
        ;;
        warning | w)
          mseTitleString="${lbl_inter_alert_header_warning}"
        ;;
        error | e)
          mseTitleString="${lbl_inter_alert_header_error}"
        ;;
        fail | f)
          mseTitleString="${lbl_inter_alert_header_fail}"
        ;;
        success | s)
          mseTitleString="${lbl_inter_alert_header_success}"
        ;;

        friendly | fr | ordinary | or | caution | ca | important | im)
          mseTitleString=""
        ;;
      esac

    fi





    #
    # Monta o texto do título
    local mseUseTitle=""
    local mseUseTitleColor=""
    local mseUseTitleColorAlt=""
    declare -a mseTitleTextParts=()


    #
    # Resgata as cores a serem usadas
    if [ "${mseTitleStringColorize}" == "1" ]; then
      mseUseTitleColor="${mseTitleStringColor}"
      mseUseTitleColorAlt="${mseTitleStringColorAlt}"
    fi


    #
    # Conforme o tipo de título a ser usado...
    case "${mseTitleType}" in
      1)

        mseUseTitle="${mseUseTitleColor}${mseTitleString}${mseNONE}"

      ;;
      2)

        mse_str_split "::" "${mseTitleString}"
        mseTitleTextParts="${#MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}"

        mseUseTitle="${mseUseTitleColor}"

        if [ "${mseTitleTextParts}" -le "1" ]; then
          mseUseTitle+="[   ] ${mseTitleString}"
        else
          mseUseTitle+="[ ${MSE_GLOBAL_MODULE_SPLIT_RESULT[0]} ] ${MSE_GLOBAL_MODULE_SPLIT_RESULT[@]:1}"
        fi

        mseUseTitle+="${mseNONE}"

      ;;
      3)

        mse_str_split "::" "${mseTitleString}"
        mseTitleTextParts="${#MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}"

        if [ "${mseTitleTextParts}" -le "1" ]; then
          mseUseTitle="[ ${mseUseTitleColorAlt}script${mseNONE} ] ${mseUseTitleColor}${mseTitleString}${mseNONE}"
        else
          mseUseTitle="[ ${mseUseTitleColorAlt}${MSE_GLOBAL_MODULE_SPLIT_RESULT[0]}${mseNONE} ] ${mseUseTitleColor}${MSE_GLOBAL_MODULE_SPLIT_RESULT[@]:1}${mseNONE}"
        fi

      ;;
    esac



    #
    # Imprime os componente do título conforme configuração
    mse_inter_showMessage_createSeparator "${mseMessageType}" "${mseTitleTopSeparatorString}" "${mseTitleTopSeparatorColor}" "${mseTitleTopSeparatorColorAlt}" "${mseTitleTopSeparatorColorize}"
    printf "${mseTitleIndent}"
    mse_inter_showMessage_createBullet "${mseMessageType}" "${mseTitleBullet}" "${mseTitleBulletColor}" "${mseTitleBulletColorAlt}" "${mseTitleBulletColorize}"
    printf "${mseUseTitle}${mseTitleStringEnd}"
    mse_inter_showMessage_createSeparator "${mseMessageType}" "${mseTitleBottomSeparatorString}" "${mseTitleBottomSeparatorColor}" "${mseTitleBottomSeparatorColorAlt}" "${mseTitleBottomSeparatorColorize}"
  fi
}





#
# Monta toda a parte do título da mensagem conforme as configurações
# definidas e o tema utilizado
#
# @param string $1
# Nome do array associativo que traz as configurações para a apresentação da
# mensagem.
#
# @return
# Printa o resultado conforme as configurações passadas.
mse_inter_showMessage_createBody() {
  declare -n mseTmpArrCreateBody="${1}"

  if [ "${mseTmpArrCreateBody[body_show]}" == "1" ]; then
    local mseMessageType="${mseTmpArrShowMessage[meta_type]}"

    local mseBodyTopSeparatorString="${mseTmpArrShowMessage[body_top_separator_string]}"
    local mseBodyTopSeparatorColor="${mseTmpArrShowMessage[body_top_separator_color]}"
    local mseBodyTopSeparatorColorAlt="${mseTmpArrShowMessage[body_top_separator_color_alt]}"
    local mseBodyTopSeparatorColorize="${mseTmpArrShowMessage[body_top_separator_colorize]}"

    local mseBodyFirstLineIndent="${mseTmpArrShowMessage[body_first_line_indent]}"

    local mseBodyFirstLineBullet="${mseTmpArrShowMessage[body_first_line_bullet]}"
    local mseBodyFirstLineBulletColor="${mseTmpArrShowMessage[body_first_line_bullet_color]}"
    local mseBodyFirstLineBulletColorAlt="${mseTmpArrShowMessage[body_first_line_bullet_color_alt]}"
    local mseBodyFirstLineBulletColorize="${mseTmpArrShowMessage[body_first_line_bullet_colorize]}"

    local mseBodyLinesIndent="${mseTmpArrShowMessage[body_lines_indent]}"

    local mseBodyLinesBullet="${mseTmpArrShowMessage[body_lines_bullet]}"
    local mseBodyLinesBulletColor="${mseTmpArrShowMessage[body_lines_bullet_color]}"
    local mseBodyLinesBulletColorAlt="${mseTmpArrShowMessage[body_lines_bullet_color_alt]}"
    local mseBodyLinesBulletColorize="${mseTmpArrShowMessage[body_lines_bullet_colorize]}"

    declare -n mseBodyLines="${mseTmpArrShowMessage[body_lines]}"
    local mseBodyLinesColor="${mseTmpArrShowMessage[body_lines_color]}"
    local mseBodyLinesColorAlt="${mseTmpArrShowMessage[body_lines_color_alt]}"
    local mseBodyLinesColorize="${mseTmpArrShowMessage[body_lines_colorize]}"

    local mseBodyBottomSeparatorString="${mseTmpArrShowMessage[body_bottom_separator_string]}"
    local mseBodyBottomSeparatorColor="${mseTmpArrShowMessage[body_bottom_separator_color]}"
    local mseBodyBottomSeparatorColorAlt="${mseTmpArrShowMessage[body_bottom_separator_color_alt]}"
    local mseBodyBottomSeparatorColorize="${mseTmpArrShowMessage[body_bottom_separator_colorize]}"





    #
    # Monta o corpo da mensagem
    local mseLineText=""
    local mseCountLines=0

    local mseLineIndent
    local mseLineBullet
    local mseLineBulletColor
    local mseLineBulletColorAlt
    local mseLineBulletColorize

    local mseUseBody

    for mseLineText in "${mseBodyLines[@]}"; do
      ((mseCountLines=mseCountLines+1))

      if [ "${mseCountLines}" == "1" ]; then
        #
        # Configurações para a primeira linha
        mseLineIndent="${mseBodyFirstLineIndent}"
        mseLineBullet="${mseBodyFirstLineBullet}"
        mseLineBulletColor="${mseBodyFirstLineBulletColor}"
        mseLineBulletColorAlt="${mseBodyFirstLineBulletColorAlt}"
        mseLineBulletColorize="${mseBodyFirstLineBulletColorize}"
      else
        #
        # Configurações para as demais linhas
        mseLineIndent="${mseBodyLinesIndent}"
        mseLineBullet="${mseBodyLinesBullet}"
        mseLineBulletColor="${mseBodyLinesBulletColor}"
        mseLineBulletColorAlt="${mseBodyLinesBulletColorAlt}"
        mseLineBulletColorize="${mseBodyLinesBulletColorize}"
      fi


      mseUseBody+="${mseLineIndent}"
      mseUseBody+=$(mse_inter_showMessage_createBullet "${mseMessageType}" "${mseLineBullet}" "${mseLineBulletColor}" "${mseLineBulletColorAlt}" "${mseLineBulletColorize}")

      if [ "${mseBodyLinesColorize}" == "1" ]; then
        mseUseBody+="${mseBodyLinesColor}"
      fi
      mseUseBody+="${mseLineText}"
      if [ "${mseBodyLinesColorize}" == "1" ]; then
        mseUseBody+="${mseNONE}"
      fi

      mseUseBody+="\n"
    done


    mse_inter_showMessage_createSeparator "${mseMessageType}" "${mseBodyTopSeparatorString}" "${mseBodyTopSeparatorColor}" "${mseBodyTopSeparatorColorAlt}" "${mseBodyTopSeparatorColorize}"
    printf "${mseUseBody}"
    mse_inter_showMessage_createSeparator "${mseMessageType}" "${mseBodyBottomSeparatorString}" "${mseBodyBottomSeparatorColor}" "${mseBodyBottomSeparatorColorAlt}" "${mseBodyBottomSeparatorColorize}"
  fi
}
