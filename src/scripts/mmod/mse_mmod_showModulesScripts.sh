#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Escreve na tela todos os módulos carregados e também todas as funções
# e respectivas descrições de cada qual.
#
# @param string $1
# Se definido deve especificar o nome de um módulo a ser alvo desta ação.
# Tal definição será usada como um 'busca', portanto, retornará todos os modulos que
# possuirem o valor indicado como seu nome.
#
# @param string $2
# Se definido deve especificar o nome de um ou mais scripts a serem alvos desta ação.
# Tal definição será usada como um 'busca', portanto, retornará todos os scripts que
# possuirem o valor indicado como seu nome.
mse_mmod_showModulesScripts() {

  local mseModI=0
  local mseModLength=${#MSE_GLOBAL_MODULES_NAMES[@]}
  local mseModName=""

  #
  # Seta o bash para efetuar comparações de string
  # de forma 'case-insensitive'
  shopt -s nocasematch

  for (( mseModI=0; mseModI<${mseModLength}; mseModI++ ));
  do
    mseModName="${MSE_GLOBAL_MODULES_NAMES[$mseModI]}"

    #
    # Identifica se deve ou não mostrar as informações deste módulo
    if [ $# == 0 ] || [ "$1" == "" ] || [[ "${mseModName}" =~ "$1" ]]; then
      printf ": ${mseModName}\n\n"

      local mseScrI=0
      local mseScrLength=${MSE_GLOBAL_MODULE_SCRIPTS[$mseModI]}
      local mseScrName=""

      for (( mseScrI=0; mseScrI<${mseScrLength}; mseScrI++ ));
      do
        mseScrName="${MSE_GLOBAL_MODULE_SCRIPTS[$mseModI,$mseScrI]}"

        #
        # Identifica se deve ou não mostrar as informações deste script
        if [ $# == 0 ] || [ $# == 1 ] || [ "$2" == "" ] || [[ "${mseScrName}" =~ "$2" ]]; then
          printf ":: ${mseScrName}\n"

          #
          # Mostra a descrição do script
          local mseDscI=0
          local mseDscLength=${MSE_GLOBAL_MODULE_SCRIPTS_DESCRIPTION[$mseModI,$mseScrI]}

          for (( mseDscI=0; mseDscI<${mseDscLength}; mseDscI++ ));
          do
            printf "   ${MSE_GLOBAL_MODULE_SCRIPTS_DESCRIPTION[$mseModI,$mseScrI,$mseDscI]}\n"
          done

          printf "\n"
        fi
      done

      printf "\n"
    fi
  done

  #
  # Reseta o bash para efetuar comparações de string
  # de forma 'case-sensitive' que é o padrão!
  shopt -u nocasematch
}
