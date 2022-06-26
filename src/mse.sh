#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]
#
# 1. Para executar normalmente use:
# . src/mse.sh
#
#
# 2. Para executar localmente apenas para a sessão do shel atualmente aberta,
# sem necessariamente estar instalado no seu usuário, use:
#
# . src/mse.sh local
#
#
# 3. Para executar a bateria de testes unitários use:
#
# ./src/mse.sh tests
#






#
# Se a variável global de ativação não existe, define-a
if [ -z ${MSE_GLOBAL_ACTIVE+x} ]; then
  MSE_GLOBAL_ACTIVE="1"
fi



#
# Define o locale padrão inicial caso nenhum outro esteja definido
if [ -z ${MSE_GLOBAL_MODULE_LOCALE+x} ]; then
  MSE_GLOBAL_MODULE_LOCALE="en-us"
fi



#
# Inicia o myShellEnv
#
# @param string $1
# Opcional.
# Indique o caminho completo do diretório que contém uma instalação do
# "myShellEnv" para que ela seja iniciada.
# Se omitido usará o padrão "${HOME}/.config/myShellEnv"
#
# @param bool $2
# Opcional.
# Se definida, sobrepõe-se à definição expressa na variável global
# "MSE_GLOBAL_ACTIVE"
myShellEnvStart() {
  local mseReturn=1

  #
  # Se o módulo principal já foi carregado
  if [ "$(type -t "mse_mmod_registerModule")" == "function" ]; then
    mseReturn=0
  else

    #
    # Definições básicas para iniciar
    local mseInstallationPath="${HOME}/.config/myShellEnv"
    if [ $# -ge 1 ] && [ "$1" != "" ]; then
      mseInstallationPath="${1}"
    fi

    local msePathToConfigFile="${mseInstallationPath}/config.sh"
    local msePathToConfigColorFile="${mseInstallationPath}/config-color.sh"
    local msePathToRegisterModuleFunction="${mseInstallationPath}/src/scripts/09_mmod/mse_mmod_registerModule.sh"
    local msePathToLoadLocaleLabelsFunction="${mseInstallationPath}/src/scripts/09_mmod/mse_mmod_loadLocaleLabels.sh"

    if [ ! -f "${msePathToRegisterModuleFunction}" ] || [ ! -f "${msePathToLoadLocaleLabelsFunction}" ]; then
      local mseAlertMsg=""
      mseAlertMsg+="\n"
      mseAlertMsg+="    Attention\n"
      mseAlertMsg+="    Could not find module register in :\n"
      mseAlertMsg+="    ${msePathToRegisterModuleFunction} :\n"
      mseAlertMsg+="\n"
      printf "${mseAlertMsg}"
    else

      #
      # Carrega as configurações personalizadas dos módulos
      if [ -f "${msePathToConfigFile}" ]; then
        . "${msePathToConfigFile}"
      fi


      if [ "${MSE_GLOBAL_ACTIVE}" == "1" ] || [ "$2" == "1" ]; then

        #
        # Efetua o load do módulo principal usando o registrador
        . "${msePathToRegisterModuleFunction}"
        . "${msePathToLoadLocaleLabelsFunction}"
        mse_mmod_registerModule "Shell-MSE-Main-Module" "${mseInstallationPath}/src"

        #
        # Carrega cada um dos módulos atualmente disponíveis e ativados.
        local mseModuleName
        for mseModuleName in "${!MSE_AVAILABLE_MODULES[@]}"; do
          if [ "${MSE_AVAILABLE_MODULES[${mseModuleName}]}" == "1" ]; then
            mse_mmod_registerModule "${mseModuleName}" "${mseInstallationPath}/${mseModuleName}/src"
          fi
        done

        mse_mmod_reorderMetadataIndexes


        #
        # Carrega as configurações de cores do ambiente atual
        if [ -f "${msePathToConfigColorFile}" ]; then
          . "${msePathToConfigColorFile}"
        fi
      fi

      mseReturn=0
    fi
  fi

  return $mseReturn
}




#
# Roda os testes
#
# @param string $1
# Indique o caminho completo do diretório que contém uma instalação do
# "myShellEnv" para que ela seja iniciada.
myShellEnvRunTests() {
  local mseReturn=1
  local mseAlertMsg=""
  local mseInstallationPath="${1}"


  #
  # Inicia o módulo principal
  myShellEnvStart "${mseInstallationPath}" "1"
  if [ $? == 0 ] && [ "$(type -t "mse_mmod_registerModule")" == "function" ]; then
    #
    # Verifica se o módulo de testes está presente.
    local mseTestModulePath="${mseInstallationPath}/Shell-MSE-UnitTest/src"
    if [ ! -d "${mseTestModulePath}" ]; then
      mseAlertMsg+="\n"
      mseAlertMsg+="    Attention\n"
      mseAlertMsg+="    Could not run tests because module \"Shell-MSE-UnitTest\" was not found.\n"
      mseAlertMsg+="    Use the following commands to add and configure it:\n"
      mseAlertMsg+="    - git submodule add https://github.com/AeonDigital/Shell-MSE-UnitTest.git \n"
      mseAlertMsg+="    - git submodule set-branch --branch main -- ./Shell-MSE-UnitTest \n"
      mseAlertMsg+="    - git submodule update --remote \n"
      mseAlertMsg+="\n"
      mseAlertMsg+="    If the module \"Shell-MSE-UnitTest\" is already part of the current repository you can\n"
      mseAlertMsg+="    start it using the following commands:\n"
      mseAlertMsg+="    - git submodule init \n"
      mseAlertMsg+="    - git submodule update --remote \n"
      mseAlertMsg+="\n"

      printf "${mseAlertMsg}"
    else
      #
      # Registra/inicia o módulo de testes
      mse_mmod_registerModule "Shell-MSE-UnitTest" "${mseInstallationPath}/Shell-MSE-UnitTest/src"

      #
      # Configura o diretório de testes como sendo o "/src" do módulo atual
      mse_utest_setTargetDir "$mseInstallationPath/src"
      # Executa os testes
      mse_utest_execute

      mseReturn=0
    fi
  fi


  return ${mseReturn}
}





#
# Executa conforme configuração passada
MSE_TMP_THIS_DIRECTORY=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
MSE_TMP_THIS_DIRECTORY=$(dirname "${MSE_TMP_THIS_DIRECTORY}")

case "${1,,}" in
  #
  # Se é uma instalação local, geralmente usada para uma ativação do
  # tipo 'standalone' ou para casos de testes.
  local)
    myShellEnvStart "${MSE_TMP_THIS_DIRECTORY}" "1"
  ;;
  #
  # Sendo para executar os testes unitários.
  tests)
    myShellEnvRunTests "${MSE_TMP_THIS_DIRECTORY}"
  ;;
  #
  # Execução normal
  *)
    myShellEnvStart
  ;;
esac


unset myShellEnvStart
unset myShellEnvRunTests

unset MSE_TMP_THIS_DIRECTORY
