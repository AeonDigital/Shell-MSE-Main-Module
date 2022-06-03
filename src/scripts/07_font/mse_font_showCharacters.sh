#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Imprime os 256 caracteres presentes na atual fonte do seu terminal.
#
# @param string $1
# Formato do retorno.
# Escolha uma das opções:
#   - table     : tabela com todos os marcadores de cabeçalho e demais
#                 separadores visuais (padrão).
#   - char      : lista de cada caracter, 1 a 1, separados por um único
#                 espaço e onde cada linhas terá ao todo 16 itens. Nenhum
#                 adorno será adicionado.
#   - code      : tabela onde, em cada linha constará os códigos usados
#                 para as diferentes codificações do mesmo caracter. Este
#                 caso facilmente ocupará muitas linhas e para facilitar a
#                 leitura é possível usar os próximos parâmetros.
#
# @param int $2
# Usado apenas se $1='code'
# Número inteiro (a partir de 33) que indica de qual ítem a lista gerada na
# opção 'code' deve iniciar.
#
# @param int $3
# Usado apenas se $1='code'
# Número inteiro (até 255) que indica o último ítem a ser mostrado quando
# está sendo usada a opção 'code'.
#
# @example
#   mse_font_showCharacters 'code' 50 70
#   mse_font_showCharacters 'code' | less -r
#
mse_font_showCharacters() {
  local mseOutputType
  local mseIniCode
  local mseEndCode
  local mseCheck



  mseOutputType="table"
  case "${1}" in
    table | char | code)
      mseOutputType="${1}"
    ;;
  esac

  mseIniCode=33
  if [ $# -ge 2 ]; then
    mseCheck=$(mse_check_isInteger "$2")
    if [ "${mseCheck}" == 1 ] && [ "$2" -ge 33 ] && [ "$2" -le 255 ]; then
      mseIniCode="$2"
    fi
  fi

  mseEndCode=255
  if [ $# -ge 3 ]; then
    mseCheck=$(mse_check_isInteger "$3")
    if [ "${mseCheck}" == 1 ] && [ "$3" -ge 33 ] && [ "$3" -le 255 ]; then
      mseEndCode="$3"
    fi
  fi

  if [ "${mseIniCode}" -gt "${mseEndCode}" ]; then
    mseIniCode="$3"
    mseEndCode="$2"
  fi



  if [ $mseOutputType == "table" ] || [ $mseOutputType == "char" ]; then

    #
    # 'table' : imprime o cabeçalho com os índices hexadecimais de 0-f
    if [ $mseOutputType == "table" ]; then
      printf "\n      ";
      for x in {0..15}; do
        printf "%-3x" $x;
      done;
      printf "\n%46s\n" | sed 's/ /-/g;s/^/      /';
    fi


    #
    # 'table' : usa as 2 primeiras linhas para representar os
    #           caracteres de controles
    if [ $mseOutputType == "table" ]; then
      c=$(printf "fa" | xxd -p -r | iconv -f 'CP437//' -t 'UTF-8')
      printf "%32s" | sed 's/../'"$c"'  /g;s/^/  0   /;s/$/\n/'
      printf "%32s" | sed 's/../'"$c"'  /g;s/^/  1   /'
    fi



    #
    # passa por todos os códigos entre o decimal 32 e o 255
    # efetuando a conversão deles para 'codepage 437'
    for x in {32..255}; do
      #
      # Sempre que o módulo de 16=0 irá adicionar uma quebra de linha.
      (( x % 16 == 0 )) && printf "\n"


      #
      # 'table' : imprime os índices hexadecimais laterais 0-f
      if [ $mseOutputType == "table" ]; then
        # A operação da linha abaixo retorna um valor 'não zero' quanto a
        # sua execução quando o resultado da operação é '0', o que ocasiona
        # a interupção do script pelo bash quando ele está setado com a opção
        # set -e
        #
        # Para evitar esta interrupção, é usado o '|| true'
        n=$(expr $x % 15) || true
        (( (x % 16) == 0 )) && printf "%-4x" $n | sed 's/0/f/;s/^/  /'
      fi


      #
      # Converte o inteiro para o simbolo correspondente
      printf "%02x" $x | xxd -p -r | iconv -f 'CP437//' -t 'UTF-8' | sed 's/.*/&  /'


      #
      # 'table' : imprime uma linha separadora entre os caracteres ascii [0-127]
      #           e os demais [128-255]
      if [ $mseOutputType == "table" ]; then
        (( x == 127 )) && printf "%46s" | sed 's/ /-/g;s/^/      /;i\ '
      fi
    done


    #
    # 'table' : imprime o rodapé com os índices hexadecimais de 0-f
    if [ $mseOutputType == "table" ]; then
      printf "%46s" | sed 's/ /-/g;s/^/\n      /;s/$/\n      /';
      for x in {0..15}; do
        printf "%-3x" $x;
      done;
    fi

    printf "\n"

  else

    local i
    local mseLine
    local mseRawTable
    local mseHasTwoDots=0

    local mseChar
    local mseCDec
    local mseCHex
    local mseCOct

    mseRawTable="Index:Char:Decimal:Hex:Octal\n"

    for (( i=mseIniCode; i<=mseEndCode; i++ )); do
      if [ $i == 37 ]; then
        mseLine="37:%%:37:25:045"
      elif [ $i == 42 ]; then
        mseLine="42:*:42:2A:052"
      else
        mseChar=$(printf "%02x" $i | xxd -p -r | iconv -f 'CP437//' -t 'UTF-8')
        mseCDec=$(mse_str_convert_charToDecimal $mseChar 1)
        mseCHex=$(mse_str_convert_charToHex $mseChar 1)
        mseCOct=$(mse_str_convert_charToOctal $mseChar 1)

        if [ "${mseChar}" == ":" ]; then
          mseChar="[[TWODOTS]]"
          mseHasTwoDots=1
        fi

        mseLine="$i:${mseChar}:${mseCDec}:${mseCHex}:${mseCOct}"
      fi

      mseRawTable+="${mseLine}\n"
    done

    printf "\n"

    mseRawTable=$(printf "${mseRawTable}")
    mseRawTable=$(column -e -t -s ":" <<< "${mseRawTable}")

    if [ "${mseHasTwoDots}" == 1 ]; then
      local oIFS=$IFS
      local mseLineRaw

      while read -r mseLineRaw || [ -n "${mseLineRaw}" ]; do
        if [[ "${mseLineRaw}" =~ "[[TWODOTS]]" ]]; then
          mseLineRaw=$(mse_str_replacePlaceHolder "${mseLineRaw}" "TWODOTS" ":          ")
        fi
        printf "%s\n" "${mseLineRaw}"
      done <<< "$mseRawTable"

      IFS=$oIFS
    else
      printf "${mseRawTable}\n"
    fi

    printf "\n"
  fi
}





#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_font_showCharacters_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=3
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="ReturnFormat :: r :: list"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0_labels"]="table, char, code"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0_values"]="table, char, code"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="StartCharCode :: o :: int :: :: 33 :: 255"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="LastCharCode :: o :: int :: :: 33 :: 255"
}
