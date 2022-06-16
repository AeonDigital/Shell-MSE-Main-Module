#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Carrega as legendas do módulo ou submódulo.
# Irá buscar as legendas no arquivo '/asset/locale/[[LOCALE]]/label/general.sh'
# onde o placeholder 'LOCALE' será substituído pelo valor atual da variável
# global 'MSE_GLOBAL_MODULE_LOCALE'.
#
# Se o arquivo procurado não for encontrado e o locale for diferente do valor
# padrão 'en-us', tentará ler o arquivo padrão 'en-us'.
#
# @param string $1
# Diretório raiz do módulo ou submódulo alvo.
mse_mmod_loadLocaleLabels() {
  local mseReturn="1"
  local mseTarget="${1}/asset/locale/${MSE_GLOBAL_MODULE_LOCALE}/label/general.sh"

  if [ -f "${mseTarget}" ]; then
    . ${mseTarget}
    if [ $? == 0 ]; then
      mseReturn="0"
    fi
  else
    if [ "${MSE_GLOBAL_MODULE_LOCALE}" != "en-us" ]; then
      mseTarget="${1}/asset/locale/en-us/label/general.sh"

      if [ -f "${mseTarget}" ]; then
        . ${mseTarget}
        if [ $? == 0 ]; then
          mseReturn="0"
        fi
      fi
    fi
  fi

  return "${mseReturn}"
}
