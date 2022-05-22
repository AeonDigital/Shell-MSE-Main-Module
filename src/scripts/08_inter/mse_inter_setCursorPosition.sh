#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Move o cursor pelo terminal conforme as configurações passadas.
#
# @param string $1
# Direção na qual o cursor deve ser movido.
#   - top     : para cima x linhas.
#   - bottom  : para baixo x linhas.
#   - left    : a partir da margem esquerda x colunas.
#   - right   : a partir da margem direita x colunas.
#
# Tenha em mente que, devido ao funcionamento do terminal, quando você efetua
# o "enter" de um comando os seguintes eventos ocorrem na seguinte ordem:
#
#   1. É criada uma nova linha e o cursor fica posicionado na primeira coluna
#      desta nova linha.
#   2. O comando digitado na linha acima é executado.
#   3. O prompt é reescrito
#   4. O cursor é reposicionado ao final do novo prompt.
#
# As informações acima servirão para explicar o funcionamento desta ação e de
# como você deverá perceber as diferenças entre efetuar elas dentro de um
# script (local onde um novo prompt não é criado até o final do mesmo) e seu
# uso no próprio terminal (que é um uso não aconselhado do mesmo).
#
# Quando este mesmo comando é executado dentro de um script, a posição do
# cursor estará vinculada ao último output que ocorreu, portanto o cursor
# não retorna para o início da linha de forma 'natural'.
#
# @param int $2
# Quantidade de linhas ou colunas que o cursor ser movido.
#
# @param char $3
# Opcional. Define se deve ou não "ancorar" o cursor antes de iniciar o
# seu reposicionamento.
# Selecione uma das seguintes opções:
#   - "l"  :  Leva o cursor até a primeira coluna da linha.
#   - "r"  :  Leva o cursor até a última coluna da linha.
#
# @link
# Conheça outros códigos de controle de terminal neste local:
# http://www.climagic.org/mirrors/VT100_Escape_Codes.html
mse_inter_setCursorPosition() {
  if [ $# -ge 2 ]; then
    local mseStrPos
    local mseIntPos
    local mseResetToPosition
    local mseTerminalTotalLines="${LINES}"
    local mseTerminalTotalColumns="${COLUMNS}"


    #
    # Identifica se a posição escolhida é válida.
    case "$1" in
      top | bottom | left | right)
        mseStrPos="$1"

        #
        # Testa se a quantidade de posições (linhas ou colunas)
        # indicado é válido.
        local mseCheck=$(mse_check_isInteger "$2")
        if [ "${mseCheck}" == "1" ] && [ "$2" -ge "0" ]; then
          mseIntPos="$2"
        fi

        mseResetToPosition=""
        if [ $# -ge 3 ] && ([ "$3" == "l" ] || [ "$3" == "r" ]); then
          mseResetToPosition="$3"
        fi
      ;;
    esac


    #
    # Se os parametros foram corretamente passados...
    if [ "${mseStrPos}" != "" ] && [ "${mseIntPos}" != "" ]; then

      #
      # Efetua a ancoragem do cursor
      if [ "${mseResetToPosition}" == "l" ]; then
        printf "\r"
      elif [ "${mseResetToPosition}" == "r" ]; then
        printf "\r\e[${mseTerminalTotalColumns}C"
      fi


      #
      # Movimenta o cursor conforme indicações
      if [ "${mseIntPos}" -ge 1 ]; then
        case "${mseStrPos}" in
          top)
            printf "\e[${mseIntPos}A"
          ;;
          bottom)
            printf "\e[${mseIntPos}B"
          ;;
          left)
            printf "\e[${mseIntPos}C"
          ;;
          right)
            printf "\e[${mseIntPos}D"
          ;;
        esac
      fi
    fi
  fi
}
