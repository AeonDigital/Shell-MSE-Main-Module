#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Exibe uma lista contendo as informações de metadados referentes a módulos,
# submódulos e funções dos objetos alvos.
#
# A saída conterá, em cada linha, os dados de um objeto único seguindo os
# seguintes modelos:
#
#   - Linhas de Módulos
#   [M::ModuleName::TotalFunctionCount]
#   - Linhas de SubMódulos
#   [S::ModuleName::SubModuleName::TotalFunctionCount]
#   Valor: Total de funções
#   - Linhas de Funções
#   [F::ModuleName::SubModuleName::FunctionName::PathToFunctionFile]
#
#
# @param bool $1
# Opcional.
# Indica se, na lista retornada deve retornar o nome dos módulos.
#   - Omita ou indique "1" para mostrar.
#   - Indique "0" para ignorar.
#
# @param bool $2
# Indica se, na lista retornada deve retornar o nome dos submódulos.
#   - Omita ou indique "1" para mostrar.
#   - Indique "0" para ignorar.
#
# Se sim, e se for para mostrar o nome das funções, estas serão listadas
# agrupadas abaixo de cada submódulo.
#
# @param bool $3
# Indica se, na lista retornada deve retornar o nome das funções.
#   - Omita ou indique "1" para mostrar.
#   - Indique "0" para ignorar.
#
#
# @param string $4
# Opcional. Filtragem de módulos.
# Especifique parte ou todo o nome de um módulo atualmente carregado para
# apenas as informações referentes ao mesmo.
#
# A pesquisa ocorrerá de forma "case insensitive"
#
#
# @param string $5
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
# @param string $6
# Opcional. Filtragem de funções.
# Especifique parte ou todo o nome de uma função para que ela seja pesquisada
# entre os módulos e submódulos.
#
# A pesquisa ocorrerá de forma "case insensitive"
#
# @return
# Uma lista contendo todas as informações requeridas formatadas conforme
# indicado. A lista será sempre ordenada alfabeticamente.
mse_mmod_showRawMetaData() {
  declare -a mseReturn
  declare -A mseReturnCount
  local mseTmpKey
  local mseTmpTotal


  local mseShowModuleNames=1
  if [ "$1" != "" ] && [ "$1" == "0" ]; then
    mseShowModuleNames=0
  fi

  local mseShowSubModuleNames=1
  if [ "$2" != "" ] && [ "$2" == "0" ]; then
    mseShowSubModuleNames=0
  fi

  local mseShowFunctionNames=1
  if [ "$3" != "" ] && [ "$3" == "0" ]; then
    mseShowFunctionNames=0
  fi


  local mseFilterModules=""
  if [ "$4" != "" ]; then
    mseFilterModules="$4"
  fi

  local mseFilterSubModules=""
  if [ "$5" != "" ]; then
    mseFilterSubModules="$5"
  fi

  local mseFilterFunctions=""
  if [ "$6" != "" ]; then
    mseFilterFunctions="$6"
  fi


  local i
  local mseLength="${#MSE_GLOBAL_MODULES_METADATA_INDEXED[@]}"
  local mseMatch
  local mseValue
  local mseType

  local mseModuleName
  local mseSubModuleName
  declare -a mseSelected

  for ((i=0; i<mseLength; i++)); do
    mseMatch=0
    mseValue="${MSE_GLOBAL_MODULES_METADATA_INDEXED[$i]}"

    mseType="${mseValue:0:1}"


    case "${mseType}" in
      #
      # Se está avaliando uma linha de dados de um módulo...
      M)
        mseModuleName=""
        mseSubModuleName=""

        if [ "${mseFilterModules}" == "" ] || [[ "${mseValue^^}" =~ "${mseFilterModules^^}" ]]; then
          if [ "${mseShowModuleNames}" == "1" ]; then
            mseSelected+=("${mseValue}")
          fi
          mseModuleName="${mseValue#M::}"
          mseSubModuleName="-"

          mseReturnCount[${mseValue}]=0
        fi

      ;;

      #
      # Se está avaliando uma linha de dados de um submódulo...
      S)
        mseSubModuleName=""

        #
        # Apenas se há um módulo selecionado...
        if [ "${mseModuleName}" != "" ]; then
          if [ "${mseFilterSubModules}" == "" ] || [[ "${mseValue^^}" =~ "S::${mseModuleName^^}::${mseFilterSubModules^^}" ]]; then
            if [ "${mseShowSubModuleNames}" == "1" ]; then
              mseSelected+=("${mseValue}")
            fi
            mseSubModuleName="${mseValue##*::}"

            mseReturnCount[${mseValue}]=0
          fi
        fi

      ;;

      #
      # Se está avaliando uma linha de dados de uma função
      F)
        #
        # Apenas se há um módulo e submódulo selecionado...
        # O submódulo "-" caracteriza-se por compreender todas as funções que são filhas
        # diretas de um módulo, não pertencendo assim a um submódulo em especial.
        if [ "${mseModuleName}" != "" ] && [ "${mseSubModuleName}" != "" ] && [[ "${mseValue^^}" =~ "F::${mseModuleName^^}::${mseSubModuleName^^}::" ]]; then
          #
          # Verifica o filtro de submódulo
          if [ "${mseFilterSubModules}" == "" ] || [[ "${mseValue^^}" =~ "F::${mseModuleName^^}::${mseFilterSubModules^^}" ]]; then
            #
            # Verifica o filtro de função
            if [ "${mseFilterFunctions}" == "" ] || [[ "${mseValue^^}" =~ "${mseFilterFunctions^^}" ]]; then
              if [ "${mseShowFunctionNames}" == "1" ]; then
                mseSelected+=("${mseValue}")
              fi

              #
              # Atualiza a contagem de funções retornadas para o módulo atual
              mseTmpKey="M::${mseModuleName}"
              mseTmpTotal="${mseReturnCount[${mseTmpKey}]}"
              ((mseTmpTotal=mseTmpTotal+1))
              mseReturnCount[${mseTmpKey}]="${mseTmpTotal}"

              #
              # Atualiza a contagem de funções retornadas para o submódulo atual
              mseTmpKey="S::${mseModuleName}::${mseSubModuleName}"
              mseTmpTotal="${mseReturnCount[${mseTmpKey}]}"
              ((mseTmpTotal=mseTmpTotal+1))
              mseReturnCount[${mseTmpKey}]="${mseTmpTotal}"
            fi
          fi
        fi

      ;;
    esac
  done



  #
  # Adiciona os dados extra para cada linha informativa
  local mseKey
  local mseTmpData
  local mseTmpShow
  for mseKey in "${mseSelected[@]}"; do
    mseType="${mseKey:0:1}"
    mseTmpShow=1

    mseTmpData="${MSE_GLOBAL_MODULES_METADATA[${mseKey}]}"
    if [ "${mseType}" == "M" ] || [ "${mseType}" == "S" ]; then
      mseTmpData="${MSE_GLOBAL_MODULES_METADATA[$mseKey]}::${mseReturnCount[${mseKey}]}"

      if [ "${mseReturnCount[${mseKey}]}" == "0" ]; then
        mseTmpShow=0
      fi
    fi

    if [ "${mseTmpShow}" == 1 ]; then
      mseReturn+=("${mseKey}::${mseTmpData}")
    fi
  done

  printf "%s\n" "${mseReturn[@]}"
}
