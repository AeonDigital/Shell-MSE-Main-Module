#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]
# https://opensource.com/article/18/3/creating-bash-completion-script
# https://www.gnu.org/software/bash/manual/html_node/Programmable-Completion-Builtins.html#Programmable-Completion-Builtins
# https://iridakos.com/programming/2018/03/01/bash-programmable-completion-tutorial




#
# @desc
# Permite uma análise recursiva do prompt atualmente digitado pelo usuário.
# em relação a todas as opções disponíveis no "myShellEnv".
#
# @param string $1
# Partícula/s de comandos que devem ser pesquisadas.
mse_mmod_ini_completion_bash() {
  local mseCompletionMode="${MSE_GLOBAL_COMPLETION_MODE}"

  COMPREPLY=()
  declare -a mseArrTerminalParticles=()
  local mseTotalTerminalParticles="0"



  #
  # A partir do conteúdo total da linha atual do prompt
  # separa cada elemento em um item de um array para
  # que seja mais fácil manipular cada qual.
  if [ "${mseCompletionMode}" == "F" ]; then
    local mseTmpWord
    for mseTmpWord in "${COMP_WORDS[@]}"; do
      if [ "${mseTmpWord}" != "" ]; then
        mseArrTerminalParticles+=("${mseTmpWord}")
      fi
    done
  elif [ "${mseCompletionMode}" == "C" ]; then
    mseArrTerminalParticles=(${COMP_LINE})
  fi
  mseTotalTerminalParticles="${#mseArrTerminalParticles[@]}"



  #
  # Apenas se a linha não está vazia...
  if [ "${mseTotalTerminalParticles}" -ge 1 ]; then

    #
    # Ajusta o comando da linha para que ele fique em um formato
    # 'comparável' com as chaves registradas no array associativo
    # 'MSE_GLOBAL_CMD_COMPARE'.
    # Para tal:
    # - Ignora o primeiro item da cadeia de parametros pois ele é quem
    #   evoca este próprio comando (mse)
    # - Converte todo o conteúdo da linha para maiúsculas.
    # - Substitui todo espaço por underline.
    local mseCmdSearchBy=""
    if [ "${mseTotalTerminalParticles}" -ge 2 ]; then
      mseCmdSearchBy="${mseArrTerminalParticles[@]:1}"
      mseCmdSearchBy="${mseCmdSearchBy^^}"
      mseCmdSearchBy="${mseCmdSearchBy// /_}"
      mseCmdSearchBy=$(mse_str_trim "${mseCmdSearchBy}")
    fi



    #
    # No array associativo 'MSE_GLOBAL_CMD_COMPARE', cada chave representa
    # o seu 'alias' em maiúsculas e com espaços convertidos em underlines.
    # a variável 'mseCmdCompareVersion' será usada para armazenar este valor.
    # E, em 'mseCmdOriginalVersion' ficará o valor original tal qual foi
    # definido pelo desenvolvedor.
    local mseCmdCompareVersion=""
    local mseCmdOriginalVersion=""



    #
    # Sempre que encontrar um comando compatível com o que está sendo digitado
    # irá usar esta variável para armazenar temporariamente a próxima
    # partícula que pode ser usada para completar o comando.
    local mseCmdNextParticle=""

    #
    # Cada partícula que pode ser usada para o autocomplete será armazenada
    # neste array para, ao final, ser disponibilizada como opção ao usuário.
    unset mseArrCmdCompletionParticles
    declare -A mseArrCmdCompletionParticles


    #
    # Identifica se o autocomplete está servindo para propor complementos
    # ao 'alias' que o usuário está digitando ou se deve mostrar informações
    # que auxiliem a composição dos parametros daquele comando.
    #
    # Por padrão começa como 'cmd', se identificado um comando e a terminação
    # --, efetuará a troca para o modo 'param'
    local mseCompletionType="cmd"

    #
    # Quando estiver no modo 'param', esta variável deverá armazenar o total de
    # particulas digitadas no prompt que devem ser ignoradas pois servem apenas
    # para designar o comando acionado e, a partir deste ponto, os dados
    # encontrados referem-se aos parametros.
    local mseOffSetParticles=""
    #
    # Armazena o índice do parametro sendo lido no momento.
    local mseCurrentParameterIndex="0"


    #
    # Guardar a versão atual daquilo que está no prompt sem qualquer parametro
    # e compatível com partículas incompletas.
    local mseAtualPromptCmd=""

    local mseIndex=""
    declare -a mseCmdAtualParticles=()
    declare -a mseCmdOriginalParticles=()



    #
    # Para cada comando que está registrado no array de comparação de comandos
    for mseCmdCompareVersion in "${!MSE_GLOBAL_CMD_COMPARE[@]}"; do
      mseCmdOriginalVersion="${MSE_GLOBAL_CMD_COMPARE[${mseCmdCompareVersion}]}"
      mseCmdNextParticle=""

      #
      # Não havendo partícula para efetuar uma comparação por um comando
      # resgata a primeira partícula de cada comando para oferecer ao usuário.
      if [ "${mseCmdSearchBy}" == "" ]; then
        mseCmdNextParticle=${mseCmdOriginalVersion%% *}

      #
      # Senão, havendo partículas digitadas para serem comparadas...
      else

        #
        # Encontrando um valor de comparação que seja idêntico ao que está no
        # prompt do terminal, oferecerá a opção '--' para que seja iniciado o
        # modo de auxílio com parametros.
        if [ "${mseCmdSearchBy}" == "${mseCmdCompareVersion}" ]; then
          mseArrCmdCompletionParticles["--"]=""
          break

        #
        # Se o comando digitado no prompt já contém a terminação de comandos
        # '--' ... efetua o switch para o modo 'param' e encerra este laço
        elif [[ "${mseCmdSearchBy}" =~ ^${mseCmdCompareVersion}_-- ]]; then


          mseCompletionType="param"
          #
          # Identifica o total de particulas usadas para designar o comando atual
          readarray -d ' ' -t mseCmdOriginalParticles <<< "${mseCmdOriginalVersion}"
          #
          # Identifica o total de partículas que devem ser ignoradas...
          mseOffSetParticles="${#mseCmdOriginalParticles[@]}"


          #
          # Calcula a posição do parametro sendo digitado neste momento
          # - Subtrai 1 para ignorar a primeira particula (mse).
          # - Subtrai 1 para ignorar o identificador de terminação de comandos '--'.
          ((mseCurrentParameterIndex = mseTotalTerminalParticles - mseOffSetParticles - 2))
          break

        #
        # Senão, verifica se o comando digitado no prompt está contido na
        # versão de comparação do comando atualmente sendo avaliado. Sempre que
        # isto for verdadeiro, irá identificar a próxima partícula e oferece-la
        # como provável próxima parte.
        elif [[ "${mseCmdCompareVersion}" =~ ^${mseCmdSearchBy} ]]; then

          #
          # Identifica com precisão a parte do comando digitada até o momento
          # pegando da versão original uma quantidade de caracteres compatível
          # com a quantidade de caracteres que foi encontrado no prompt.
          mseAtualPromptCmd="${mseCmdOriginalVersion:0:${#mseCmdSearchBy}}"

          #
          # A partir do comando que está sendo digitado no prompt, será feito
          # um 'split' por cada uma de suas partículas e o mesmo será feito com
          # relação à versão original do comando com o qual este foi comparado.
          readarray -d ' ' -t mseCmdAtualParticles <<< "${mseAtualPromptCmd} "
          readarray -d ' ' -t mseCmdOriginalParticles <<< "${mseCmdOriginalVersion} "


          #
          # A partir dos arrays populados acima, identifica o primeiro item
          # discordante entre o comando original e o que está no prompt.
          # O item encontrado deverá ser oferecido como próximo a ser digitado.
          for mseIndex in "${!mseCmdOriginalParticles[@]}"; do
            if [ "${mseCmdOriginalParticles[$mseIndex]}" != "${mseCmdAtualParticles[$mseIndex]}" ]; then
              mseCmdNextParticle="${mseCmdOriginalParticles[$mseIndex]}"
              break;
            fi
          done

        fi
      fi


      if [ "${mseCmdNextParticle}" != "" ]; then
        mseArrCmdCompletionParticles["${mseCmdNextParticle}"]=""
      fi
    done



    #
    # Se ainda está no modo de completar comandos
    if [ "${mseCompletionType}" == "cmd" ]; then
      #
      # Conforme o tipo de output requerido ...
      if [ "${mseCompletionMode}" == "F" ]; then
        COMPREPLY+=("${!mseArrCmdCompletionParticles[@]}")
      elif [ "${mseCompletionMode}" == "C" ]; then
        printf "%s\n" "${!mseArrCmdCompletionParticles[@]}"
      fi

    #
    # Senão, se está no modo de auxilio de preenchimento de parametros...
    elif [ "${mseCompletionType}" == "param" ]; then

      #
      # Apenas se existe um validador para a função atualmente sendo evocada.
      local mseValidateFunctionName="${MSE_GLOBAL_CMD[${mseCmdOriginalVersion}]}_vldtr"
      if [ "$(type -t "${mseValidateFunctionName}")" == "function" ]; then
        #
        # Evoca a função validadora para que ela preencha o array
        # associativo com as definições de cada parametro esperado.
        unset MSE_GLOBAL_VALIDATE_PARAMETERS_RULES
        declare -gA MSE_GLOBAL_VALIDATE_PARAMETERS_RULES
        "${mseValidateFunctionName}"

        #
        # Verifica se o parametro sendo digitado no momento está dentro dos que
        # são esperados...
        if [ "${mseCurrentParameterIndex}" -lt "${MSE_GLOBAL_VALIDATE_PARAMETERS_RULES[count]}" ]; then
          #
          # Explita as configurações do parametro atual
          # e usa as informações para formatar a linha de dica de preenchimento...
          mse_str_split "::" "${MSE_GLOBAL_VALIDATE_PARAMETERS_RULES[param_${mseCurrentParameterIndex}]}"
          local mseTipParam=""
          local mseStrRequired=""

          local mseParamName=$(mse_str_trim "${MSE_GLOBAL_MODULE_SPLIT_RESULT[0]}")
          local mseParamRequired=$(mse_str_trim "${MSE_GLOBAL_MODULE_SPLIT_RESULT[1]}")
          local mseParamType=$(mse_str_trim "${MSE_GLOBAL_MODULE_SPLIT_RESULT[2]}")
          local mseParamDescription=$(mse_str_trim "${MSE_GLOBAL_VALIDATE_PARAMETERS_RULES[param_desc_${mseCurrentParameterIndex}]}")
          local mseParamListLabels=$(mse_str_trim "${MSE_GLOBAL_VALIDATE_PARAMETERS_RULES[param_${mseCurrentParameterIndex}_labels]}")


          if [ "${mseParamRequired}" == "r" ]; then
            mseStrRequired="*"
          fi

          mseTipParam="@ [${mseParamType}] ${mseParamName}${mseStrRequired}"




          #
          # Define o tamanho máximo de uma linha de dica
          local mseDescTotalColumns="${COLUMNS}"
          if [ "${mseDescTotalColumns}" -gt 120 ]; then
            mseDescTotalColumns="120"
          fi


          #
          # Havendo uma descrição para o parametro, efetua o ajuste da mensagem e atualiza o contador
          # de linhas para que estas informações possam ser apagadas posteriormente
          mse_mmod_ini_cmd_clearLastTip
          MSE_GLOBAL_COMPLETION_LINES_IN_LAST_TIP="1"
          if [ "${mseParamDescription}" != "" ]; then
            mse_str_splitInLines "${mseParamDescription}" "${mseDescTotalColumns}"

            MSE_GLOBAL_COMPLETION_LINES_IN_LAST_TIP="${#MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}"
            ((MSE_GLOBAL_COMPLETION_LINES_IN_LAST_TIP = MSE_GLOBAL_COMPLETION_LINES_IN_LAST_TIP + 1))

            local mseDescLine=""
            mseParamDescription=""
            for mseDescLine in "${MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}"; do
              mseParamDescription+="\n\e[2K${mseDescLine}"
            done
          fi



          #
          # Sendo um valor do tipo booleano
          if [ "${mseParamType}" == "bool" ]; then
            mseParamDescription+="\n\e[2K${lbl_cmd_completion_param_pickBool}"
            ((MSE_GLOBAL_COMPLETION_LINES_IN_LAST_TIP = MSE_GLOBAL_COMPLETION_LINES_IN_LAST_TIP + 1))
          fi
          #
          # Havendo uma lista de valores aceitos como válidos, inclui estas informações
          # junto à dica de preenchimento que será mostrada para o usuário
          # Tratando-se de uma lista de valores, recupera os 'labels' definidos
          if [ "${mseParamListLabels}" != "" ]; then
            mse_str_splitInLines "${mseParamListLabels}" "${mseDescTotalColumns}"
            local mseCountLines="${#MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}"

            ((MSE_GLOBAL_COMPLETION_LINES_IN_LAST_TIP = MSE_GLOBAL_COMPLETION_LINES_IN_LAST_TIP + mseCountLines + 1))

            local mseDescLine=""
            mseParamDescription+="\n\e[2K${lbl_cmd_completion_param_pickOption}"
            for mseDescLine in "${MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}"; do
              mseParamDescription+="\n\e[2K${mseDescLine}"
            done
          fi




          #
          # O comando abaixo efetua as seguintes ações:
          #   - \e7   : salva a posição e atributos atuais do cursor
          #   - \n    : gera uma nova linha (levando o cursor até o início da mesma)
          #   -       : printa a dica de preenchimento.
          #   - \e[2K : limpa totalmente a linha
          #   - \e8   : restaura a posição original do cursor
          # Salva a posição e atributos atuais do cursor além de gerar uma
          # nova linha e
          printf "\e7\n\e[2K${mseTipParam}${mseParamDescription}\e8"
        fi

      fi
    fi
  fi
}



if [ "${SHELL##*/}" == "bash" ] && ([ "${MSE_GLOBAL_COMPLETION_MODE}" == "C" ] || [ "${MSE_GLOBAL_COMPLETION_MODE}" == "F" ]); then
  complete "-${MSE_GLOBAL_COMPLETION_MODE}" "mse_mmod_ini_completion_bash" "mse"
fi
