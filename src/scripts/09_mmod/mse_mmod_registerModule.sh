#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Registra o módulo alvo.
# Todas suas variáveis, aliases e scripts serão carregadas.
#
# @param string $1
# Nome do módulo que está sendo registrado.
#
# @param string $2
# Caminho completo até o diretório 'src' do módulo que está
# sendo registrado.
mse_mmod_registerModule() {
  local mseModFiles

  local mseModuleName
  local mseModuleMetaDataKey
  local mseModuleTotalFunctionCount

  local mseSubModuleName
  local mseSubModuleMetaDataKey
  local mseSubModuleTotalFunctionCount




  #
  # Havendo funções especiais para o registro, efetua
  # o load delas.
  mse_mmod_loadRegisterFunctions "$2"
  if [ "$(type -t "mse_registerModule_execOnStart")" == "function" ]; then
    mse_registerModule_execOnStart "$2"
  fi





  #
  # Carrega as legendas referentes ao locale configurado
  if [ "$(type -t "mse_registerModule_execBeforeLoadLocale")" == "function" ]; then
    mse_registerModule_execBeforeLoadLocale "$2"
  fi

  mse_mmod_loadLocaleLabels "$2" "${MSE_GLOBAL_MODULE_LOCALE}"

  if [ "$(type -t "mse_registerModule_execAfterLoadLocale")" == "function" ]; then
    mse_registerModule_execAfterLoadLocale "$2"
  fi





  #
  # Carrega as variáveis de ambiente do módulo caso um arquivo 'env.sh' esteja definido
  if [ "$(type -t "mse_registerModule_execBeforeLoadEnv")" == "function" ]; then
    mse_registerModule_execBeforeLoadEnv "$2"
  fi

  if [ -f "${2}/config/env.sh" ]; then
    . "${2}/config/env.sh"
  fi

  if [ "$(type -t "mse_registerModule_execAfterLoadEnv")" == "function" ]; then
    mse_registerModule_execAfterLoadEnv "$2"
  fi





  #
  # Carrega as variáveis locais do módulo caso um arquivo 'variables.sh' esteja definido
  if [ "$(type -t "mse_registerModule_execBeforeLoadVariables")" == "function" ]; then
    mse_registerModule_execBeforeLoadVariables "$2"
  fi

  if [ -f "${2}/config/variables.sh" ]; then
    . "${2}/config/variables.sh"
  fi

  if [ "$(type -t "mse_registerModule_execAfterLoadVariables")" == "function" ]; then
    mse_registerModule_execAfterLoadVariables "$2"
  fi





  #
  # Carrega os 'aliases' do módulo caso um arquivo 'aliases.sh' esteja definido
  if [ "$(type -t "mse_registerModule_execBeforeLoadAliases")" == "function" ]; then
    mse_registerModule_execBeforeLoadAliases "$2"
  fi

  if [ -f "${2}/config/aliases.sh" ]; then
    . "${2}/config/aliases.sh"
  fi

  if [ "$(type -t "mse_registerModule_execAfterLoadAliases")" == "function" ]; then
    mse_registerModule_execAfterLoadAliases "$2"
  fi





  #
  # Identifica os scripts do módulo
  if [ "$(type -t "mse_registerModule_execBeforeLoadScripts")" == "function" ]; then
    mse_registerModule_execBeforeLoadScripts "$2"
  fi

  mseModFiles=$(find "$2/scripts" -name "*.sh" | sort -n)
  if [ "$mseModFiles" != "" ]; then
    local i
    local c
    local mseTmpTotalSubModules

    local rawLine
    local mseFullFileName
    local mseFunctionName


    #
    # Inicia o registro das meta informações deste módulo
    mseModuleName="$1"
    mseModuleMetaDataKey="M::${mseModuleName}"
    mseModuleTotalFunctionCount=0

    MSE_GLOBAL_MODULES_PATH[${mseModuleName}]="$2"
    MSE_GLOBAL_MODULES_METADATA["${mseModuleMetaDataKey}"]=0
    MSE_GLOBAL_MODULES_METADATA_INDEXED+=("${mseModuleMetaDataKey}")



    #
    # Identifica os submódulos do módulo atual
    mse_mmod_splitAndOrderSubModules
    mseTmpTotalSubModules="${#MSE_TMP_LIST_SUBMODULES[@]}"

    #
    # Existindo submódulos, registra-os...
    for  ((i=0; i<mseTmpTotalSubModules; i++)); do
      mseSubModuleName="${MSE_TMP_LIST_SUBMODULES[$i]}"
      mseSubModuleMetaDataKey="S::${mseModuleName}::${mseSubModuleName}"

      MSE_GLOBAL_MODULES_METADATA["${mseSubModuleMetaDataKey}"]=0
    done



    #
    # Carrega as funções referentes a cada arquivo carregado neste módulo
    while read rawLine; do
      mseFullFileName=$(basename -- "$rawLine")
      mseFunctionName="${mseFullFileName%.*}"

      unset "${mseFunctionName}"
      . "$rawLine" || true

      #
      # Registra a função
      # apenas se a mesma não está em uma pasta "assets"
      if [[ ! ${rawLine} =~ "/assets/" ]]; then
        mseSubModuleName="-"
        ((mseModuleTotalFunctionCount=mseModuleTotalFunctionCount+1))

        #
        # Verifica se a função carregada pertence a um submódulo, e qual
        for  ((i=0; i<mseTmpTotalSubModules; i++)); do
          if [[ "${mseFunctionName}" =~ "${MSE_TMP_LIST_SUBMODULES[$i]}_" ]]; then
            mseSubModuleName="${MSE_TMP_LIST_SUBMODULES[$i]}"
            mseSubModuleMetaDataKey="S::${mseModuleName}::${mseSubModuleName}"

            #
            # Atualiza o contador de funções do submodulo
            c="${MSE_GLOBAL_MODULES_METADATA[${mseSubModuleMetaDataKey}]}"
            ((c=c+1))
            MSE_GLOBAL_MODULES_METADATA["${mseSubModuleMetaDataKey}"]="${c}"

            break
          fi
        done

        MSE_GLOBAL_MODULES_METADATA["F::${mseModuleName}::${mseSubModuleName}::${mseFunctionName}"]="${rawLine}"
      fi
    done <<< ${mseModFiles}



    #
    # Atualiza a contagem total de funções do módulo como um todo
    MSE_GLOBAL_MODULES_METADATA["${mseModuleMetaDataKey}"]="${mseModuleTotalFunctionCount}"
  fi

  if [ "$(type -t "mse_registerModule_execAfterLoadScripts")" == "function" ]; then
    mse_registerModule_execAfterLoadScripts "$2"
  fi





  #
  # Registra uma versão "comparável" de cada um dos comandos
  # carregados até o momento.
  # Este processamento auxiliará o autocomplete e a própria
  # invocação dos comandos disponibilizados.
  local mseKey
  local mseKeyCompare
  for mseKey in "${!MSE_GLOBAL_CMD[@]}"; do
    mseKeyCompare="${mseKey^^}"
    mseKeyCompare="${mseKeyCompare// /_}"

    #
    # Se a chave ainda não foi registrada no array comparável
    if [ -z "${MSE_GLOBAL_CMD_COMPARE[$mseKeyCompare]+x}" ]; then
      MSE_GLOBAL_CMD_COMPARE["${mseKeyCompare}"]="${mseKey}"
    fi
  done





  if [ "$(type -t "mse_registerModule_execOnEnd")" == "function" ]; then
    mse_registerModule_execOnEnd "$2"
  fi
  mse_mmod_unloadRegisterFunctions
}





#
# @desc
# Verifica se, para o módulo que está sendo registrado, existe um arquivo
# contendo as funções de configurações especiais para o adequado carregamento.
#
# @param string $1
# Caminho completo até o diretório 'src' do módulo que está
# sendo registrado.
mse_mmod_loadRegisterFunctions() {
  if [ -f "${1}/config/module/register.sh" ]; then
    . "${1}/config/module/register.sh"
  fi
}
#
# @desc
# Executa o "unset" de todas funções de registro que estão atualmente
# carregados.
mse_mmod_unloadRegisterFunctions() {
  local mseFunctionName
  for mseFunctionName in "${MSE_GLOBAL_REGISTERMODULE_META_FUNCTIONS[@]}"; do
    unset "${mseFunctionName}"
  done
}
#
# @desc
# A partir de uma string que lista os submódulos que estão no módulo que está
# sendo carregado, efetua o "split" de seus membros e ordena eles em ordem de
# nome usando o critério do tamanho do nome (quanto menos caracteres mais para
# o fim da fila).
#
# @return
# Preenche o array global 'MSE_TMP_LIST_SUBMODULES' com o resultado
# do 'split' feito.
mse_mmod_splitAndOrderSubModules() {
  unset MSE_TMP_LIST_SUBMODULES
  declare -ga MSE_TMP_LIST_SUBMODULES

  if [ "${MSE_TMP_SUBMODULES}" != "" ]; then
    local mseDelimiter
    local mseString
    local mseSubStr
    declare -a mseTmpSubModules=()


    mseDelimiter="::"
    mseString="${MSE_TMP_SUBMODULES}"
    mseSubStr=""

    while [ "${mseString}" != "" ]; do
      #
      # Não existindo nenhum delimitador...
      if [[ "$mseString" != *"$mseDelimiter"* ]]; then
        mseTmpSubModules+=("$mseString")
        break
      else
        mseSubStr="${mseString%%${mseDelimiter}*}"
        mseTmpSubModules+=("$mseSubStr")

        mseString="${mseString#*${mseDelimiter}}"
      fi
    done


    #
    # Ordena o índice dos elementos pelo tamanho em caracteres
    # do nome de cada elemento
    local mseIndexes
    mseIndexes=( $(
      for i in "${!mseTmpSubModules[@]}" ; do
        printf '%s %s %s\n' $i "${#mseTmpSubModules[i]}" "${mseTmpSubModules[i]}"
      done | sort -nrk2,2 -rk3 | cut -f1 -d' '
    ))


    #
    # Remonta o array na ordem de tamanho do nome (maiores primeiro)
    for i in "${mseIndexes[@]}" ; do
      MSE_TMP_LIST_SUBMODULES+=("${mseTmpSubModules[i]}")
    done

    MSE_TMP_SUBMODULES=""
  fi
}
#
# @desc
# Reorganiza o array "MSE_GLOBAL_MODULES_METADATA_INDEXED" para que ele
# mantenha as informações dos módulos, submódulos e funções ordenados de forma
# alfabética de amostragem, ou seja, aninhando cada lista e sublista uma abaixo
# da outra
mse_mmod_reorderMetadataIndexes() {
  unset MSE_GLOBAL_MODULES_METADATA_INDEXED
  declare -ga MSE_GLOBAL_MODULES_METADATA_INDEXED

  #
  # Ordena todos os metadados de forma simplista
  IFS=$'\n'
  declare -a mseSortedMetaData=($(sort <<< "${!MSE_GLOBAL_MODULES_METADATA[*]}"))
  IFS=$' \t\n'

  mse_mmod_processTargetObjectIndex "M" "M::"
}
#
# @desc
# Faz uma varredura recursiva no array "mseSortedMetaData" iniciado pela função
# "mse_mmod_reorderMetadataIndexes" de forma a reorganizar o array de controle
# "MSE_GLOBAL_MODULES_METADATA_INDEXED" fazendo com que este tenha registrado
# o nome de todos os módulos, submódulos e funções carregados em ordem
# alfabética de apresentação (aninhando funções de módulos e submódulos em
# grupos coêsos).
#
# @param char $1
# Tipo objeto alvo da varredura.
#
# @param string $2
# String chave que permite identificar objetos de uma mesma natureza.
mse_mmod_processTargetObjectIndex() {
  local mseKey

  local mseOType="$1"
  local mseSearchKey="$2"

  local mseModuleName
  local mseSubModuleName

  for mseKey in "${mseSortedMetaData[@]}"; do
    if [[ "${mseKey}" =~ "${mseSearchKey}" ]]; then
      #
      # Encontrando um módulo
      case "${mseOType}" in
        M)
          MSE_GLOBAL_MODULES_METADATA_INDEXED+=("${mseKey}")

          mseModuleName="${mseKey#M::}"

          #
          # Pesquisa por todas as funções que pertencem ao módulo exclusivamente
          # sem associação alguma com submódulos
          mse_mmod_processTargetObjectIndex "F" "F::${mseModuleName}::-::"

          #
          # Pesquisa por todos os submódulos deste módulo
          mse_mmod_processTargetObjectIndex "S" "S::${mseModuleName}"
        ;;

        S)
          MSE_GLOBAL_MODULES_METADATA_INDEXED+=("${mseKey}")

          mseSubModuleName="${mseKey#S::}"

          #
          # Pesquisa por todas as funções que pertencem ao submódulo
          mse_mmod_processTargetObjectIndex "F" "F::${mseSubModuleName}::"
        ;;

        F)
          MSE_GLOBAL_MODULES_METADATA_INDEXED+=("${mseKey}")
        ;;
      esac

    fi
  done
}
