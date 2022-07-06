#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Lê um arquivo ou string linha a linha.
# Retorna todas as linhas que corresponderem às definições indicadas nas
# consigurações de leitura.
#
# @param string $1
# Caminho até o arquivo ou string que será lida.
#
# @param string $2
# Nome do array associativo que traz as configurações para leitura do arquivo
# permitindo assim identificar o conteúdo que se deseja retornar.
#
# Para configurar este array associativo use a função "mse_file_prepareRead".
#
# @param bool $3
# Se "" ou "0" irá mostrar todas as linhas incluindo as vazias.
# Se "1" irá remover as linhas vazias.
# Se definido, reescreve a configuração "line_hide_empty" das configurações
# passadas.
#
# @param bool $4
# Se "" ou "0" irá trazer o valor bruto da linha, tal qual ela consta no
# arquivo original.
# Se "1" irá apresentar o número de cada linha em seu início.
# Se definido, reescreve a configuração "line_show_number" das configurações
# passadas.
# O número da linha será retornado como primeira informação e estará
# separada do início do texto por um caracter "#".
#
# @return
# Coleção de linhas selecionadas na leitura do arquivo conforme os critérios
# indicados.
mse_file_read() {
  local mseLineRaw
  local mseFileContent


  #
  # Lê o arquivo ou aloca a string passada
  mseFileContent="$1"
  if [ -f "$mseFileContent" ]; then
    mseFileContent=$(< "$mseFileContent")
  fi



  if [ "${mseFileContent}" != "" ]; then
    declare -n mseReadOptions="${2}"


    local block_start_check
    local block_start_check_args
    local block_start_check_args_sep
    local block_start_get_first_line

    local block_end_check
    local block_end_check_args
    local block_end_check_args_sep
    local block_end_get_last_line

    local block_check_invert


    local line_check
    local line_check_args
    local line_check_args_sep
    local line_check_invert
    local line_check_has_linenumber


    local line_transform
    local line_transform_args
    local line_transform_args_sep
    local line_transform_has_linenumber


    local line_hide_empty
    local line_show_number



    #
    # Verifica se há uma definição de início de bloco válido.
    # Neste caso, considera que apenas serão retornadas as linhas que estão posicionadas
    # a partir de alguma que, ao ser verificada, seja considerada como o início do bloco
    # de interesse.
    if [ "${mseReadOptions[block_start_check]}" != "" ]; then
      block_start_check="${mseReadOptions[block_start_check]}"
      block_start_check_args="${mseReadOptions[block_start_check_args]}"
      block_start_check_args_sep="${mseReadOptions[block_start_check_args_sep]}"
      block_start_get_first_line="0"

      #
      # Verifica necessidade de 'splitar' os argumentos de 'block_start_check_args'
      if [ "${block_start_check_args_sep}" != "" ]; then
        mse_str_split "${block_start_check_args_sep}" "${block_start_check_args}"
        block_start_check_args_array=("${MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}")
      fi

      if [ "${mseReadOptions[block_start_get_first_line]}" == "1" ]; then
        block_start_get_first_line="1"
      fi
    fi
    #
    # Verifica se há uma definição de fim de um bloco válido.
    # A partir deste ponto nenhuma outra linha será retornada e a leitura será
    # dada como encerrada.
    if [ "${mseReadOptions[block_end_check]}" != "" ]; then
      block_end_check="${mseReadOptions[block_end_check]}"
      block_end_check_args="${mseReadOptions[block_end_check_args]}"
      block_end_check_args_sep="${mseReadOptions[block_end_check_args_sep]}"
      block_end_get_last_line="0"

      #
      # Verifica necessidade de 'splitar' os argumentos de 'block_end_check_args'
      if [ "${block_end_check_args_sep}" != "" ]; then
        mse_str_split "${block_end_check_args_sep}" "${block_end_check_args}"
        block_end_check_args_array=("${MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}")
      fi

      if [ "${mseReadOptions[block_end_get_last_line]}" == "1" ]; then
        block_end_get_last_line="1"
      fi
    fi

    block_check_invert="0"
    if [ "${mseReadOptions[block_check_invert]}" == "1" ]; then
      block_check_invert="1"
    fi



    #
    # Verifica se existe um teste a ser feito no conteúdo de cada linha
    # para identificar se ela realmente deve ser retornada ou não
    if [ "${mseReadOptions[line_check]}" != "" ]; then
      line_check="${mseReadOptions[line_check]}"
      line_check_args="${mseReadOptions[line_check_args]}"
      line_check_args_sep="${mseReadOptions[line_check_args_sep]}"
      line_check_invert="0"
      line_check_has_linenumber="0"

      #
      # Verifica necessidade de 'splitar' os argumentos de 'line_check_args'
      if [ "${line_check_args_sep}" != "" ]; then
        mse_str_split "${line_check_args_sep}" "${line_check_args}"
        line_check_args_array=("${MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}")
      fi

      if [ "${mseReadOptions[line_check_invert]}" == "1" ]; then
        line_check_invert="1"
      fi

      if [ "${mseReadOptions[line_check_has_linenumber]}" == "1" ]; then
        line_check_has_linenumber="1"
      fi
    fi



    #
    # Verifica se existe alguma transformação a ser feita nas linhas que devem ser
    # retornadas
    if [ "${mseReadOptions[line_transform]}" != "" ]; then
      line_transform="${mseReadOptions[line_transform]}"
      line_transform_args="${mseReadOptions[line_transform_args]}"
      line_transform_args_sep="${mseReadOptions[line_transform_args_sep]}"

      #
      # Verifica necessidade de 'splitar' os argumentos de 'line_transform_args'
      if [ "${line_transform_args_sep}" != "" ]; then
        mse_str_split "${line_transform_args_sep}" "${line_transform_args}"
        line_transform_args_array=("${MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}")
      fi

      if [ "${mseReadOptions[line_transform_has_linenumber]}" == "1" ]; then
        line_transform_has_linenumber=1
      fi
    fi



    line_hide_empty="0"
    if [ "${mseReadOptions[line_hide_empty]}" == "1" ] || ([ $# -ge 3 ] && [ "$3" == "1" ]); then
      line_hide_empty="1"
    fi

    line_show_number="0"
    if [ "${mseReadOptions[line_show_number]}" == "1" ] || ([ $# -ge 4 ] && [ "$4" == "1" ]); then
      line_show_number="1"
    fi





    IFS=$'\n'
    local mseValidSection="1"
    local mseValidLine=1
    local mseValidLastLine=0
    local mseLineCount=0
    local mseLineRaw=""

    if [ "${block_start_check}" != "" ]; then
      mseValidSection=0
    fi

    #
    # A solução ' || [ -n "${mseRawLine}" ]' garante que a última linha será também
    # incluída no loop. Sem isto, a última linha é considerada 'EOF' e o loop não
    # itera sobre ela.
    while read mseLineRaw || [ -n "${mseLineRaw}" ]; do
      ((mseLineCount=mseLineCount+1))
      mseValidLine=1
      mseValidLastLine=0


      #
      # Apenas se a linha atual possuir conteudo
      # OU
      # a configuração está definida para mostrar as linhas vazias
      if [ "${mseLineRaw}" != "" ] || [ "$line_hide_empty" == "0" ]; then
        #
        # Verifica se esta linha pode identificar o início de um
        # bloco de conteúdo válido
        if [ "${mseValidSection}" == "0" ]; then
          if [ "${block_start_check}" != "" ]; then
            mseValidSection=$($block_start_check "${2}" "${mseLineCount}" "${mseLineRaw}" "0" "${block_start_check_args}")

            if [ "${mseValidSection}" == "1" ] && [ "${block_start_get_first_line}" == "0" ]; then
              mseValidLine=0
            fi
          fi
        else

          #
          # Se está em um bloco de conteúdo válido
          # verifica se a linha atual delimita seu final.
          if [ "${block_end_check}" != "" ]; then
            mseValidSection=$($block_end_check "${2}" "${mseLineCount}" "${mseLineRaw}" "0" "${block_end_check_args}")
            #
            # Inverte a verificação anterior para que ela faça sentido dentro do contexto atual
            # e mantenha o algoritmo em uma seção válida enquanto o final da mesma não for encontrado
            if [ "${mseValidSection}" == "1" ]; then
              if [ "${block_end_get_last_line}" == "1" ]; then
                mseValidSection=1
                mseValidLastLine=1
              else
                mseValidSection=0
              fi
            else
              mseValidSection=1
            fi
          fi
        fi


        #
        # Estando em uma seção válida e a linha
        # é também válida
        if [ "${mseValidSection}" == "1" ] && [ "${mseValidLine}" == "1" ]; then

          #
          # Havendo alguma forma de verificação do conteúdo da linha
          # efetua-o
          if [ "$line_check" != "" ]; then
            mseValidLine=$($line_check "${mseLineCount}" "${mseLineRaw}" "${line_check_has_linenumber}" "${line_check_args}")

            #
            # Sendo para inverter a lógica da verificação...
            if [ "${line_check_invert}" == "1" ]; then
              if [ "${mseValidLine}" == "1" ]; then
                mseValidLine="0"
              else
                mseValidLine="1"
              fi
            fi
          fi



          #
          # Sendo também uma linha válida
          if [ "${mseValidLine}" == "1" ]; then

            #
            # Verifica se há alguma transformação a ser feita no conteúdo
            # da linha antes de retorná-la
            if [ "${line_transform}" != "" ]; then
              mseLineRaw=$($line_transform "${mseLineCount}" "${mseLineRaw}" "${line_transform_has_linenumber}" "${line_transform_args}")
            fi

            if [ "${line_show_number}" == "1" ]; then
              printf "${mseLineCount}#"
            fi
            printf "${mseLineRaw}\n"

            if [ "${mseValidLastLine}" == "1" ]; then
              mseValidSection=0
            fi
          fi
        fi
      fi
    done <<< "$mseFileContent"

    IFS=$' \t\n'
  fi


  return 0
}
MSE_GLOBAL_CMD["file read"]="mse_file_read"




#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_file_read_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=4
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="PathToFile :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="ReadOptions :: r :: assocName"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="ShowEmptyLines :: o :: bool :: 0"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_3"]="ShowLineNumber :: o :: bool :: 0"
}
