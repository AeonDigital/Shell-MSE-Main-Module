#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Exibe uma lista contendo as informações referentes a módulos, submódulos e
# funções dos objetos alvos.
#
# @param bool $1
# Indica se, na lista retornada deve retornar o nome dos módulos.
#   - Omita ou indique "0" para ignorar.
#   - Indique "1" para mostrar.
#
# @param bool $2
# Indica se, na lista retornada deve retornar o nome dos submódulos.
#   - Omita ou indique "0" para ignorar.
#   - Indique "1" para mostrar.
#
# Se sim, e se for para mostrar o nome das funções, estas serão listadas
# agrupadas abaixo de cada submódulo.
#
# @param bool $3
# Indica se, na lista retornada deve retornar o nome das funções.
#   - Omita ou indique "0" para ignorar.
#   - Indique "1" para mostrar.
#
# @param bool $4
# Indica se deve retornar a contagem de funções pertencentes a cada
# módulo e submódulo.
#   - Omita ou indique "0" para ignorar.
#   - Indique "1" para mostrar.
#
# @param bool $5
# Indica se deve retornar o caminho para o arquivo em que a função está
# definida.
#   - Omita ou indique "0" para ignorar.
#   - Indique "1" para mostrar.
#
#
# @param bool $6
# Indica se deve formatar as linhas para facilitar o processamento das
# informações por outro recurso. Se sim, cada item será separado do outro
# pelo separador "::".
#   - Omita ou indique "0" para ignorar.
#   - Indique "1" para usar a formatação especial.
#
# Se usado, todos os recursos indicados para a saída dos dados serão usados
# e uma lista análoga ao modelo abaixo será printada:
#
# M::ModuleName::TotalFunctionCount
# S::ModuleName::SubModuleName::TotalFunctionCount
# F::ModuleName::SubModuleName::Function_A::PathToFunctionFile
# F::ModuleName::SubModuleName::Function_B::PathToFunctionFile
#
# O primeiro ítem de cada linha é sempre um caracter que indica se trata-se
# de um módulo (M), um submódulo (S) ou uma função (F).
# As linhas referentes aos módulos e submódulos trazem o total de funções
# que aquele objeto possui.
# As linhas contendo informações das funções traz, redundantemente, o nome
# do módulo e submódulo ao qual aquela função pertence além do caminho
# completo até o seu arquivo de definição.
#
#
# @param string $7
# Opcional. Filtragem de módulos.
# Especifique parte ou todo o nome de um módulo atualmente carregado para
# apenas as informações referentes ao mesmo.
#
# A pesquisa ocorrerá de forma "case insensitive"
#
#
# @param string $8
# Opcional. Filtragem de submódulos.
# Especifique o prefixo identificador de um submódulo para que seja retornado
# apenas as informações referentes ao mesmo.
#
# Use o valor "-" para indicar que deseja retornar todas as funções que NÃO
# pertencem a modulo algum e sim, exclusivamente ao módulo principal.
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
# @param string $9
# Opcional. Filtragem de funções.
# Especifique parte ou todo o nome de uma função para que ela seja pesquisada
# entre os módulos e submódulos.
#
# A pesquisa ocorrerá de forma "case insensitive"
#
# @return
# Uma lista contendo todas as informações requeridas formatadas conforme
# indicado. A lista será sempre ordenada alfabéticamente.
mse_mmod_metaData() {
  if [ $# -ge 6 ]; then
    declare -a mseReturn

    local mseShowModuleNames=0
    local mseShowSubModuleNames=0
    local mseShowFunctionNames=0
    local mseShowCounterFunctions=0
    local mseShowFunctionFilePath=0

    local mseReturnFormated=0

    local mseFilterModules=""
    local mseFilterSubModules=""
    local mseFilterFunctions=""

    if [ "$1" != "" ] && [ "$1" == "1" ]; then
      mseShowModuleNames=1
    fi

    if [ "$2" != "" ] && [ "$2" == "1" ]; then
      mseShowSubModuleNames=1
    fi

    if [ "$3" != "" ] && [ "$3" == "1" ]; then
      mseShowFunctionNames=1
    fi

    if [ "$4" != "" ] && [ "$4" == "1" ]; then
      mseShowCounterFunctions=1
    fi

    if [ "$5" != "" ] && [ "$5" == "1" ]; then
      mseShowFunctionFilePath=1
    fi

    if [ "$6" != "" ] && [ "$6" == "1" ]; then
      mseReturnFormated=1
    fi



    if [ $# -ge 7 ] && [ "$7" != "" ]; then
      mseFilterModules="$7"
    fi

    if [ $# -ge 8 ] && [ "$8" != "" ]; then
      mseFilterSubModules="$8"
    fi

    if [ $# -ge 9 ] && [ "$9" != "" ]; then
      mseFilterFunctions="$9"
    fi


    local i
    local mseLength="${#MSE_GLOBAL_MODULES_METADATA_INDEXED[@]}"
    local mseMatch
    local mseValue
    local mseType

    local mseModuleName
    local mseSubModuleName
    declare -a mseSelected
c=0
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
            mseSelected+=("${mseValue}")
            mseModuleName="${mseValue#M::}"
            mseSubModuleName="-"
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
              mseSelected+=("${mseValue}")
              mseSubModuleName="${mseValue##*::}"
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
            if [ "${mseFilterFunctions}" == "" ] || [[ "${mseValue^^}" =~ "${mseFilterFunctions^^}" ]]; then
              mseSelected+=("${mseValue}")
            fi
          fi

        ;;
      esac
    done



    #
    # Se o retorno dos dados deve ser formatado...
    if [ "${mseReturnFormated}" == "1" ]; then
      local mseKey

      for mseKey in "${mseSelected[@]}"; do
        mseReturn+=("${mseKey}::${MSE_GLOBAL_MODULES_METADATA[${mseKey}]}")
      done
    fi


    printf "%s\n" "${mseReturn[@]}"
  fi
}













  # local mseReturn
  # local mseModuleIndex=""
  # local mseShowHelp=0

  # if [ $# == 0 ] || [ "$1" == "" ]; then
  #   mseShowHelp=1
  # else
  #   mseModuleIndex=$(mse_check_hasValueInArray "$1" "MSE_GLOBAL_MODULES" "1" "1")
  #   if [ "${mseModuleIndex}" == "" ]; then
  #     mseShowHelp=1
  #   fi
  # fi


  # #
  # # Se o módulo indicado não existe...
  # if [ "${mseShowHelp}" == 1 ]; then
  #   mseReturn=$(mse_str_replacePlaceHolder "${lbl_mmod_invalidModuleName}" "MODULE" "$1")
  # else
  #   local mseKey
  #   local msePath
  #   local mseFunction
  #   local mseModuleName="${MSE_GLOBAL_MODULES[$mseModuleIndex]}"
  #   local mseArrReturn=()
  #   local mseFilter=""

  #   if [ $# -ge 2 ] && [ "$2" != "" ]; then
  #     mseFilter="$2"
  #   fi

  #   #
  #   # Seta o bash para efetuar comparações de string
  #   # de forma 'case-insensitive'
  #   shopt -s nocasematch

  #   #
  #   # Percorre a lista de funções
  #   for mseKey in "${!MSE_GLOBAL_MODULES_FUNCTIONS[@]}"; do
  #     msePath="${MSE_GLOBAL_MODULES_FUNCTIONS[$mseKey]}"

  #     #
  #     # Apenas se a função pertence ao módulo indicado...
  #     if [ "${mseKey%::*}" == "${mseModuleName}" ]; then
  #       mseFunction="${mseKey#*::}"

  #       if [ "${mseFilter}" == "" ] || [[ "${mseFunction}" =~ "${mseFilter}" ]]; then
  #         mseArrReturn+=("${mseFunction}")
  #       fi
  #     fi
  #   done

  #   #
  #   # Reseta o bash para efetuar comparações de string
  #   # de forma 'case-sensitive' que é o padrão!
  #   shopt -u nocasematch


  #   if [ "${#mseArrReturn[@]}" -ge 1 ]; then
  #     IFS=$'\n'
  #     mseArrReturn=($(sort <<< "${mseArrReturn[*]}"))
  #     unset IFS

  #     mseReturn=$(printf "%s\n" "${mseArrReturn[@]}")
  #   fi
  # fi


  # printf "${mseReturn}\n"
