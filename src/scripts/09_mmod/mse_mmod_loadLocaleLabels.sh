#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Carrega os arquivos de legendas relacionados ao modulo e locale indicado.
#
# Os arquivos de legenda serão buscados nos diretórios "src/locale" de cada
# módulo assim como nos diretórios "scripts/*?/assets/locale" do diretório
# "scripts".
#
# @param string $1
# Caminho completo até o diretório 'src' do módulo alvo.
#
# @param string $2
# Locale que deve ser carregado.
mse_mmod_loadLocaleLabels() {
  declare -a mseLocaleDirectories=("${1}/locale")

  local mseRootModuleAssetsDir
  local mseRootModuleLocaleDir

  if [ -d "${1}/locale" ]; then
    mseLocaleDirectories+=("${1}/locale")
  fi

  for mseRootModuleAssetsDir in $(find "${1}/scripts" -type d -name "assets" | sort -n); do
    for mseRootModuleLocaleDir in $(find "${mseRootModuleAssetsDir}" -type d -name "locale" | sort -n); do
      mseLocaleDirectories+=("${mseRootModuleLocaleDir}")
    done
  done


  local mseLocaleDir
  for mseLocaleDir in "${mseLocaleDirectories[@]}"; do
    if [ -f "${mseLocaleDir}/${2}.sh" ]; then
      . "${mseLocaleDir}/${2}.sh"
    elif [ -f "${mseLocaleDir}/${2}/label/general.sh" ]; then
      . "${mseLocaleDir}/${2}/label/general.sh"
    fi
  done
}





#
# @desc
# Carrega todas as legendas de todos os módulos atualmente instalados e
# disponíveis.
#
# @param string $1
# Locale a ser carregado.
# Se nenhum for indicado, usará o padrão encontrado na variável
# global "MSE_GLOBAL_MODULE_LOCALE"
mse_mmod_reloadAllLocaleLabels() {
  local mseInstallationPath="${HOME}/.config/myShellEnv"
  local mseUseLocale="${MSE_GLOBAL_MODULE_LOCALE}"


  if [ "${1}" != "" ]; then
    mseUseLocale="${1}"
  fi


  #
  # Carrega as legendas do módulo principal
  mse_mmod_loadLocaleLabels "${HOME}/.config" "${mseUseLocale}"


  #
  # Resgata os diretórios de "locale" de cada módulo
  local mseModuleName
  for mseModuleName in "${!MSE_AVAILABLE_MODULES[@]}"; do
    if [ "${MSE_AVAILABLE_MODULES[${mseModuleName}]}" == "1" ]; then
      mse_mmod_loadLocaleLabels "${mseInstallationPath}/${mseModuleName}/src" "${mseUseLocale}"
    fi
  done
}
