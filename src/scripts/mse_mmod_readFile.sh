#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Lê um arquivo/string linha a linha.
# Retorna todas as linhas que corresponderem às definições indicadas nos
# parametros de controle.
#
# @param string $1
# Caminho até o arquivo/string que será lida.
#
# @param bool $2
# Opcional. Se omitido, "" ou "0" irá ocultar as linhas vazias.
# Se "1" irá mostrar as linhas vazias.
#
# @param bool $3
# Opcional. Se omitido, "" ou "0" irá ocultar o número da linha.
# Se "1" irá mostrar o número da linha.
# O número da linha será retornado como primeira informação e estará
# separada do início do texto por um caracter '#'.
mse_mmod_readFile()
{
  local mseFileContent


  #
  # Apenas se há definição de um arquivo/string
  mseFileContent=""
  if [ $# -ge 1 ] && [ "$1" != "" ]; then
    mseFileContent="$1"
    if [ -f "$1" ]; then
      mseFileContent=$(< "$1")
    fi
  fi



  #
  # Obtendo um conteúdo válido
  if [ "${mseFileContent}" != "" ]; then
    local mseLineShowEmpty
    local mseLineShowNumber

    local mseValidSection
    local mseSectionStartFunctionName
    local mseSectionStartFunctionArgs
    local mseSectionEndFunctionName
    local mseSectionEndFunctionArgs
    local mseSectionShowFirstLine

    local mseValidLine
    local mseLineCheckFunctionName
    local mseLineCheckFunctionArgs
    local mseLineCheckFunctionInvert

    local mseTransformLineFunctionName
    local mseTransformLineFunctionArgs

    local oIFS
    local mseLineRaw
    local mseLineCount




    #
    # Verifica se é para retornar linhas vazias
    mseLineShowEmpty=0
    if [ $# -ge 2 ] && [ $2 == 1 ]; then
      mseLineShowEmpty=1
    fi
    #
    # Verifica se é para retornar o número da linha
    mseLineShowNumber=0
    if [ $# -ge 3 ] && [ $3 == 1 ]; then
      mseLineShowNumber=1
    fi
    #
    # Verifica se deve retornar todas as linhas ou
    # apenas as que estão identificadas como estando dentro
    # de um bloco válido
    mseValidSection=1
    mseSectionStartFunctionName=""
    mseSectionStartFunctionArgs=""
    mseSectionEndFunctionName=""
    mseSectionEndFunctionArgs=""
    mseSectionShowFirstLine=0
    if [ "${MSE_GLOBAL_MODULE_READ_BLOCK["start"]}" != "" ]; then
      mseValidSection=0
      mseSectionStartFunctionName="${MSE_GLOBAL_MODULE_READ_BLOCK["start"]}"
      mseSectionStartFunctionArgs="${MSE_GLOBAL_MODULE_READ_BLOCK["start_args"]}"

      mseSectionEndFunctionName="${MSE_GLOBAL_MODULE_READ_BLOCK["end"]}"
      mseSectionEndFunctionArgs="${MSE_GLOBAL_MODULE_READ_BLOCK["end_args"]}"

      if [ "${MSE_GLOBAL_MODULE_READ_BLOCK["print_start_line"]}" == "1" ]; then
        mseSectionShowFirstLine=1
      fi
    fi
    #
    # Verifica se existe um teste a ser feito no conteúdo de cada linha
    # para identificar se ela realmente deve ser retornada ou não
    mseLineCheckFunctionName=""
    mseLineCheckFunctionArgs=""
    mseLineCheckFunctionInvert=0
    if [ "${MSE_GLOBAL_MODULE_READ_LINE["check"]}" != "" ]; then
      mseLineCheckFunctionName="${MSE_GLOBAL_MODULE_READ_LINE["check"]}"
      mseLineCheckFunctionArgs="${MSE_GLOBAL_MODULE_READ_LINE["check_args"]}"

      if [ "${MSE_GLOBAL_MODULE_READ_LINE["check_invert"]}" == "1" ]; then
        mseLineCheckFunctionInvert=1
      fi
    fi
    #
    # Verifica se existe alguma transformação a ser feita nas linhas que devem ser
    # retornadas
    mseTransformLineFunctionName=""
    mseTransformLineFunctionArgs=""
    if [ "${MSE_GLOBAL_MODULE_READ_LINE["transform"]}" != "" ]; then
      mseTransformLineFunctionName="${MSE_GLOBAL_MODULE_READ_LINE["transform"]}"
      mseTransformLineFunctionArgs="${MSE_GLOBAL_MODULE_READ_LINE["transform_args"]}"
    fi


    oIFS=$IFS
    IFS=$'\n'


    #
    # A solução ' || [ -n "${mseRawLine}" ]' garante que a última linha será também
    # incluída no loop. Sem isto, a última linha é considerada 'EOF' e o loop não
    # itera sobre ela.
    while read mseLineRaw || [ -n "${mseLineRaw}" ]; do
      ((mseLineCount=mseLineCount+1))
      mseValidLine=1


      #
      # Apenas se estiver configurado para mostrar linhas vazias
      if [ "${mseLineRaw}" != "" ] || [ $mseLineShowEmpty == 1 ]; then
        #
        # Verifica se esta linha pode identificar o início de um
        # bloco de conteúdo válido
        if [ $mseValidSection == 0 ]; then
          if [ "${mseSectionStartFunctionName}" != "" ]; then
            mseValidSection=$($mseSectionStartFunctionName "$mseLineCount" "${mseLineRaw}" "$mseSectionStartFunctionArgs")

            if [ $mseValidSection == 1 ] && [ $mseSectionShowFirstLine == 0 ]; then
              mseValidLine=0
            fi
          fi
        else

          #
          # Se está em um bloco de conteúdo válido
          # verifica se a linha atual não marca sua linha final.
          if [ "${mseSectionEndFunctionName}" != "" ]; then
            mseValidSection=$($mseSectionEndFunctionName "$mseLineCount" "${mseLineRaw}" "$mseSectionEndFunctionArgs")
            #
            # Inverte a verificação anterior para que ela faça sentido dentro do contexto atual
            # e mantenha o algoritmo em uma seção válida enquanto o final da mesma não for encontrado
            if [ $mseValidSection == 1 ]; then mseValidSection=0; else mseValidSection=1; fi
          fi
        fi


        #
        # Estando em uma seção válida e a linha
        # é também válida
        if [ $mseValidSection == 1 ] && [ $mseValidLine == 1 ]; then

          #
          # Havendo alguma forma de verificação do conteúdo da linha
          # efetua-o
          if [ "$mseLineCheckFunctionName" != "" ]; then
            mseValidLine=$($mseLineCheckFunctionName "$mseLineCount" "${mseLineRaw}" "$mseLineCheckFunctionArgs")

            #
            # Sendo para inverter a lógica da verificação...
            if [ $mseLineCheckFunctionInvert == "1" ]; then
              if [ $mseValidLine == 1 ]; then mseValidLine=0; else mseValidLine=1; fi
            fi
          fi



          #
          # Sendo também uma linha válida
          if [ $mseValidLine == 1 ]; then

            #
            # Verifica se há alguma transformação a ser feita no conteúdo
            # da linha antes de retorná-la
            if [ "$mseTransformLineFunctionName" != "" ]; then
              mseLineRaw=$($mseTransformLineFunctionName "$mseLineCount" "${mseLineRaw}" "$mseTransformLineFunctionArgs")
            fi

            if [ $mseLineShowNumber == 1 ]; then
              printf "${mseLineCount}#"
            fi
            printf "${mseLineRaw}\n"
          fi
        fi
      fi
    done <<< "$mseFileContent"

    IFS=$oIFS
  fi
}
