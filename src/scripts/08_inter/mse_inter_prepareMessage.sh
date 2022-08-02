#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Prepara um array associativo preenchendo as chaves necessárias para a
# execução de um comando "mse_inter_showMessage".
#
# Se nenhum critério de configuração for passado, toda mensagem será definida
# pelo tema.
#
# A configuração é feita em cinco blocos sendo:
#
# - Bloco 01: Meta formatação
# - Bloco 02: Separador superior da mensagem
# - Bloco 03: Título
# - Bloco 04: Corpo da mensagem
# - Bloco 05: Separador inferior da mensagem
#
#
# @param string $1
# Nome do array associativo que será preenchido.
#
#
#
#
#
# [[ Bloco 01: Meta formatação ]]
#
# @param string $2
# ["meta_type"]
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
# @param string $3
# ["meta_theme"]
# Nome do tema usado para renderizar a mensagem a ser mostrada na tela.
# As configurações do tema sobrescreverão quaisquer outras configurações
# definidas nesta função.
#
# @param string $4
# ["meta_format"]
# Formato da mensagem.
# Cada tema pode fornecer vários formatos de mensagem, se for o caso, neste
# parametro deve ser indicado qual deve ser usado. De outra forma o formato
# padrão será utilizado.
#
#
#
#
#
# [[ Bloco 02: Separador superior da mensagem ]]
#
# @param string $5
# ["top_separator_string"]
# Separador superior da mensagem.
#
# @param bool $6
# ["top_separator_color"]
# Código da cor a ser usada neste elemento.
#
# @param bool $7
# ["top_separator_color_alt"]
# Código da cor alternativa ser usada neste elemento.
#
# @param bool $8
# ["top_separator_colorize"]
# Indica se deve permitir a colorização do separador superior da mensagem.
# Use "0" para não.
# Use "1" para sim.
#
#
#
#
#
# [[ Bloco 03: Título ]]
#
# @param bool $9
# ["title_show"]
# Mostrar título.
# Use "0" para omitir.
# Use "1" para mostrar.
#
# @param int $10
# ["title_type"]
# Identificador do tipo do título.
# Identificadores válidos são definidos e controlados por cada tema.
#
#
#
# @param string $11
# ["title_top_separator_string"]
# Separador superior do título.
#
# @param bool $12
# ["title_top_separator_color"]
# Código da cor a ser usada neste elemento.
#
# @param bool $13
# ["title_top_separator_color_alt"]
# Código da cor alternativa ser usada neste elemento.
#
# @param bool $14
# ["title_top_separator_colorize"]
# Indica se deve permitir a colorização do separador superior do título.
# Use "0" para não.
# Use "1" para sim.
#
#
#
# @param string $15
# ["title_indent"]
# Indentação para o título.
# Use apenas espaços em branco.
# Deixe vazio para não usar.
#
#
#
# @param string $16
# ["title_bullet"]
# Bullet para o título.
# Deixe vazio para não usar.
#
# @param bool $17
# ["title_bullet_color"]
# Código da cor a ser usada neste elemento.
#
# @param bool $18
# ["title_bullet_color_alt"]
# Código da cor alternativa ser usada neste elemento.
#
# @param bool $19
# ["title_bullet_colorize"]
# Indica se deve permitir a colorização do bullet do título.
# Use "0" para não.
# Use "1" para sim.
#
#
#
# @param string $20
# ["title_string"]
# Título da mensagem.
# Se "", usará o título padrão conforme o tipo de mensagem, ou, deixará a
# linha do título vazia em caso de tipo de mensagem "none".
#
# @param bool $21
# ["title_string_color"]
# Código da cor a ser usada neste elemento.
#
# @param bool $22
# ["title_string_color_alt"]
# Código da cor alternativa ser usada neste elemento.
#
# @param bool $23
# ["title_string_colorize"]
# Indica se deve permitir a colorização do título.
# Use "0" para não.
# Use "1" para sim.
#
# @param string $24
# ["title_string_end"]
# String usada ao final da linha de texto do título.
# Normalmente, se usada, será definido como um caracter "\n" para forçar a
# quebra de linha antes de iniciar o próximo componente.
#
#
#
# @param string $25
# ["title_bottom_separator_string"]
# Separador inferior do título.
#
# @param bool $26
# ["title_bottom_separator_color"]
# Código da cor a ser usada neste elemento.
#
# @param bool $27
# ["title_bottom_separator_color_alt"]
# Código da cor alternativa ser usada neste elemento.
#
# @param bool $28
# ["title_bottom_separator_colorize"]
# Indica se deve permitir a colorização do separador inferior do título.
# Use "0" para não.
# Use "1" para sim.
#
#
#
#
#
# [[ Bloco 04: Corpo da mensagem ]]
#
# @param bool $29
# ["body_show"]
# Mostrar o corpo da mensagem.
# Use "0" para omitir.
# Use "1" para mostrar.
#
#
#
# @param string $30
# ["body_top_separator_string"]
# Separador superior do corpo da mensagem.
#
# @param bool $31
# ["body_top_separator_color"]
# Código da cor a ser usada neste elemento.
#
# @param bool $32
# ["body_top_separator_color_alt"]
# Código da cor alternativa ser usada neste elemento.
#
# @param bool $33
# ["body_top_separator_colorize"]
# Indica se deve permitir a colorização do separador superior corpo da
# mensagem.
# Use "0" para não.
# Use "1" para sim.
#
#
#
# @param string $34
# ["body_first_line_indent"]
# Indentação para a primeira linha do corpo da mensagem.
# Use apenas espaços em branco.
# Deixe vazio para não usar.
#
#
#
# @param string $35
# ["body_first_line_bullet"]
# Bullet para a primeira linha do corpo da mensagem.
# Deixe vazio para não usar.
#
# @param bool $36
# ["body_first_line_bullet_color"]
# Código da cor a ser usada neste elemento.
#
# @param bool $37
# ["body_first_line_bullet_color_alt"]
# Código da cor alternativa ser usada neste elemento.
#
# @param bool $38
# ["body_first_line_bullet_colorize"]
# Indica se deve ou não permitir a colorização do bullet da primeira linha do
# corpo da mensagem.
# Use "0" para não.
# Use "1" para sim.
#
#
#
# @param string $39
# ["body_lines_indent"]
# Indentação para a segunda linha em diante do corpo da mensagem.
# Use apenas espaços em branco.
# Deixe vazio para não usar.
#
#
#
# @param string $40
# ["body_lines_bullet"]
# Bullet para a segunda linha em diante do corpo da mensagem.
# Deixe vazio para não usar.
#
# @param bool $41
# ["body_lines_bullet_color"]
# Código da cor a ser usada neste elemento.
#
# @param bool $42
# ["body_lines_bullet_color_alt"]
# Código da cor alternativa ser usada neste elemento.
#
# @param bool $43
# ["body_lines_bullet_colorize"]
# Indica se deve ou não permitir a colorização do bullet da segunda linha em
# diante do corpo da mensagem.
# Use "0" para não.
# Use "1" para sim.
#
#
#
# @param string $44
# ["body_lines"]
# Nome de um array unidimensional em que estão as frases que devem ser
# usadas para montar o corpo da mensagem.
#
# @param bool $45
# ["body_lines_color"]
# Código da cor a ser usada neste elemento.
#
# @param bool $46
# ["body_lines_color_alt"]
# Código da cor alternativa ser usada neste elemento.
#
# @param bool $47
# ["body_lines_colorize"]
# Indica se deve ou não permitir a colorização do corpo da mensagem.
# Use "0" para não.
# Use "1" para sim.
#
#
#
# @param string $48
# ["body_bottom_separator_string"]
# Separador inferior do corpo da mensagem.
#
# @param bool $49
# ["body_bottom_separator_color"]
# Código da cor a ser usada neste elemento.
#
# @param bool $50
# ["body_bottom_separator_color_alt"]
# Código da cor alternativa ser usada neste elemento.
#
# @param bool $51
# ["body_bottom_separator_colorize"]
# Indica se deve permitir a colorização do separador inferior do corpo da
# mensagem.
# Use "0" para não.
# Use "1" para sim.
#
#
#
#
#
# [[ Bloco 05: Separador inferior da mensagem ]]
#
# @param string $52
# ["bottom_separator_string"]
# Separador inferior da mensagem.
#
# @param bool $53
# ["bottom_separator_color"]
# Código da cor a ser usada neste elemento.
#
# @param bool $54
# ["bottom_separator_color_alt"]
# Código da cor alternativa ser usada neste elemento.
#
# @param bool $55
# ["bottom_separator_colorize"]
# Indica se deve permitir a colorização do separador inferior da mensagem.
# Use "0" para não.
# Use "1" para sim.
#
mse_inter_prepareMessage() {
  declare -n mseTmpArrPrepareMessage="${1}"

  #
  # Remove todas as entradas atualmente definidas no array indicado sem
  # destruí-lo
  local mseKey=""
  for mseKey in "${!mseTmpArrPrepareMessage[@]}"; do
    unset mseTmpArrPrepareMessage["${mseKey}"]
  done


  #
  # - Bloco 01: Meta formatação
  mseTmpArrPrepareMessage["meta_type"]="${2}"
  mseTmpArrPrepareMessage["meta_theme"]="${3}"
  mseTmpArrPrepareMessage["meta_format"]="${4}"


  #
  # - Bloco 02: Separador superior da mensagem
  mseTmpArrPrepareMessage["top_separator_string"]="${5}"
  mseTmpArrPrepareMessage["top_separator_color"]="${6}"
  mseTmpArrPrepareMessage["top_separator_color_alt"]="${7}"
  mseTmpArrPrepareMessage["top_separator_colorize"]="${8}"


  #
  # - Bloco 03: Título
  mseTmpArrPrepareMessage["title_show"]="${9}"
  mseTmpArrPrepareMessage["title_type"]="${10}"

  mseTmpArrPrepareMessage["title_top_separator_string"]="${11}"
  mseTmpArrPrepareMessage["title_top_separator_color"]="${12}"
  mseTmpArrPrepareMessage["title_top_separator_color_alt"]="${13}"
  mseTmpArrPrepareMessage["title_top_separator_colorize"]="${14}"

  mseTmpArrPrepareMessage["title_indent"]="${15}"

  mseTmpArrPrepareMessage["title_bullet"]="${16}"
  mseTmpArrPrepareMessage["title_bullet_color"]="${17}"
  mseTmpArrPrepareMessage["title_bullet_color_alt"]="${18}"
  mseTmpArrPrepareMessage["title_bullet_colorize"]="${19}"

  mseTmpArrPrepareMessage["title_string"]="${20}"
  mseTmpArrPrepareMessage["title_string_color"]="${21}"
  mseTmpArrPrepareMessage["title_string_color_alt"]="${22}"
  mseTmpArrPrepareMessage["title_string_colorize"]="${23}"
  mseTmpArrPrepareMessage["title_string_end"]="${24}"

  mseTmpArrPrepareMessage["title_bottom_separator_string"]="${25}"
  mseTmpArrPrepareMessage["title_bottom_separator_color"]="${26}"
  mseTmpArrPrepareMessage["title_bottom_separator_color_alt"]="${27}"
  mseTmpArrPrepareMessage["title_bottom_separator_colorize"]="${28}"


  #
  # - Bloco 04: Corpo da mensagem
  mseTmpArrPrepareMessage["body_show"]="${29}"

  mseTmpArrPrepareMessage["body_top_separator_string"]="${30}"
  mseTmpArrPrepareMessage["body_top_separator_color"]="${31}"
  mseTmpArrPrepareMessage["body_top_separator_color_alt"]="${32}"
  mseTmpArrPrepareMessage["body_top_separator_colorize"]="${33}"

  mseTmpArrPrepareMessage["body_first_line_indent"]="${34}"

  mseTmpArrPrepareMessage["body_first_line_bullet"]="${35}"
  mseTmpArrPrepareMessage["body_first_line_bullet_color"]="${36}"
  mseTmpArrPrepareMessage["body_first_line_bullet_color_alt"]="${37}"
  mseTmpArrPrepareMessage["body_first_line_bullet_colorize"]="${38}"

  mseTmpArrPrepareMessage["body_lines_indent"]="${39}"

  mseTmpArrPrepareMessage["body_lines_bullet"]="${40}"
  mseTmpArrPrepareMessage["body_lines_bullet_color"]="${41}"
  mseTmpArrPrepareMessage["body_lines_bullet_color_alt"]="${42}"
  mseTmpArrPrepareMessage["body_lines_bullet_colorize"]="${43}"

  mseTmpArrPrepareMessage["body_lines"]="${44}"
  mseTmpArrPrepareMessage["body_lines_color"]="${45}"
  mseTmpArrPrepareMessage["body_lines_color_alt"]="${46}"
  mseTmpArrPrepareMessage["body_lines_colorize"]="${47}"

  mseTmpArrPrepareMessage["body_bottom_separator_string"]="${48}"
  mseTmpArrPrepareMessage["body_bottom_separator_color"]="${49}"
  mseTmpArrPrepareMessage["body_bottom_separator_color_alt"]="${50}"
  mseTmpArrPrepareMessage["body_bottom_separator_colorize"]="${51}"


  #
  # - Bloco 05: Separador inferior da mensagem
  mseTmpArrPrepareMessage["bottom_separator_string"]="${52}"
  mseTmpArrPrepareMessage["bottom_separator_color"]="${53}"
  mseTmpArrPrepareMessage["bottom_separator_color_alt"]="${54}"
  mseTmpArrPrepareMessage["bottom_separator_colorize"]="${55}"






  #
  # Verifica o tipo de mensagem a ser usada.
  if [ "${mseTmpArrPrepareMessage[meta_type]}" == "" ]; then
    mseTmpArrPrepareMessage["meta_type"]="n"
  fi



  #
  # Verifica os valores dos parametros que tem uma coleção limitada de opções válidas
  local mseKey
  local mseValue
  for mseKey in "${!mseTmpArrPrepareMessage[@]}"; do
    mseValue="${mseTmpArrPrepareMessage[$mseKey]}"

    case "${mseKey}" in
      meta_type)
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

        mseTmpArrPrepareMessage["meta_type"]="${mseTmp}"
      ;;

      meta_theme)
        if [ "${mseValue}" != "" ] && [ "$(type -t "${mseValue}_prepareMessage")" != "function" ]; then
          mseTmpArrPrepareMessage["meta_theme"]=""
        fi
      ;;

      meta_format)
        if [ "${mseValue}" != "" ]; then
          mseTmpArrPrepareMessage["meta_format"]="${mseValue,,}"
        fi
      ;;

      #
      # Valores booleanos
      top_separator_colorize | title_show | title_top_separator_colorize | title_bullet_colorize | title_string_colorize | title_bottom_separator_colorize | body_show | body_top_separator_colorize | body_first_line_bullet_colorize | body_lines_bullet_colorize | body_lines_colorize | body_bottom_separator_colorize | bottom_separator_colorize)

        if [ "$mseValue" == "" ] || ([ "$mseValue" != "0" ] && [ "$mseValue" != "1" ]); then
          mseValue="0"
        fi
        mseTmpArrPrepareMessage[$mseKey]="${mseValue}"

      ;;
    esac
  done



  #
  # Finaliza o preparo da mensagem aplicando as configurações que vem do tema
  # selecionado.
  if [ "${mseTmpArrPrepareMessage[meta_theme]}" != "" ]; then
    local mseThemePrepareMessage="${mseTmpArrPrepareMessage[meta_theme]}_prepareMessage"
    $mseThemePrepareMessage "${1}"
  fi
}
MSE_GLOBAL_CMD["prepare message"]="mse_inter_prepareMessage"




#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_inter_prepareMessage_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=55
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="AssocArrayName :: r :: assocName"

  #
  # - Bloco 01: Meta formatação
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="MetaType :: o :: list"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1_labels"]="none, info, attention, warning, error, fail, success, friendly, ordinary, caution, important"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1_values"]="n, i, a, w, e, f, s, fr, or, ca, im"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="MetaTheme :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_3"]="MetaFormat :: o :: string"


  #
  # - Bloco 02: Separador superior da mensagem
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_4"]="TopSeparatorString :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_5"]="TopSeparatorColor :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_6"]="TopSeparatorColorAlt :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_7"]="TopSeparatorColorize :: o :: bool"


  #
  # - Bloco 03: Título
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_8"]="TitleShow :: o :: bool"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_9"]="TitleType :: o :: string"

  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_10"]="TitleTopSeparatorString :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_11"]="TitleTopSeparatorColor :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_12"]="TitleTopSeparatorColorAlt :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_13"]="TitleTopSeparatorColorize :: o :: bool"

  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_14"]="TitleIndent :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_15"]="TitleBullet :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_16"]="TitleColor :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_17"]="TitleColorAlt :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_18"]="TitleColorize :: o :: bool"

  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_19"]="TitleString :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_20"]="TitleStringColor :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_21"]="TitleStringColorAlt :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_22"]="TitleStringColorize :: o :: bool"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_23"]="TitleStringEnd :: o :: string"

  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_24"]="TitleBottomSeparatorString :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_25"]="TitleBottomSeparatorColor :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_26"]="TitleBottomSeparatorColorAlt :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_27"]="TitleBottomSeparatorColorize :: o :: bool"


  #
  # - Bloco 04: Corpo da mensagem
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_28"]="BodyShow :: o :: bool"

  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_29"]="BodyTopSeparatorString :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_30"]="BodyTopSeparatorColor :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_31"]="BodyTopSeparatorColorAlt :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_32"]="BodyTopSeparatorColorize :: o :: bool"

  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_33"]="BodyFirstLineIndent :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_34"]="BodyFirstLineBullet :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_35"]="BodyFirstLineBulletColor :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_36"]="BodyFirstLineBulletColorAlt :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_37"]="BodyFirstLineBulletColorize :: o :: bool"

  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_38"]="BodyLinesIndent :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_39"]="BodyLinesBullet :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_40"]="BodyLinesBulletColor :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_41"]="BodyLinesBulletColorAlt :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_42"]="BodyLinesBulletColorize :: o :: bool"

  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_43"]="BodyLines :: o :: arrayName"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_44"]="BodyLinesColor :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_45"]="BodyLinesColorAlt :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_46"]="BodyLinesColorize :: o :: bool"

  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_47"]="BodyBottomSeparatorString :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_48"]="BodyBottomSeparatorColor :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_49"]="BodyBottomSeparatorColorAlt :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_50"]="BodyBottomSeparatorColorize :: o :: bool"


  #
  # - Bloco 05: Separador inferior da mensagem
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_51"]="BottomSeparatorString :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_52"]="BottomSeparatorColor :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_53"]="BottomSeparatorColorAlt :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_54"]="BottomSeparatorColorize :: o :: bool"
}
