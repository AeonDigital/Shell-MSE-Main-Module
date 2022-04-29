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
#
# @return string
# Coleção de linhas selecionadas na leitura do arquivo conforme os critérios
# indicados.
mse_file_read()
{
  local mseReturn

  local mseLineRaw
  local mseFileContent
  local oIFS


  mseReturn=0
  mseFileContent="$1"
  if [ -f "$mseFileContent" ]; then
    mseFileContent=$(< "$mseFileContent")
  fi


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
    local mseLineCheckFunctionNumberLine

    local mseTransformLineFunctionName
    local mseTransformLineFunctionArgs
    local mseTransformLineFunctionNumberLine

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

      #
      # Verifica necessidade de 'splitar' os argumentos de 'start_args'
      if [ "${MSE_GLOBAL_MODULE_READ_BLOCK["start_args_sep"]}" != "" ]; then
        unset MSE_GLOBAL_MODULE_READ_BLOCK_START_ARGS_ARRAY
        declare -ga MSE_GLOBAL_MODULE_READ_BLOCK_START_ARGS_ARRAY=()

        mse_str_split "${MSE_GLOBAL_MODULE_READ_BLOCK["start_args_sep"]}" "$mseSectionStartFunctionArgs"
        MSE_GLOBAL_MODULE_READ_BLOCK_START_ARGS_ARRAY=("${MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}")
      fi


      mseSectionEndFunctionName="${MSE_GLOBAL_MODULE_READ_BLOCK["end"]}"
      mseSectionEndFunctionArgs="${MSE_GLOBAL_MODULE_READ_BLOCK["end_args"]}"

      #
      # Verifica necessidade de 'splitar' os argumentos de 'end_args'
      if [ "${MSE_GLOBAL_MODULE_READ_BLOCK["end_args_sep"]}" != "" ]; then
        unset MSE_GLOBAL_MODULE_READ_BLOCK_END_ARGS_ARRAY
        declare -ga MSE_GLOBAL_MODULE_READ_BLOCK_END_ARGS_ARRAY=()

        mse_str_split "${MSE_GLOBAL_MODULE_READ_BLOCK["end_args_sep"]}" "$mseSectionEndFunctionArgs"
        MSE_GLOBAL_MODULE_READ_BLOCK_END_ARGS_ARRAY=("${MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}")
      fi

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
    mseLineCheckFunctionNumberLine=0
    if [ "${MSE_GLOBAL_MODULE_READ_LINE["check"]}" != "" ]; then
      mseLineCheckFunctionName="${MSE_GLOBAL_MODULE_READ_LINE["check"]}"
      mseLineCheckFunctionArgs="${MSE_GLOBAL_MODULE_READ_LINE["check_args"]}"

      #
      # Verifica necessidade de 'splitar' os argumentos de 'check'
      if [ "${MSE_GLOBAL_MODULE_READ_LINE["check_args_sep"]}" != "" ]; then
        unset MSE_GLOBAL_MODULE_READ_LINE_ARGS_ARRAY
        declare -ga MSE_GLOBAL_MODULE_READ_LINE_ARGS_ARRAY=()

        mse_str_split "${MSE_GLOBAL_MODULE_READ_LINE["check_args_sep"]}" "$mseLineCheckFunctionArgs"
        MSE_GLOBAL_MODULE_READ_LINE_ARGS_ARRAY=("${MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}")
      fi

      if [ "${MSE_GLOBAL_MODULE_READ_LINE["check_invert"]}" == "1" ]; then
        mseLineCheckFunctionInvert=1
      fi

      if [ "${MSE_GLOBAL_MODULE_READ_LINE["check_has_linenumber"]}" == "1" ]; then
        mseLineCheckFunctionNumberLine=1
      fi
    fi
    #
    # Verifica se existe alguma transformação a ser feita nas linhas que devem ser
    # retornadas
    mseTransformLineFunctionName=""
    mseTransformLineFunctionArgs=""
    mseTransformLineFunctionNumberLine=0
    if [ "${MSE_GLOBAL_MODULE_READ_LINE["transform"]}" != "" ]; then
      mseTransformLineFunctionName="${MSE_GLOBAL_MODULE_READ_LINE["transform"]}"
      mseTransformLineFunctionArgs="${MSE_GLOBAL_MODULE_READ_LINE["transform_args"]}"

      #
      # Verifica necessidade de 'splitar' os argumentos de 'transform'
      if [ "${MSE_GLOBAL_MODULE_READ_LINE["transform_args_sep"]}" != "" ]; then
        unset MSE_GLOBAL_MODULE_READ_TRANSFORM_ARGS_ARRAY
        declare -ga MSE_GLOBAL_MODULE_READ_TRANSFORM_ARGS_ARRAY=()

        mse_str_split "${MSE_GLOBAL_MODULE_READ_LINE["transform_args_sep"]}" "$mseTransformLineFunctionArgs"
        MSE_GLOBAL_MODULE_READ_TRANSFORM_ARGS_ARRAY=("${MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}")
      fi

      if [ "${MSE_GLOBAL_MODULE_READ_LINE["transform_has_linenumber"]}" == "1" ]; then
        mseTransformLineFunctionNumberLine=1
      fi
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
            mseValidLine=$($mseLineCheckFunctionName "$mseLineCount" "${mseLineRaw}" "$mseLineCheckFunctionNumberLine" "$mseLineCheckFunctionArgs")

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
              mseLineRaw=$($mseTransformLineFunctionName "$mseLineCount" "${mseLineRaw}" "$mseTransformLineFunctionNumberLine" "$mseTransformLineFunctionArgs")
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


  return 0
}





#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_file_countLines_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=3
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="PathToFile :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="ShowEmptyLines :: o :: bool :: 0"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="ShowLineNumber :: o :: bool :: 0"
}
