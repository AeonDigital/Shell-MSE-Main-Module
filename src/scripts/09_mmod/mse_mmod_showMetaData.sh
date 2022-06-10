#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Exibe os metadados de módulos, submódulos e funções formatados conforme
# a configuração passada nos parametros.
#
#
# @param bool $1
# Opcional.
# Omita ou indique "0" para que a saída seja uma lista simples.
# Indique "1" para uma saída estilizada.
#
# @param bool $2
# Opcional.
# Indica se deve apresentar as funções de cada módulo e submódulo.
#   - Omita ou indique "1" para mostrar tudo.
#   - Indique "0" para ocultar.
#
# @param string $3
# Opcional. Filtragem de módulos.
# Especifique parte ou todo o nome de um módulo atualmente carregado para
# apenas as informações referentes ao mesmo.
#
# A pesquisa ocorrerá de forma "case insensitive"
#
#
# @param string $4
# Opcional. Filtragem de submódulos.
# Especifique o prefixo identificador de um submódulo para que seja retornado
# apenas as informações referentes ao mesmo.
#
# Use o valor "-" para indicar que deseja retornar todas as funções que NÃO
# pertencem a módulo algum e sim, exclusivamente ao módulo principal.
#
# Tenha em mente que um submódulo é definido de forma lógica usando uma string
# usada como prefixo em todas funções que se deseja que façam parte do mesmo
# e que estão presentes no mesmo módulo principal. Portanto, diferente da
# filtragem de módulos e de funções, é preciso indicar o nome completo e
# correto do submódulo para que a pesquisa seja feita corretamente.
#
# A pesquisa ocorrerá de forma "case insensitive"
#
#
# @param string $5
# Opcional. Filtragem de funções.
# Especifique parte ou todo o nome de uma função para que ela seja pesquisada
# entre os módulos e submódulos.
#
# A pesquisa ocorrerá de forma "case insensitive"
#
# @return
# Uma lista contendo todas as informações requeridas formatadas conforme
# indicado. A lista será sempre ordenada alfabeticamente.
mse_mmod_showMetaData() {

  local msePrettyFormat=0
  if [ "$1" == "0" ] || [ "$1" == "1" ]; then
    msePrettyFormat="$1"
  fi

  local mseShowFunctions=1
  if [ "$2" == "0" ] || [ "$2" == "1" ]; then
    mseShowFunctions="$2"
  fi

  local mseFilterModules="$3"
  local mseFilterSubModules="$4"
  local mseFilterFunctions="$5"



  local mseRawData
  local mseRawSubModuleData
  mseRawData=$(mse_mmod_showRawMetaData 1 1 1 "${mseFilterModules}" "${mseFilterSubModules}" "${mseFilterFunctions}")


  if [ "${mseRawData}" != "" ]; then
    local mseLineRaw
    local mseTmpLine
    local mseAddLine
    local mseModStart=0
    local mseModFirst=1

    declare -a mseReturnData=()

    local oIFS=$IFS
    IFS=$'\n'


    #
    # Se estiver usando uma apresentação estilizada.
    local msePFIndentModule
    local msePFIndentSubModule
    local msePFIndentFunction

    local msePFColorModule
    local msePFColorSubModule
    local msePFColorFunctions

    local msePFColorSeparator
    local msePFColorSelectedElements
    local msePFColorTotalElements

    if [ "${msePrettyFormat}" == "1" ]; then
      msePFIndentModule="  "
      msePFIndentSubModule="     "
      msePFIndentFunction="       "

      #
      # Inicia a coloração dos elementos.
      "${MSE_GLOBAL_THEME_NAME}_setColorDefinition"
      msePFColorModule=${MSE_GCSMDCTC[Module]}
      msePFColorSubModule=${MSE_GCSMDCTC[SubModule]}
      msePFColorFunctions=${MSE_GCSMDCTC[Functions]}

      msePFColorSeparator=${MSE_GCSMDCTC[Separator]}
      msePFColorSeparatorBar=${MSE_GCSMDCTC[SeparatorBar]}
      msePFColorSelectedElements=${MSE_GCSMDCTC[SelectedElements]}
      msePFColorTotalElements=${MSE_GCSMDCTC[TotalElements]}

      mseReturnData+=("")
    fi


    while read mseLineRaw || [ -n "${mseLineRaw}" ]; do
      mse_str_split "::" "${mseLineRaw}"
      mseTmpLine=""
      mseAddLine=1


      if [ "${msePrettyFormat}" == "0" ]; then
        mseTmpLine="${MSE_GLOBAL_MODULE_SPLIT_RESULT[0]}"

        case "${MSE_GLOBAL_MODULE_SPLIT_RESULT[0]}" in
          M)
            mseTmpLine+="  ${MSE_GLOBAL_MODULE_SPLIT_RESULT[1]} (${MSE_GLOBAL_MODULE_SPLIT_RESULT[3]}/${MSE_GLOBAL_MODULE_SPLIT_RESULT[2]})"
          ;;
          S)
            mseTmpLine+="    ${MSE_GLOBAL_MODULE_SPLIT_RESULT[2]} (${MSE_GLOBAL_MODULE_SPLIT_RESULT[4]}/${MSE_GLOBAL_MODULE_SPLIT_RESULT[3]})"
          ;;
          F)
            if [ "${MSE_GLOBAL_MODULE_SPLIT_RESULT[2]}" == "-" ]; then
              mseTmpLine+="    ${MSE_GLOBAL_MODULE_SPLIT_RESULT[3]}"
            else
              mseTmpLine+="      ${MSE_GLOBAL_MODULE_SPLIT_RESULT[3]}"
            fi

            if [ "${mseShowFunctions}" == "0" ]; then
              mseAddLine=0
            fi
          ;;
        esac

        if [ "${mseAddLine}" == 1 ]; then
          mseReturnData+=("${mseTmpLine}")
        fi


      else

        case "${MSE_GLOBAL_MODULE_SPLIT_RESULT[0]}" in
          M)
            mseModStart=1
            mseTmpLine+="${msePFIndentModule}"
            mseTmpLine+=":: ${msePFColorModule}${MSE_GLOBAL_MODULE_SPLIT_RESULT[1]}${mseNONE} "

            mseTmpLine+="${msePFColorSeparator}(${mseNONE}"
            mseTmpLine+="${msePFColorSelectedElements}${MSE_GLOBAL_MODULE_SPLIT_RESULT[3]}${mseNONE}"
            mseTmpLine+="${msePFColorSeparatorBar}/${mseNONE}"
            mseTmpLine+="${msePFColorTotalElements}${MSE_GLOBAL_MODULE_SPLIT_RESULT[2]}${mseNONE}"
            mseTmpLine+="${msePFColorSeparator})${mseNONE}"

            if [ "${mseModFirst}" == "0" ]; then
              mseReturnData+=("")
              mseReturnData+=("")
            else
              mseModFirst=0
            fi

            mseReturnData+=($(printf "${mseTmpLine}"))

            #
            # Efetua uma consulta que retorna apenas os metadados referentes aos submódulos
            # para uso na montagem de apresentações formatadas.
            mseRawSubModuleData=$(mse_mmod_showRawMetaData 0 1 0 "${MSE_GLOBAL_MODULE_SPLIT_RESULT[1]}" "${mseFilterSubModules}" "${mseFilterFunctions}")
            if [ "${mseRawSubModuleData}" != "" ]; then
              declare -a mseTmpArrSubModuleLine=()
              declare -a mseTmpArrSubModuleLineNoColor=()
              local mseTmpStrSubModuleLine
              local mseSubModuleLineNoColor
              local mseSubModuleLine
              local mseSubModuleLineRaw
              local mseSubModuleNameMaxLength=0

              #
              # Para cada linha de dados de um sub módulo...
              while read mseSubModuleLineRaw || [ -n "${mseSubModuleLineRaw}" ]; do
                mse_str_split "::" "${mseSubModuleLineRaw}"

                mseSubModuleLine=""
                mseSubModuleLine+="${msePFColorSubModule}${MSE_GLOBAL_MODULE_SPLIT_RESULT[2]}${mseNONE} "
                mseSubModuleLine+="${msePFColorSeparator}(${mseNONE}"
                mseSubModuleLine+="${msePFColorSelectedElements}${MSE_GLOBAL_MODULE_SPLIT_RESULT[4]}${mseNONE}"
                mseSubModuleLine+="${msePFColorSeparatorBar}/${mseNONE}"
                mseSubModuleLine+="${msePFColorTotalElements}${MSE_GLOBAL_MODULE_SPLIT_RESULT[3]}${mseNONE}"
                mseSubModuleLine+="${msePFColorSeparator})${mseNONE}"
                mseTmpArrSubModuleLine+=($(printf "${mseSubModuleLine}"))

                #
                # Mantém o registro da maior quantidade de caracteres necessária para
                # a descrição dos submódulos.
                mseSubModuleLineNoColor="${MSE_GLOBAL_MODULE_SPLIT_RESULT[2]} (${MSE_GLOBAL_MODULE_SPLIT_RESULT[4]}/${MSE_GLOBAL_MODULE_SPLIT_RESULT[3]})"
                mseTmpArrSubModuleLineNoColor+=("${#mseSubModuleLineNoColor}")
                if [ "${#mseSubModuleLineNoColor}" -gt "${mseSubModuleNameMaxLength}" ]; then
                  mseSubModuleNameMaxLength="${#mseSubModuleLineNoColor}"
                fi
              done <<< "$mseRawSubModuleData"


              local i
              local d
              local c=0
              local mseTmpSubModuleName
              local mseTmpSubModuleCounter
              local mseTmpSubModuleNameLength
              local mseDiff

              mseTmpSubModuleCounter="${#mseTmpArrSubModuleLine[@]}"
              for ((i=0; i<mseTmpSubModuleCounter; i++)); do
                mseTmpSubModuleName="${mseTmpArrSubModuleLine[$i]}"
                mseTmpSubModuleNameLength="${mseTmpArrSubModuleLineNoColor[$i]}"

                #
                # Adiciona espaços ao final da partícula de informação
                # para fechar o tamanho mínimo desejado.
                ((mseDiff=mseSubModuleNameMaxLength-mseTmpSubModuleNameLength))
                for ((d=0; d<mseDiff; d++)); do
                  mseTmpSubModuleName+=" "
                done

                mseTmpStrSubModuleLine+="${mseTmpSubModuleName}  "

                ((c=c+1))
                if [ "${c}" == 5 ] || [ "${c}" == "${mseTmpSubModuleCounter}" ]; then
                  mseReturnData+=("${msePFIndentSubModule}${mseTmpStrSubModuleLine}")
                  mseTmpStrSubModuleLine=""
                fi
              done
            fi
          ;;

          S)
            if [ "${mseShowFunctions}" == "1" ]; then
              mseReturnData+=("")

              mseSubModuleLine="${msePFIndentSubModule}"
              mseSubModuleLine+="${msePFColorSubModule}${MSE_GLOBAL_MODULE_SPLIT_RESULT[2]}${mseNONE} "
              mseSubModuleLine+="${msePFColorSeparator}(${mseNONE}"
              mseSubModuleLine+="${msePFColorSelectedElements}${MSE_GLOBAL_MODULE_SPLIT_RESULT[4]}${mseNONE}"
              mseSubModuleLine+="${msePFColorSeparatorBar}/${mseNONE}"
              mseSubModuleLine+="${msePFColorTotalElements}${MSE_GLOBAL_MODULE_SPLIT_RESULT[3]}${mseNONE}"
              mseSubModuleLine+="${msePFColorSeparator})${mseNONE}"

              mseReturnData+=($(printf "${mseSubModuleLine}"))
            fi
          ;;

          F)
            if [ "${MSE_GLOBAL_MODULE_SPLIT_RESULT[2]}" == "-" ]; then
              if [ "${mseModStart}" == "1" ]; then
                mseReturnData+=("")
                mseModStart=0
              fi
              mseTmpLine+="${msePFIndentSubModule}${msePFColorFunctions}${MSE_GLOBAL_MODULE_SPLIT_RESULT[3]}${mseNONE}"
            else
              mseTmpLine+="${msePFIndentFunction}${msePFColorFunctions}${MSE_GLOBAL_MODULE_SPLIT_RESULT[3]}${mseNONE}"
            fi

            if [ "${mseShowFunctions}" == "0" ]; then
              mseAddLine=0
            fi


            if [ "${mseAddLine}" == 1 ]; then
              mseReturnData+=($(printf "${mseTmpLine}"))
            fi
          ;;
        esac
      fi
    done <<< "$mseRawData"


    IFS=$oIFS
    if [ "${msePrettyFormat}" == "1" ] && [ "${mseShowFunctions}" == "1" ]; then
      mseReturnData+=("")
    fi
    printf "%s\n" "${mseReturnData[@]}"
  fi
}
MSE_GLOBAL_CMD["show metaData"]="mse_mmod_showMetaData"
